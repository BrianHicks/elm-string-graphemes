module String.Graphemes.DataSpec exposing (spec)

import Expect
import Fuzz exposing (Fuzzer, list)
import Parser
import String.Graphemes.Data as Data
import String.Graphemes.RangeSet as RangeSet
import String.Graphemes.RangeSet.Range as Range exposing (Range)
import Test exposing (..)


spec : Test
spec =
    fuzz (shortList encoded) "parses the format correctly" <|
        \pairs ->
            let
                input =
                    pairs
                        |> List.map Tuple.second
                        |> String.join ""

                output =
                    pairs
                        |> List.map Tuple.first
                        |> RangeSet.fromList
            in
            input
                |> Parser.run Data.parser
                |> Expect.equal (Ok output)


encoded : Fuzzer ( Range Char, String )
encoded =
    Fuzz.map2
        (\a b ->
            ( Range.range
                (Char.fromCode a)
                (Char.fromCode b)
            , if a == b then
                String.fromList [ '1', Char.fromCode a ]

              else
                String.fromList [ '2', Char.fromCode (min a b), Char.fromCode (max a b) ]
            )
        )
        (Fuzz.intRange 0 10000)
        (Fuzz.intRange 0 10000)


shortList : Fuzzer a -> Fuzzer (List a)
shortList fuzzer =
    Fuzz.oneOf
        [ Fuzz.constant []
        , Fuzz.map List.singleton fuzzer
        , Fuzz.map2 (\a b -> [ a, b ]) fuzzer fuzzer
        ]
