module String.Segmentation.V exposing (chars, parser)

import Parser exposing (Parser)
import String.Segmentation.RangeSet as RangeSet exposing (RangeSet)
import String.Segmentation.RangeSet.Range as Range


parser : Parser ()
parser =
    Parser.chompIf (\c -> RangeSet.member c chars)


chars : RangeSet Char
chars =
    RangeSet.fromList
        [ Range.range 'ᅠ' 'ᆧ' -- Lo  [72] HANGUL JUNGSEONG FILLER..HANGUL JUNGSEONG O-YAE
        , Range.range 'ힰ' 'ퟆ' -- Lo  [23] HANGUL JUNGSEONG O-YEO..HANGUL JUNGSEONG ARAEA-E
        ]
