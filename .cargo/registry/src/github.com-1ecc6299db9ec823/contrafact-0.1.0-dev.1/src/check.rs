/// The result of a check operation, which contains an error message for every
/// constraint which was not met.
//
// TODO: add ability to abort, so that further checks will not occur
#[derive(Debug, Clone, PartialEq, Eq, Hash, derive_more::From, derive_more::IntoIterator)]
#[must_use = "Check should be used with either `.unwrap()` or `.result()`"]
pub struct Check {
    errors: Vec<String>,
}

impl Check {
    /// Map over each error string.
    /// Useful for combinators which add additional context to errors produced
    /// by inner facts.
    pub fn map<F>(self, f: F) -> Self
    where
        F: FnMut(String) -> String,
    {
        if let Err(errs) = self.result() {
            errs.into_iter().map(f).collect()
        } else {
            vec![]
        }
        .into()
    }

    /// Panic if there are any errors, and display those errors.
    pub fn unwrap(self) {
        if !self.errors.is_empty() {
            let msg = if self.errors.len() == 1 {
                format!("Check failed: {}", self.errors[0])
            } else {
                format!("Check failed: {:#?}", self.errors)
            };
            panic!(msg);
        }
    }

    /// There are no errors.
    pub fn is_ok(&self) -> bool {
        self.errors.is_empty()
    }

    /// There is at least one error.
    pub fn is_err(&self) -> bool {
        !self.is_ok()
    }

    /// Convert to a Result: No errors => Ok
    ///
    /// ```
    /// use contrafact::*;
    /// assert_eq!(Check::pass().result(), Ok(()));
    /// assert_eq!(Check::fail("message").result(), Err(vec!["message".to_string()]));
    /// ```
    pub fn result(self) -> std::result::Result<(), Vec<String>> {
        if self.is_ok() {
            std::result::Result::Ok(())
        } else {
            std::result::Result::Err(self.errors)
        }
    }

    /// Create a single-error failure if predicate is false, otherwise pass
    ///
    /// ```
    /// use contrafact::*;
    /// assert_eq!(Check::check(true, "message"), Check::pass());
    /// assert_eq!(Check::check(false, "message"), Check::fail("message"));
    /// ```
    pub fn check<S: ToString>(ok: bool, err: S) -> Self {
        if ok {
            Self::pass()
        } else {
            Self::fail(err)
        }
    }

    /// Create an ok result.
    ///
    /// ```
    /// use contrafact::*;
    /// assert_eq!(Check::pass(), vec![].into())
    /// ```
    pub fn pass() -> Self {
        Self {
            errors: Vec::with_capacity(0),
        }
    }

    /// Create a failure result with a single error.
    ///
    /// ```
    /// use contrafact::*;
    /// assert_eq!(Check::fail("message"), vec!["message".to_string()].into())
    /// ```
    pub fn fail<S: ToString>(error: S) -> Self {
        Self {
            errors: vec![error.to_string()],
        }
    }
}

type CheckResult = crate::Result<Check>;

impl From<CheckResult> for Check {
    fn from(result: CheckResult) -> Check {
        match result {
            Ok(check) => check,
            Err(err) => vec![err.to_string()].into(),
        }
    }
}

/// Helper macro to run a check which may produce a Result, mapping any Err into
/// a normal Check error string.
///
/// ```
/// use contrafact::*;
///
/// // This is most useful when implementing [`Fact::check`]
/// let check: Check = check_fallible! {{
///     Err(anyhow::Error::msg("message"))?;
///     Ok(Check::pass())
/// }};
/// assert_eq!(check, Check::fail("message"));
/// ```
#[macro_export]
macro_rules! check_fallible {
    ($blk:block) => {{
        let result: $crate::Result<Check> = (|| $blk)();
        Check::from(result)
    }};
}

#[cfg(test)]
mod tests {
    use crate::Fact;

    use super::*;

    #[test]
    fn test_check_fallible() {
        struct F;
        impl Fact<()> for F {
            fn check(&self, _: &()) -> Check {
                check_fallible! {{
                    let x = 1;
                    Ok(if x == 1 {
                        Err(anyhow::Error::msg("oh no"))?
                    } else {
                        Check::pass()
                    })
                }}
            }

            fn mutate(&self, _: &mut (), _: &mut arbitrary::Unstructured<'static>) {
                unimplemented!()
            }

            fn advance(&mut self, _: &()) {}
        }

        assert_eq!(F.check(&()).result().unwrap_err(), vec!["oh no"]);
    }
}
