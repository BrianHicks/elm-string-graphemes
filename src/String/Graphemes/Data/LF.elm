module String.Graphemes.Data.LF exposing (chars, match)

{-| Hey, this module was generated automatically. Please don't edit it.

Run `make src/String/Graphemes/Data/LF.elm` instead!

-}

import String.Graphemes.Data as Data
import String.Graphemes.RangeDict as RangeDict exposing (RangeDict)
import String.Graphemes.RangeDict.Range as Range exposing (Range)


match : Char -> Bool
match c =
    RangeDict.member c chars


chars : RangeDict Char Data.Class
chars =
    (Result.withDefault RangeDict.empty << Data.parser Data.LF)
        "1\n"