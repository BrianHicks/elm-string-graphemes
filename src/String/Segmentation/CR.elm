module String.Segmentation.CR exposing (chars, parser)

import Parser exposing (Parser)
import Set exposing (Set)


parser : Parser ()
parser =
    Parser.chompIf (\c -> Set.member c chars)


chars : Set Char
chars =
    (Set.fromList << List.concat)
        [ [ '\u{000D}' ] -- Cc       <control-000D>
        ]
