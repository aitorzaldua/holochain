use hdk::prelude::*;
use hdk::prelude::holo_hash::*;

//se importa el script
mod game_code;

entry_defs![
    
];

//esto es el wrapper -> se importa la función
#[hdk_extern]
pub fn create_game_code_anchor(short_unique_code: String) -> ExternResult<EntryHash> {

    game_code::create_game_code_anchor(short_unique_code)
}
//cada función...
#[hdk_extern]
pub fn get_game_code_anchor(game_code: String) -> ExternResult<EntryHash> {

    game_code::get_game_code_anchor(game_code)

}

