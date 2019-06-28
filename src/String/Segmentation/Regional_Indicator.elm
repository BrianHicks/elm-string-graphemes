module String.Segmentation.Regional_Indicator exposing (chars, parser)

import Parser exposing (Parser)
import String.Segmentation.RangeSet as RangeSet exposing (RangeSet)
import String.Segmentation.RangeSet.Range as Range


parser : Parser ()
parser =
    Parser.chompIf (\c -> RangeSet.member c chars)


chars : RangeSet Char
chars =
    RangeSet.fromList
        [ Range.range '🇦' '🇿' -- So  [26] REGIONAL INDICATOR SYMBOL LETTER A..REGIONAL INDICATOR SYMBOL LETTER Z
        ]
