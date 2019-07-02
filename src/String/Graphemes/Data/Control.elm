module String.Graphemes.Data.Control exposing (chars, match, parser)

{-| Hey, this module was generated automatically. Please don't edit it.

Run `make src/String/Graphemes/Data/Control.elm` instead!

-}

import Parser exposing (Parser)
import String.Graphemes.Data as Data
import String.Graphemes.RangeDict as RangeDict exposing (RangeDict)
import String.Graphemes.RangeDict.Range as Range exposing (Range)


parser : Parser ()
parser =
    Parser.chompIf match


match : Char -> Bool
match c =
    RangeDict.member c chars


chars : RangeDict Char
chars =
    (Result.withDefault RangeDict.empty << Parser.run Data.parser)
        "2\u{0000}\u{0009}2\u{000b}\u{000c}2\u{000e}\u{001f}2\u{007f}\u{009f}1\u{00ad}1\u{061c}1\u{180e}1\u{200b}2\u{200e}\u{200f}1\u{2028}1\u{2029}2\u{202a}\u{202e}2\u{2060}\u{2064}1\u{2065}2\u{2066}\u{206f}1\u{feff}2\u{fff0}\u{fff8}2\u{fff9}\u{fffb}2\u{13430}\u{13438}2\u{1bca0}\u{1bca3}2\u{1d173}\u{1d17a}1\u{e0000}1\u{e0001}2\u{e0002}\u{e001f}2\u{e0080}\u{e00ff}2\u{e01f0}\u{e0fff}"