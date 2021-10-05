use arbitrary::*;
use contrafact::*;

pub static NOISE: once_cell::sync::Lazy<Vec<u8>> = once_cell::sync::Lazy::new(|| {
    use rand::Rng;
    let mut rng = rand::thread_rng();
    std::iter::repeat_with(|| rng.gen()).take(999999).collect()
});

#[derive(Arbitrary, Debug, Clone, PartialEq, Eq, std::hash::Hash)]
enum Color {
    Cyan,
    Magenta,
    Yellow,
    Black,
}

#[derive(Arbitrary, Debug, PartialEq, Clone)]
struct Link {
    prev: u32,
    author: String,
}

#[derive(Arbitrary, Debug, PartialEq, Clone)]
struct Wrapper {
    color: Color,
    link: Link,
}

/// Fact: all Links in a chain are by the same `author`, and any chain link has
/// consecutive `prev` values starting with 0.
fn chain_fact<'a>(author: &'a String) -> Facts<'a, Link> {
    facts![
        lens(
            "Link::author",
            |o: &mut Link| &mut o.author,
            eq("same author", author),
        ),
        lens(
            "Link::prev",
            |o: &mut Link| &mut o.prev,
            consecutive_int("increasing prev", 0),
        ),
    ]
}

/// Fact: the Links within each wrapper form a valid chain, and the color
/// of the wrapper is in the given set.
fn wrapper_fact<'a>(author: &'a String, valid_colors: &'a [Color]) -> Facts<'a, Wrapper> {
    facts![
        lens(
            "Wrapper::color",
            |o: &mut Wrapper| &mut o.color,
            in_iter("valid color", valid_colors),
        ),
        lens(
            "Wrapper::link",
            |o: &mut Wrapper| &mut o.link,
            chain_fact(author),
        ),
    ]
}

#[test]
fn test_link() {
    observability::test_run().ok();
    let mut u = Unstructured::new(&NOISE);

    const NUM: u32 = 10;
    let author = "alice".to_string();
    let fact = || chain_fact(&author);

    let mut chain = build_seq(&mut u, NUM as usize, fact());
    dbg!(&chain);
    check_seq(chain.as_mut_slice(), fact()).unwrap();

    assert!(chain.iter().all(|c| c.author == "alice"));
    assert_eq!(chain.iter().last().unwrap().prev, NUM - 1);
}

#[test]
fn test_wrapper() {
    observability::test_run().ok();
    let mut u = Unstructured::new(&NOISE);

    const NUM: u32 = 10;
    let author = "alice".to_string();
    let fact = || wrapper_fact(&author, &[Color::Cyan, Color::Magenta]);

    let mut chain = build_seq(&mut u, NUM as usize, fact());
    dbg!(&chain);
    check_seq(chain.as_mut_slice(), fact()).unwrap();

    assert!(chain.iter().all(|c| c.link.author == "alice"));
    assert!(chain.iter().all(|c| c.color != Color::Black));
    assert_eq!(chain.iter().last().unwrap().link.prev, NUM - 1);

    // there is a high probability that this will be true
    assert!(chain.iter().any(|c| c.color == Color::Magenta));
}
