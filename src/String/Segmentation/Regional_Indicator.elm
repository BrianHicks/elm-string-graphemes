module String.Segmentation.Regional_Indicator exposing (match, parser)

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
    c >= 0x0001F1E6 && c <= 0x0001F1FF
