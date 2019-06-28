module String.Segmentation.Prepend exposing (match, parser)

import Parser exposing (Parser)


parser : Parser ()
parser =
    Parser.chompIf match


match : Char -> Bool
match char =
    let
        c =
            Char.toCode char
    in
    (c >= 0x0600 && c <= 0x0605)
        || (c == 0x06DD)
        || (c == 0x070F)
        || (c == 0x08E2)
        || (c == 0x0D4E)
        || (c == 0x000110BD)
        || (c == 0x000110CD)
        || (c >= 0x000111C2 && c <= 0x000111C3)
        || (c == 0x00011A3A)
        || (c >= 0x00011A84 && c <= 0x00011A89)
        || (c == 0x00011D46)
