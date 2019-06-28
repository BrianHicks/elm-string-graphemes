module String.Segmentation.L exposing (match, parser)

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
    (c >= 0x1100 && c <= 0x115F)
        || (c >= 0xA960 && c <= 0xA97C)
