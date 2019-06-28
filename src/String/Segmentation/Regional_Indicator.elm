module String.Segmentation.Regional_Indicator exposing (chars, parser)

import Parser exposing (Parser)
import Set exposing (Set)


parser : Parser ()
parser =
    Parser.chompIf (\c -> Set.member c chars)


chars : Set Char
chars =
    [ List.range 0x0001F1E6 0x0001F1FF -- So  [26] REGIONAL INDICATOR SYMBOL LETTER A..REGIONAL INDICATOR SYMBOL LETTER Z
    ]
        |> List.concat
        |> List.map Char.fromCode
        |> Set.fromList
