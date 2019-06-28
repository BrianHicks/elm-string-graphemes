module Data.Prepend exposing (chars)


chars : List Char
chars =
    List.concat
        [ List.map Char.fromCode (List.range 0x0600 0x0605) -- Cf   [6] ARABIC NUMBER SIGN..ARABIC NUMBER MARK ABOVE
        , [ '\u{06DD}' ] -- Cf       ARABIC END OF AYAH
        , [ '\u{070F}' ] -- Cf       SYRIAC ABBREVIATION MARK
        , [ '\u{08E2}' ] -- Cf       ARABIC DISPUTED END OF AYAH
        , [ 'ൎ' ] -- Lo       MALAYALAM LETTER DOT REPH
        , [ '\u{110BD}' ] -- Cf       KAITHI NUMBER SIGN
        , [ '\u{110CD}' ] -- Cf       KAITHI NUMBER SIGN ABOVE
        , List.map Char.fromCode (List.range 0x000111C2 0x000111C3) -- Lo   [2] SHARADA SIGN JIHVAMULIYA..SHARADA SIGN UPADHMANIYA
        , [ '\u{11A3A}' ] -- Lo       ZANABAZAR SQUARE CLUSTER-INITIAL LETTER RA
        , List.map Char.fromCode (List.range 0x00011A84 0x00011A89) -- Lo   [6] SOYOMBO SIGN JIHVAMULIYA..SOYOMBO CLUSTER-INITIAL LETTER SA
        , [ '\u{11D46}' ] -- Lo       MASARAM GONDI REPHA
        ]
