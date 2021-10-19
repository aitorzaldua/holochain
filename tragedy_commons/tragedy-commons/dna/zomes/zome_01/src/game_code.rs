use hdk::prelude::*;

//Anchor
pub const  GAME_CODES_ANCHOR: &str = "GAME_CODES";

//Objetivo de la función:
//1.- Con el hard_code del anchor principal, el primer usuario crea un anchor para la partida.
//2.- Recibe un string shor_unique_code --que introduce el agente -- y devuelve un hash o un error
pub fn create_game_code_anchor(short_unique_code: String) -> ExternResult<EntryHash> {

    //Se crea la variable anchor que linka la constante GAME_CODES_ANCHOR con short_unique_code
    //como GAME_CODES_ANCHOR es tipo &str se usa into() para convertir al tipo que necesita anchor()
    let anchor = anchor(GAME_CODES_ANCHOR.into(), short_unique_code)?;

    Ok(anchor)
}

//El segundo jugador se une a la partida. Debe encontrat el anchor
//game_code es una entrada del segundo jugador.
pub fn get_game_code_anchor(game_code: String) -> ExternResult<EntryHash> {

    //la función devuelve el hash creado por anchor()->
    anchor(GAME_CODES_ANCHOR.into(), game_code.clone())


}
