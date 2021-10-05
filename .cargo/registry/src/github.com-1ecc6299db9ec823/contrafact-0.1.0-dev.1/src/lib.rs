//! A trait for highly composable constraints ("facts") which can be used both
//! to verify data and to generate arbitrary data satisfying those constraints.
//!
//! This crate is mainly intended for use in writing tests, and in particular for generating meaningful fixture data. By defining composable, reusable constraints, they can be mixed and matched to handle the specific use cases of your tests. By defining what you need from a fixture rather than simply writing the fixture you need, the hope is that you save yourself duplicated effort over time.
//!
//! ## Example
//!
//! The following example defines a simple struct `S` with two fields, and a simple
//! Fact (constraint) about `S` which says that `S::x` must always equal `1`.
//! This Fact, like all Facts, can be used both to verify that an instance of `S`
//! meets the constraint, or to generate new instances of `S` which meet the constraint.
//!
//! ```
//! use contrafact::{Fact, eq, lens};
//! use arbitrary::{Arbitrary, Unstructured};
//!
//! #[derive(Debug, Clone, PartialEq, Arbitrary)]
//! struct S {
//!     x: u32,
//!     y: u32,
//! }
//!
//! let mut fact = lens("S::x", |s: &mut S| &mut s.x, eq("must be 1", &1));
//!
//! assert!(fact.check(&S {x: 1, y: 333}).is_ok());
//! assert!(fact.check(&S {x: 2, y: 333}).is_err());
//!
//! let mut u = Unstructured::new(&[0; 9999]);  // NB: don't actually construct Unstructured this way!
//! let a = fact.build(&mut u);
//! assert_eq!(a.x, 1);
//! ```
//!
//! ## Things to know
//!
//! The above example composes together existing Facts provided by this
//! crate. You can also define your own facts by hand by implementing the `Fact`
//! trait. *TODO: example of this.*
//!
//! `contrafact` leans heavily on the [`arbitrary`](https://docs.rs/arbitrary/1.0.0/arbitrary/) crate for
//! generating arbitrary data. Get to know this library, because you will need to implement `Arbitrary` for any
//! type you wish to write a [`Fact`](crate::Fact) about.
//!
//! Facts can be used to check if a constraint is matched via [`Fact::check()`] or [`check_seq`],
//! and also to build new values via [`Fact::build`] and [`build_seq`]. Building values requires
//! the use of `arbitrary::Unstructured`.
//!
//! Facts can also be stateful, such that the constraint changes while checking or building a sequence. *TODO: example of stateful fact.*
//!
//! Facts can be easily "horizontally" composed together through the [`facts!`] macro, which
//! boxes each Fact and lumps them together as trait objects, applying each fact one after the other.
//!
//! Facts can be "vertically" composed together through the [`lens`] and [`prism`]
//! combinators, which allow you to lift a Fact about one type into a Fact about another type.
//!
//! See the Functions documentation for more examples and detailed instructions
//! about each Fact defined by this crate.

#![warn(missing_docs)]

mod check;
mod fact;
mod impls;
mod satisfy;

pub use arbitrary;

pub use check::Check;
pub use fact::{BoxFact, Fact, Facts};
pub use satisfy::*;

pub use impls::primitives::{
    always, consecutive_int, consecutive_int_, eq, eq_, in_iter, in_iter_, ne, ne_, never, not,
    not_, or,
};

pub use impls::brute::{brute, brute_fallible, BruteFact};
pub use impls::lens::{lens, LensFact};
pub use impls::mapped::{mapped, mapped_fallible, MappedFact};
pub use impls::prism::{prism, PrismFact};

/// The Result type returnable when using [`check_fallible!`]
pub type Result<T> = anyhow::Result<T>;

pub(crate) const BRUTE_ITERATION_LIMIT: usize = 100;

#[cfg(any(test, feature = "test"))]
pub static NOISE: once_cell::sync::Lazy<Vec<u8>> = once_cell::sync::Lazy::new(|| {
    use rand::Rng;
    let mut rng = rand::thread_rng();
    std::iter::repeat_with(|| rng.gen()).take(999999).collect()
});
