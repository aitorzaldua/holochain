#[hdk_extern]
pub fn get_all_game_code() -> ExternResult<Vec<String>> {
    let path: Path = (&Anchor {
        anchor_type: GAME_CODES_ANCHOR.into(),
        anchor_text: None,
    }).into();

    let all_game_codes_anchor_hash = path.hash()?;
    let links = get_links(all_game_codes_anchor_hash, None)?;
    let game_codes: Vec<String> = vec![];

    for link in links.into_inner() {
        if let Some(element) = get(link.target, GetOptions::default()) {
            let game_code: Option<GameCode> = element.entry().to_app_option()?;
             if let Some(code) = game_code {
                 game_codes.push(code);
             }
        }
    }

    return game_codes;
} 