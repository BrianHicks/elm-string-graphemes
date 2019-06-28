module String.SegmentationSpec exposing (graphemesSpec)

import Expect exposing (Expectation)
import Fuzz exposing (Fuzzer)
import Set exposing (Set)
import String.Segmentation as Segmentation
import String.Segmentation.Control as Control
import String.Segmentation.Prepend as Prepend
import String.Segmentation.RangeSet as RangeSet
import String.Segmentation.RangeSet.Range as Range
import Test exposing (..)


graphemesSpec : Test
graphemesSpec =
    describe "graphemes"
        [ describe "line breaks get broken"
            [ test "breaks on CRLF" <| \_ -> expectIdentity "\u{000D}\n"
            , test "breaks on CR" <| \_ -> expectIdentity "\u{000D}"
            , test "breaks on LF" <| \_ -> expectIdentity "\n"
            , test "LFCR is two characters" <|
                \_ ->
                    "\n\u{000D}"
                        |> Segmentation.graphemes
                        |> Expect.equal (Ok [ "\n", "\u{000D}" ])
            ]
        , describe "control characters"
            [ fuzz2 controlCharacter controlCharacter "always form new segments" expectSplit ]
        , describe "prepend characters"
            [ fuzz2 prependCharacter prependCharacter "always form new segments" expectSplit ]
        ]


expectIdentity : String -> Expectation
expectIdentity s =
    Expect.equal (Ok [ s ]) (Segmentation.graphemes s)


expectSplit : String -> String -> Expectation
expectSplit c1 c2 =
    (c1 ++ c2)
        |> Segmentation.graphemes
        |> Expect.equal (Ok [ c1, c2 ])


charsFuzzer : Set Char -> Fuzzer String
charsFuzzer chars =
    chars
        |> Set.toList
        |> List.map (Fuzz.constant << String.fromList << List.singleton)
        |> Fuzz.oneOf


controlCharacter : Fuzzer String
controlCharacter =
    charsFuzzer Control.chars


prependCharacter : Fuzzer String
prependCharacter =
    charsFuzzer Prepend.chars
