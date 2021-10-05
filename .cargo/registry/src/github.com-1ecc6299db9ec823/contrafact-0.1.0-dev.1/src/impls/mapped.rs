use std::sync::Arc;

use arbitrary::Unstructured;

use crate::{check_fallible, fact::Bounds, Check, Fact, Facts};

/// A version of [`mapped`] whose closure returns a Result
pub fn mapped_fallible<'a, T, F, S>(reason: S, f: F) -> MappedFact<'a, T>
where
    S: ToString,
    T: Bounds,
    F: 'static + Fn(&T) -> crate::Result<Facts<'a, T>>,
{
    MappedFact::new(reason.to_string(), f)
}

/// A fact which is defined based on the data to which it is applied. It maps
/// the data into a fact to be applied.
///
/// This can be useful for "piecewise" functions, where the
/// constraint is fundamentally different depending on the shape of the data,
/// or when wanting to set some subset of data to match some other subset of
/// data, without caring what the value actually is, and without having to
/// explicitly construct the value.
///
/// **NOTE**: since the returned Facts are generated brand-new on-the-fly,
/// these Facts must be stateless. State changes cannot be carried over to
/// subsequent calls when running over a sequence.
/// (TODO: add `StatelessFact` trait to give type-level protection here.)
///
/// ```
/// use contrafact::*;
///
/// // This contrived fact reads:
/// //   "if the number is greater than 9000,
/// //    ensure that it's also divisible by 9,
/// //    and otherwise, ensure that it's divisible by 10"
/// let fact = mapped("reason", |n: &u32| {
///     if *n > 9000 {
///         facts![ brute("divisible by 9", |n| *n % 9 == 0) ]
///     } else {
///         facts![ brute("divisible by 10", |n| *n % 10 == 0) ]
///     }
/// });
///
/// assert!(fact.check(&50).is_ok());
/// assert!(fact.check(&99).is_err());
/// assert!(fact.check(&9009).is_ok());
/// assert!(fact.check(&9010).is_err());
/// ```
pub fn mapped<T, F, S>(reason: S, f: F) -> MappedFact<'static, T>
where
    S: ToString,
    T: Bounds,
    F: 'static + Fn(&T) -> Facts<'static, T>,
{
    MappedFact::new(reason.to_string(), move |x| Ok(f(x)))
}

/// A fact which is mapped from the data to be checked/mutated.
/// Use [`mapped`] to construct.
#[derive(Clone)]
pub struct MappedFact<'a, T> {
    reason: String,
    f: Arc<dyn 'a + Fn(&T) -> crate::Result<Facts<'a, T>>>,
}

impl<'a, T> Fact<T> for MappedFact<'a, T>
where
    T: Bounds,
{
    fn check(&self, t: &T) -> Check {
        check_fallible! {{
            Ok((self.f)(t)?
            .check(t)
            .map(|e| format!("mapped({}) > {}", self.reason, e)))
        }}
    }

    fn mutate(&self, t: &mut T, u: &mut Unstructured<'static>) {
        (self.f)(t).expect("TODO: fallible mutation").mutate(t, u)
    }

    fn advance(&mut self, _: &T) {}
}

impl<'a, T> MappedFact<'a, T> {
    pub(crate) fn new<F: 'a + Fn(&T) -> crate::Result<Facts<'a, T>>>(reason: String, f: F) -> Self {
        Self {
            reason,
            f: Arc::new(f),
        }
    }
}

#[test]
fn test_mapped_fact() {
    use crate::*;
    type T = (u8, u8);

    let numbers = vec![(1, 11), (2, 22), (3, 33), (4, 44)];

    // This fact says:
    // if the first element of the tuple is even,
    //     then the second element must be divisible by 3;
    // and if the first element is odd,
    //     then the second element must be divisible by 4.
    let divisibility_fact = || {
        mapped("reason", |t: &T| {
            facts![lens(
                "T.1",
                |(_, n)| n,
                if t.0 % 2 == 0 {
                    brute("divisible by 3", |n: &u8| n % 3 == 0)
                } else {
                    brute("divisible by 4", |n: &u8| n % 4 == 0)
                }
            ),]
        })
    };
    assert_eq!(
        dbg!(check_seq(numbers.as_slice(), divisibility_fact())
            .result()
            .unwrap_err()),
        vec![
            "item 0: mapped(reason) > lens(T.1) > divisible by 4".to_string(),
            "item 1: mapped(reason) > lens(T.1) > divisible by 3".to_string(),
            "item 2: mapped(reason) > lens(T.1) > divisible by 4".to_string(),
            "item 3: mapped(reason) > lens(T.1) > divisible by 3".to_string(),
        ]
    );

    let mut u = Unstructured::new(&NOISE);

    let composite_fact = || {
        facts![
            lens("T.0", |(i, _)| i, consecutive_int("increasing", 0)),
            divisibility_fact(),
        ]
    };

    let built = build_seq(&mut u, 12, composite_fact());
    dbg!(&built);
    check_seq(built.as_slice(), composite_fact()).unwrap();
}
