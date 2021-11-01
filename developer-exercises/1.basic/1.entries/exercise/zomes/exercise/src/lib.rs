use hdk::prelude::*;

//Entry_defs
entry_defs![
 Greetings::entry_def()
];

//Structs
#[derive(Serialize, Deserialize, Clone, Debug)]
pub struct SomeExternalInput {
    content: String,
}

#[hdk_entry(id = "greetings")]
pub struct Greetings(String);


//Functions
#[hdk_extern]
pub fn say_greeting(external_input: SomeExternalInput) -> ExternResult<HeaderHash> {

    let output: Greetings = Greetings(external_input.content);

    create_entry(output)
}
