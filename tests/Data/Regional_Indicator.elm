module Data.Regional_Indicator exposing (chars)


chars : List Char
chars =
    List.concat
        [ List.map Char.fromCode (List.range 0x0001F1E6 0x0001F1FF) -- So  [26] REGIONAL INDICATOR SYMBOL LETTER A..REGIONAL INDICATOR SYMBOL LETTER Z
        ]
