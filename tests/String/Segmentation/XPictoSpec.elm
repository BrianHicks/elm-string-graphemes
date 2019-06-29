module String.Segmentation.XPictoSpec exposing (spec, xPictoFuzzer)

import Expect
import Fuzz exposing (Fuzzer, list)
import Parser exposing ((|.))
import RangeSetFuzzer
import String.Segmentation.Data.Extend as Extend
import String.Segmentation.Data.Extended_Pictographic as ExtendedPictographic
import String.Segmentation.Data.ZWJ as ZWJ
import String.Segmentation.XPicto as XPicto
import Test exposing (..)


spec : Test
spec =
    describe "parser"
        [ fuzz xPictoFuzzer "extended pictographic characters should be parsed properly" <|
            \kindsAndStrings ->
                -- discard kinds—they're just useful for reading input failures
                let
                    string =
                        kindsAndStrings
                            |> List.map Tuple.second
                            |> String.join ""
                in
                string
                    |> Parser.run
                        (Parser.getChompedString XPicto.parser |. Parser.end)
                    |> Expect.equal (Ok string)
        ]


type Kind
    = XPicto
    | ZWJ
    | Extend


extendedPictographic : Fuzzer ( Kind, String )
extendedPictographic =
    RangeSetFuzzer.fromChars ExtendedPictographic.chars
        |> Fuzz.map (Tuple.pair XPicto)


zwj : Fuzzer ( Kind, String )
zwj =
    RangeSetFuzzer.fromChars ZWJ.chars
        |> Fuzz.map (Tuple.pair ZWJ)


extend : Fuzzer ( Kind, String )
extend =
    RangeSetFuzzer.fromChars Extend.chars
        |> Fuzz.map (Tuple.pair Extend)


oneOrMore : Fuzzer a -> Fuzzer (List a)
oneOrMore fuzzer =
    Fuzz.map2 (::) fuzzer (list fuzzer)


xPictoFuzzer : Fuzzer (List ( Kind, String ))
xPictoFuzzer =
    Fuzz.map2 (::)
        extendedPictographic
        (Fuzz.map List.concat
            (list
                (Fuzz.map3 (\extends zwj_ xp -> extends ++ [ zwj_, xp ])
                    (list extend)
                    zwj
                    extendedPictographic
                )
            )
        )
