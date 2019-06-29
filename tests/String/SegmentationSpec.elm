module String.SegmentationSpec exposing (graphemesSpec)

import Expect exposing (Expectation)
import Fuzz exposing (Fuzzer, list, oneOf)
import RangeSetFuzzer
import Set exposing (Set)
import String.Segmentation as Segmentation
import String.Segmentation.Data.Control as Control
import String.Segmentation.Data.Prepend as Prepend
import String.Segmentation.RangeSet as RangeSet exposing (RangeSet)
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
        , describe "hangul"
            [ test "is parsed properly" <|
                \_ ->
                    -- https://stqpkiraradongjae.bandcamp.com/album/sarah
                    "당신이 키라라의 훌륭함을 잘 모르겠다면 문제는 당신에게 있다"
                        |> Segmentation.graphemes
                        |> Expect.equal (Ok [ "당", "신", "이", " ", "키", "라", "라", "의", " ", "훌", "륭", "함", "을", " ", "잘", " ", "모", "르", "겠", "다", "면", " ", "문", "제", "는", " ", "당", "신", "에", "게", " ", "있", "다" ])
            ]
        ]


expectIdentity : String -> Expectation
expectIdentity s =
    Expect.equal (Ok [ s ]) (Segmentation.graphemes s)


expectSplit : String -> String -> Expectation
expectSplit c1 c2 =
    (c1 ++ c2)
        |> Segmentation.graphemes
        |> Expect.equal (Ok [ c1, c2 ])


controlCharacter : Fuzzer String
controlCharacter =
    RangeSetFuzzer.fromChars Control.chars


prependCharacter : Fuzzer String
prependCharacter =
    RangeSetFuzzer.fromChars Prepend.chars
