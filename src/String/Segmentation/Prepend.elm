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
    (c >= 1536 && c <= 1541)
        || (c == 1757)
        || (c == 1807)
        || (c == 2274)
        || (c == 3406)
        || (c == 69821)
        || (c == 69837)
        || (c >= 70082 && c <= 70083)
        || (c == 72250)
        || (c >= 72324 && c <= 72329)
        || (c == 73030)
