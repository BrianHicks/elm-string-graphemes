module String.Graphemes.Data.T exposing (chars, match, parser)

{-| Hey, this module was generated automatically. Please don't edit it.

Run `make src/String/Graphemes/Data/T.elm` instead!

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
        [ ( 'ᆨ', 'ᇿ' ) -- Lo  [88] HANGUL JONGSEONG KIYEOK..HANGUL JONGSEONG SSANGNIEUN
        , ( 'ퟋ', 'ퟻ' ) -- Lo  [49] HANGUL JONGSEONG NIEUN-RIEUL..HANGUL JONGSEONG PHIEUPH-THIEUTH
        ]
