module String.Segmentation.T exposing (chars, parser)

import Parser exposing (Parser)
import String.Segmentation.RangeSet as RangeSet exposing (RangeSet)
import String.Segmentation.RangeSet.Range as Range


parser : Parser ()
parser =
    Parser.chompIf (\c -> RangeSet.member c chars)


chars : RangeSet Char
chars =
    RangeSet.fromList
        [ Range.range 'ᆨ' 'ᇿ' -- Lo  [88] HANGUL JONGSEONG KIYEOK..HANGUL JONGSEONG SSANGNIEUN
        , Range.range 'ퟋ' 'ퟻ' -- Lo  [49] HANGUL JONGSEONG NIEUN-RIEUL..HANGUL JONGSEONG PHIEUPH-THIEUTH
        ]
