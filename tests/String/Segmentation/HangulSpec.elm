module String.Segmentation.HangulSpec exposing (hangulFuzzer, parserSpec)

import Expect
import Fuzz exposing (Fuzzer, list, oneOf)
import Parser exposing ((|.))
import RangeSetFuzzer
import String.Segmentation.Data.L as L
import String.Segmentation.Data.LV as LV
import String.Segmentation.Data.LVT as LVT
import String.Segmentation.Data.T as T
import String.Segmentation.Data.V as V
import String.Segmentation.Hangul as Hangul
import Test exposing (..)


parserSpec : Test
parserSpec =
    describe "parser"
        [ fuzz hangulFuzzer "hangul characters should be parsed properly" <|
            \kindsAndStrings ->
                -- we don't use kinds at all here, it's just for seeing what the
                -- input was in a failing test. Very useful for me, a non-Korean
                -- speaker. 😅
                let
                    string =
                        kindsAndStrings
                            |> List.map Tuple.second
                            |> String.join ""
                in
                string
                    |> Parser.run
                        (Parser.getChompedString Hangul.parser
                            |. Parser.end
                        )
                    |> Expect.equal (Ok string)
        ]


{-| The kinds here are directly from TR29. They're not great names, but they
match the spec and that's useful for understanding and debugging!

<http://www.unicode.org/reports/tr29/#Table_Combining_Char_Sequences_and_Grapheme_Clusters>

-}
type Kind
    = L
    | V
    | T
    | LV
    | LVT


l : Fuzzer ( Kind, String )
l =
    RangeSetFuzzer.fromChars L.chars
        |> Fuzz.map (Tuple.pair L)


v : Fuzzer ( Kind, String )
v =
    RangeSetFuzzer.fromChars V.chars
        |> Fuzz.map (Tuple.pair V)


t : Fuzzer ( Kind, String )
t =
    RangeSetFuzzer.fromChars T.chars
        |> Fuzz.map (Tuple.pair T)


lv : Fuzzer ( Kind, String )
lv =
    RangeSetFuzzer.fromChars LV.chars
        |> Fuzz.map (Tuple.pair LV)


lvt : Fuzzer ( Kind, String )
lvt =
    RangeSetFuzzer.fromChars LVT.chars
        |> Fuzz.map (Tuple.pair LVT)


hangulFuzzer : Fuzzer (List ( Kind, String ))
hangulFuzzer =
    oneOf
        [ Fuzz.map3 (\begin middle end -> begin ++ middle ++ end)
            (list l)
            (oneOf
                [ oneOrMore v
                , Fuzz.map2 (::) lv (list v)
                , Fuzz.map List.singleton lvt
                ]
            )
            (list t)
        , oneOrMore l
        , oneOrMore t
        ]


oneOrMore : Fuzzer a -> Fuzzer (List a)
oneOrMore fuzzer =
    Fuzz.map2 (::) fuzzer (list fuzzer)
