module String.Segmentation.T exposing (match, parser)

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
    (c >= 0x11A8 && c <= 0x11FF)
        || (c >= 0xD7CB && c <= 0xD7FB)
