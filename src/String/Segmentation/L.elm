module String.Segmentation.L exposing (chars, match, parser)

import Parser exposing (Parser)
import String.Segmentation.RangeSet as RangeSet exposing (RangeSet)
import String.Segmentation.RangeSet.Range as Range


parser : Parser ()
parser =
    Parser.chompIf match


match : Char -> Bool
match c =
    RangeSet.member c chars


chars : RangeSet Char
chars =
    RangeSet.fromList
        [ Range.range 'ᄀ' 'ᅟ' -- Lo  [96] HANGUL CHOSEONG KIYEOK..HANGUL CHOSEONG FILLER
        , Range.range 'ꥠ' 'ꥼ' -- Lo  [29] HANGUL CHOSEONG TIKEUT-MIEUM..HANGUL CHOSEONG SSANGYEORINHIEUH
        ]
