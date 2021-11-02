use hdk::prelude::*;

//entry_defs
entry_defs![Book::entry_def()];


//Structs
#[derive(Serialize, Deserialize, Clone, Debug)]
pub struct SomeExternalInput {
    title: String,
    content: String,
}


#[hdk_entry(id = "book")]
pub struct Book {
    title: String,
    content: String,
}


//Functions
#[hdk_extern]
pub fn add_book(external_input: Book) -> ExternResult<EntryHash> { 
    create_entry(external_input.title, external_input.content)
}

#[hdk_extern]
pub fn get_book(external_input: EntryHash) -> ExternResult<Book> {
    unimplemented!()
}
