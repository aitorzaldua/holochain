use hdk::prelude::*;
use crate::game_code::get_game_code_anchor;

pub const PLAYER_LINK_TAG: &str = "PLAYER";

//Holochain provee con hdk_entry la public_key y la hace publica
#[hdk_entry(id = "player_profile", visibility = "public")]
#[derive(Clone)]
//player_id lo crea el backend y es la public key del agente dentro de la app
//esta en la sourcechain
//nickname lo introduce el usuario desde la UI
pub struct  PlayerProfile {
    pub player_id: AgentPubKey,
    pub nickname: String,
}

//wrapper de la info de la partida para fn join_game_with_code
//¿¿¿¿?????
pub struct JoinGameInfo {
    pub gamecode: String,
    pub nickname: String,
}

//funcion que linka y almacena el nickname con la publickey
pub fn create_and_hash_entry_player_profile(nickname: String) -> ExternResult<EntryHash> {
    //agent_info() es una función del hdk
    //recupera los datos del agente
    //todos los agentes son diferentes
    let agent = agent_info()?;

    //El struct sirve para crear el perfil en rust pero necesitamos
    //almacenar el profile en el DHT
    let player_profile = PlayerProfile {
        player_id: agent.agent_initial_pubkey,
        nickname,
    };

    //create_entry escribe el player profile en la DHT
    create_entry(&player_profile)?;
    //hash_entry crea el hash y lo devuelve como resultado de la funcion
    //hash_entry NO escribe nada en el DHT 
    hash_entry(&player_profile)
}

//unirse a la partida
pub fn join_game_with_code (input: JoinGameInfo) -> ExternResult<EntryHash> {
    //lo primero es el anchor, exista o no exista (partida nueva)
    //llamada a get_game_code_anchor luego arriba use crate::game_code::get_game_code_anchor;
    let anchor = get_game_code_anchor(input.game_code)?;
    //Crear el user profile para el input recibido
    let player_profile_entry_hash = create_and_hash_entry_player_profile(input.nickname);
    //crear el link entre el anchor y el player_profile_entry_hash
    //create_link esta en la hdk
    //1er param: link base, donde empieza.
    //2do: destino.
    //3er: link tag -> constante definida, un tag del link ->
    //pub const PLAYER_LINK_TAG: &str = "PLAYER";
    create_link(
        anchor.clone().into(),
        player_profile_entry_hash.into(),
        LinkTag::new(String::from(PLAYER_LINK_TAG)),
    )?;
    Ok(anchor)
}

//Recuperar la lista de usuarios
//Formateo diferente para la funcion
pub fn get_player_profile_for_game_code(
    short_unique_code: String,
) -> ExternResult<Vec<PlayerProfile>> {
    let anchor = get_game_code_anchor(short_unique_code)?;
    //get_links es del hdk
    //reupera los links con tag PLAYER_LINK_TAG
    //si se quiere TODOS los links, el segundo parametro peude ser None:
    //get_links(anchor,None)
    let links: Links = get_links(anchor, Some(LinkTag::new(String::from(PLAYER_LINK_TAG ))))?;
    //Data tranformation para pasar los links al vector
    let mut players = vec![];
    for link in links.into_inner() {
        debug!("link: {:?}", link);
        //Element es la combinacion de dataheader y dataentry
        //get es una funcion del hdk
        let element: Element = get(link.target, GetOptions::default())?
            .ok_or(WasmError::Guest(String__from("Entry nor found")))?;
        let entry_option = element.entry().to_app_option()?;
        let entry: PlayerProfile = entry_option.ok_or(WasmError::Guest(
            "The targeted entry is not agent pubkey".into(),
        ))?;
        players.push(entry);
    }
    Ok(players)
}