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
    (c >= 4448 && c <= 4519)
        || (c >= 55216 && c <= 55238)
