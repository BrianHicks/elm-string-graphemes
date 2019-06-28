module Data.CR exposing (chars)


chars : List Char
chars =
    List.concat
        [ [ '\u{000D}' ] -- Cc       <control-000D>
        ]
