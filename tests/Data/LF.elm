module Data.LF exposing (chars)


chars : List Char
chars =
    List.concat
        [ [ '\n' ] -- Cc       <control-000A>
        ]
