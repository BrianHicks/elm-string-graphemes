module String.Segmentation.Hangul exposing (parser)

import Parser exposing ((|.), Parser, Step(..), backtrackable, chompWhile, oneOf)
import String.Segmentation.Data.L as L
import String.Segmentation.Data.LV as LV
import String.Segmentation.Data.LVT as LVT
import String.Segmentation.Data.T as T
import String.Segmentation.Data.V as V


parser : Parser ()
parser =
    Parser.oneOf
        [ backtrackable (chompWhile L.match)
            |. oneOf
                [ V.parser |. chompWhile V.match
                , LV.parser |. chompWhile V.match
                , LVT.parser
                ]
            |. chompWhile T.match
        , L.parser |. chompWhile L.match
        , T.parser |. chompWhile T.match
        ]
