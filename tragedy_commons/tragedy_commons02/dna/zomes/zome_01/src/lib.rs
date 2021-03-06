use hdk::prelude::*;
use hdk::prelude::holo_hash::*;

#[hdk_entry(id = "post")]
pub struct Book {
    title: String,
    content: String,
};

entry_defs![
    Post::entry_def()
];

#[hdk_extern]
pub fn create_post (external_input: Post) -> ExternResult<EntryHashB64> {
    let book: Book = external_input;
    let _unused_var: HeaderHash = create_entry(&book)?;
    let entry_hash: EntryHash = hash_entry(&book)?;

    Ok(EntryHashB64::from(entry_hash))
}

#[hdk_extern]
pub fn get_post(entry_hash: EntryHashB64) -> ExternResult<Post> {
    let element = get(EntryHash::from(entry_hash), GetOptions::default())?.ok_or(WasmError::Guest(String::from("Post not found")))?;

    let post: Post = element.entry().to_app_option()?.ok_or(WasmError::Guest(String::from("Malformed post")))?;

    Ok(post)
}
