module String.SegmentationSpec exposing (graphemesSpec)

import Expect exposing (Expectation)
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
        ]


expectIdentity : String -> Expectation
expectIdentity s =
    Expect.equal (Ok [ s ]) (Segmentation.graphemes s)
