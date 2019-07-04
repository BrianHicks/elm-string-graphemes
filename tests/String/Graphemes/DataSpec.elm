module String.Graphemes.DataSpec exposing (spec)

import Expect
import Fuzz exposing (Fuzzer, list)
import String.Graphemes.Data as Data
import String.Graphemes.RangeDict as RangeDict
import String.Graphemes.RangeDict.Range as Range exposing (Range)
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
                        |> List.map (Tuple.mapSecond (always Data.Extend))
                        |> RangeDict.fromList
            in
            input
                |> Data.parser Data.Extend
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
