module String.Graphemes.Data.L exposing (chars, match, parser)

{-| Hey, this module was generated automatically. Please don't edit it.

Run `make src/String/Graphemes/Data/L.elm` instead!

-}

import Parser exposing (Parser)
import String.Graphemes.RangeSet as RangeSet exposing (RangeSet)
import String.Graphemes.RangeSet.Range as Range exposing (Range)


parser : Parser ()
parser =
    Parser.chompIf match


match : Char -> Bool
match c =
    RangeSet.member c chars


chars : RangeSet Char
chars =
    RangeSet.fromList ranges


ranges : List (Range Char)
ranges =
    List.map (\( low, high ) -> Range.range low high)
        [ ( 'ᄀ', 'ᅟ' ) -- Lo  [96] HANGUL CHOSEONG KIYEOK..HANGUL CHOSEONG FILLER
        , ( 'ꥠ', 'ꥼ' ) -- Lo  [29] HANGUL CHOSEONG TIKEUT-MIEUM..HANGUL CHOSEONG SSANGYEORINHIEUH
        ]
