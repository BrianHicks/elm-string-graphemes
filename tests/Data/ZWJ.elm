module Data.ZWJ exposing (chars)


chars : List Char
chars =
    List.concat
        [ [ '\u{200D}' ] -- Cf       ZERO WIDTH JOINER
        ]
