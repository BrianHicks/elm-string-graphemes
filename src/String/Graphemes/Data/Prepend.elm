module String.Graphemes.Data.Prepend exposing (chars, match, parser)

{-| Hey, this module was generated automatically. Please don't edit it.

Run `make src/String/Graphemes/Data/Prepend.elm` instead!

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


chars : RangeDict Char ()
chars =
    (Result.withDefault RangeDict.empty << Parser.run (Data.parser ()))
        "2؀؅1۝1܏1࣢1ൎ1𑂽1𑃍2𑇂𑇃1𑨺2𑪄𑪉1𑵆"