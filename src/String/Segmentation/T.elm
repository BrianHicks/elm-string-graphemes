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
    (c >= 4520 && c <= 4607)
        || (c >= 55243 && c <= 55291)
