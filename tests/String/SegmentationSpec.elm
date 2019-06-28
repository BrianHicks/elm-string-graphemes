module String.SegmentationSpec exposing (graphemesSpec)

import Expect exposing (Expectation)
import String.Segmentation as Segmentation
import Test exposing (..)


graphemesSpec : Test
graphemesSpec =
    describe "graphemes"
        [ test "breaks on CRLF" <| \_ -> expectIdentity "\u{000D}\n"
        , test "breaks on CR" <| \_ -> expectIdentity "\u{000D}"
        , test "breaks on LF" <| \_ -> expectIdentity "\n"
        ]


expectIdentity : String -> Expectation
expectIdentity s =
    Expect.equal (Ok [ s ]) (Segmentation.graphemes s)
