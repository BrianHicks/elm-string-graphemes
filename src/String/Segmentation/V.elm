module String.Segmentation.V exposing (match, parser)

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
    (c >= 0x1160 && c <= 0x11A7)
        || (c >= 0xD7B0 && c <= 0xD7C6)
