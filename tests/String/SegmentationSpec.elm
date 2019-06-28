module String.SegmentationSpec exposing (graphemesSpec)

import Data.Control as Control
import Expect exposing (Expectation)
import Fuzz exposing (Fuzzer)
import String.Segmentation as Segmentation
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
            [ fuzz2 controlCharacter controlCharacter "always form new segments" <|
                \c1 c2 ->
                    (c1 ++ c2)
                        |> Segmentation.graphemes
                        |> Expect.equal (Ok [ c1, c2 ])
            ]
        ]


expectIdentity : String -> Expectation
expectIdentity s =
    Expect.equal (Ok [ s ]) (Segmentation.graphemes s)


controlCharacter : Fuzzer String
controlCharacter =
    Control.chars
        |> List.map (Fuzz.constant << String.fromList << List.singleton)
        |> Fuzz.oneOf
