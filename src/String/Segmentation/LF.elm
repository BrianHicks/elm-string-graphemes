module String.Segmentation.LF exposing (chars, parser)

import Parser exposing (Parser)
import Set exposing (Set)


parser : Parser ()
parser =
    Parser.chompIf (\c -> Set.member c chars)


chars : Set Char
chars =
    [ [ 0x0A -- Cc       <control-000A>
      ]
    ]
        |> List.concat
        |> List.map Char.fromCode
        |> Set.fromList
