module String.Graphemes.ParserSpec exposing (foldlSpec)

import Expect exposing (Expectation)
import Fuzz exposing (Fuzzer, list, oneOf)
import RangeDictFuzzer
import String.Graphemes.Data.CR as CR
import String.Graphemes.Data.Control as Control
import String.Graphemes.Data.Extend as Extend
import String.Graphemes.Data.Extended_Pictographic as ExtendedPictographic
import String.Graphemes.Data.L as L
import String.Graphemes.Data.LF as LF
import String.Graphemes.Data.LV as LV
import String.Graphemes.Data.LVT as LVT
import String.Graphemes.Data.Prepend as Prepend
import String.Graphemes.Data.Regional_Indicator as RegionalIndicator
import String.Graphemes.Data.SpacingMark as SpacingMark
import String.Graphemes.Data.T as T
import String.Graphemes.Data.V as V
import String.Graphemes.Data.ZWJ as ZWJ
import String.Graphemes.Parser as Parser
import Test exposing (..)


toList : String -> List String
toList =
    Parser.foldl (::) [] >> List.reverse


foldlSpec : Test
foldlSpec =
    describe "graphemes"
        [ describe "real world strings"
            [ test "Hangul 'bumblebee' is parsed properly" <|
                \_ ->
                    "꿀벌"
                        |> toList
                        |> Expect.equal [ "꿀", "벌" ]
            , test "real-world Hangul is parsed properly" <|
                \_ ->
                    -- https://stqpkiraradongjae.bandcamp.com/album/sarah
                    "당신이 키라라의 훌륭함을 잘 모르겠다면 문제는 당신에게 있다"
                        |> toList
                        |> Expect.equal [ "당", "신", "이", " ", "키", "라", "라", "의", " ", "훌", "륭", "함", "을", " ", "잘", " ", "모", "르", "겠", "다", "면", " ", "문", "제", "는", " ", "당", "신", "에", "게", " ", "있", "다" ]
            , test "skin tone and gender modifiers on emoji" <|
                \_ ->
                    "🦸🏽\u{200D}♂️"
                        |> toList
                        |> Expect.equal [ "🦸🏽\u{200D}♂️" ]
            , test "zalgo, sure, why not" <|
                \_ ->
                    -- some editors do not render this correctly. It should be
                    -- the word "zalgo" with a bunch of diacritics above and
                    -- below. Vim does this properly, the browser does too.
                    "z̴̙͒ả̴̫̼̫̀̅ĺ̴̔̿͜g̷̨͇͉̊͐̚o̶̳̣̯͌̓"
                        |> toList
                        |> Expect.equal
                            [ "z̴̙͒"
                            , "ả̴̫̼̫̀̅"
                            , "ĺ̴̔̿͜"
                            , "g̷̨͇͉̊͐̚"
                            , "o̶̳̣̯͌̓"
                            ]
            ]
        , describe "2-character combinations"
            [ describeFollowing "carriage return"
                crCharacter
                { breakForEverything
                    | lf = NoBreak
                }
            , describeFollowing "line feed"
                lfCharacter
                breakForEverything
            , describeFollowing "control character"
                controlCharacter
                breakForEverything
            , describeFollowing "extend character"
                extendCharacter
                { breakForEverything
                    | extend = NoBreak
                    , spacingMark = NoBreak
                    , zwj = NoBreak
                }
            , describeFollowing "regional indicator character"
                regionalIndicatorCharacter
                { breakForEverything
                    | extend = NoBreak
                    , regionalIndicator = NoBreak
                    , spacingMark = NoBreak
                    , zwj = NoBreak
                }
            , describeFollowing "prepend character"
                prependCharacter
                { breakForEverything
                    | other = NoBreak
                    , extend = NoBreak
                    , regionalIndicator = NoBreak
                    , prepend = NoBreak
                    , spacingMark = NoBreak
                    , l = NoBreak
                    , v = NoBreak
                    , t = NoBreak
                    , lv = NoBreak
                    , lvt = NoBreak
                    , extendedPictographic = NoBreak
                    , zwj = NoBreak
                }
            , describeFollowing "spacing mark"
                spacingMarkCharacter
                { breakForEverything
                    | extend = NoBreak
                    , spacingMark = NoBreak
                    , zwj = NoBreak
                }
            , describeFollowing "Hangul L"
                lCharacter
                { breakForEverything
                    | extend = NoBreak
                    , spacingMark = NoBreak
                    , l = NoBreak
                    , v = NoBreak
                    , lv = NoBreak
                    , lvt = NoBreak
                    , zwj = NoBreak
                }
            , describeFollowing "Hangul V"
                vCharacter
                { breakForEverything
                    | extend = NoBreak
                    , spacingMark = NoBreak
                    , v = NoBreak
                    , t = NoBreak
                    , zwj = NoBreak
                }
            , describeFollowing "Hangul T"
                tCharacter
                { breakForEverything
                    | extend = NoBreak
                    , spacingMark = NoBreak
                    , t = NoBreak
                    , zwj = NoBreak
                }
            , describeFollowing "Hangul LV"
                lvCharacter
                { breakForEverything
                    | extend = NoBreak
                    , spacingMark = NoBreak
                    , v = NoBreak
                    , t = NoBreak
                    , zwj = NoBreak
                }
            , describeFollowing "Hangul LVT"
                lvtCharacter
                { breakForEverything
                    | extend = NoBreak
                    , spacingMark = NoBreak
                    , t = NoBreak
                    , zwj = NoBreak
                }
            , describeFollowing "extended pictographic"
                extendedPictographicCharacter
                { breakForEverything
                    | extend = NoBreak
                    , spacingMark = NoBreak
                    , zwj = NoBreak
                }
            , describeFollowing "ZWJ"
                zwjCharacter
                { breakForEverything
                    | extend = NoBreak
                    , spacingMark = NoBreak
                    , zwj = NoBreak
                }
            , describeFollowing "other character"
                otherCharacter
                { breakForEverything
                    | extend = NoBreak
                    , spacingMark = NoBreak
                    , zwj = NoBreak
                }
            ]
        , describe "rules"
            (List.map
                (\( name, fuzzer ) ->
                    fuzz fuzzer name <|
                        \sequence ->
                            sequence
                                |> String.join ""
                                |> toList
                                |> Expect.equal sequence
                )
                [ -- rule numbers from -- https://www.unicode.org/Public/12.1.0/ucd/auxiliary/GraphemeBreakTest.html
                  -- rules 0.2 and 0.3 deal with the bounds of the string; we don't
                  -- explicitly need to model these.
                  ( "rule 3.0"
                  , Fuzz.map2 (\cr lf -> [ cr ++ lf ])
                        crCharacter
                        lfCharacter
                  )
                , -- TODO: need a way to generate valid sequences recursively to properly test
                  ( "rule 4.0"
                  , Fuzz.map2 (\control anything -> [ control, anything ])
                        controlCharacter
                        otherCharacter
                  )
                , -- TODO: need a way to generate valid sequences recursively to properly test
                  ( "rule 5.0"
                  , Fuzz.map2 (\anything control -> [ anything, control ])
                        otherCharacter
                        controlCharacter
                  )
                , ( "rule 6.0"
                  , Fuzz.map2 (\l otherHangul -> [ l ++ otherHangul ])
                        lCharacter
                        (Fuzz.oneOf
                            [ lCharacter
                            , vCharacter
                            , lvCharacter
                            , lvtCharacter
                            ]
                        )
                  )
                , ( "rule 7.0"
                  , Fuzz.map2 (\a b -> [ a ++ b ])
                        (Fuzz.oneOf
                            [ lvCharacter
                            , vCharacter
                            ]
                        )
                        (Fuzz.oneOf
                            [ vCharacter
                            , tCharacter
                            ]
                        )
                  )
                , ( "rule 8.0"
                  , Fuzz.map2 (\a b -> [ a ++ b ])
                        (Fuzz.oneOf
                            [ lvCharacter
                            , lvtCharacter
                            ]
                        )
                        tCharacter
                  )
                , -- TODO: need a way to generate valid sequences recursively to properly test
                  ( "rule 9.0"
                  , Fuzz.map2 (\anything zwj -> [ anything ++ zwj ])
                        otherCharacter
                        zwjCharacter
                  )
                , -- TODO: need a way to generate valid sequences recursively to properly test
                  ( "rule 9.1"
                  , Fuzz.map2 (\anything spacingMark -> [ anything ++ spacingMark ])
                        otherCharacter
                        spacingMarkCharacter
                  )
                , -- TODO: need a way to generate valid sequences recursively to properly test
                  ( "rule 9.2"
                  , Fuzz.map2 (\prepend anything -> [ prepend ++ anything ])
                        prependCharacter
                        otherCharacter
                  )

                -- Nope, no rule 10. Why? Has to do with the numbering in the
                -- spec the rules are numbered based on.
                , ( "rule 11.0"
                  , Fuzz.map4 (\xp1 extends zwj xp2 -> [ xp1 ++ String.join "" extends ++ zwj ++ xp2 ])
                        extendedPictographicCharacter
                        (Fuzz.list extendCharacter)
                        zwjCharacter
                        extendedPictographicCharacter
                  )
                , ( "rule 12.0"
                  , Fuzz.map3 (\ris ri1 ri2 -> ris ++ [ ri1 ++ ri2 ])
                        (list (Fuzz.map2 (++) regionalIndicatorCharacter regionalIndicatorCharacter))
                        regionalIndicatorCharacter
                        regionalIndicatorCharacter
                  )
                , -- TODO: need a way to generate valid sequences recursively to properly test
                  ( "rule 13.0"
                  , Fuzz.map4 (\notRi ris ri1 ri2 -> notRi :: ris ++ [ ri1 ++ ri2 ])
                        otherCharacter
                        (list (Fuzz.map2 (++) regionalIndicatorCharacter regionalIndicatorCharacter))
                        regionalIndicatorCharacter
                        regionalIndicatorCharacter
                  )
                , -- TODO: need a way to generate valid sequences recursively to properly test
                  ( "rule 999.0"
                  , Fuzz.map2 (\a b -> [ a, b ])
                        otherCharacter
                        otherCharacter
                  )
                ]
            )
        ]


type Break
    = Break
    | NoBreak


breakForEverything =
    { other = Break
    , cr = Break
    , lf = Break
    , control = Break
    , extend = Break
    , regionalIndicator = Break
    , prepend = Break
    , spacingMark = Break
    , l = Break
    , v = Break
    , t = Break
    , lv = Break
    , lvt = Break
    , extendedPictographic = Break
    , zwj = Break
    }


describeFollowing :
    String
    -> Fuzzer String
    ->
        { other : Break
        , cr : Break
        , lf : Break
        , control : Break
        , extend : Break
        , regionalIndicator : Break
        , prepend : Break
        , spacingMark : Break
        , l : Break
        , v : Break
        , t : Break
        , lv : Break
        , lvt : Break
        , extendedPictographic : Break
        , zwj : Break
        }
    -> Test
describeFollowing description fuzzer tests =
    describe description
        [ breakTest fuzzer otherCharacter tests.other "other character"
        , breakTest fuzzer crCharacter tests.cr "carriage return character"
        , breakTest fuzzer lfCharacter tests.lf "line feed character"
        , breakTest fuzzer controlCharacter tests.control "control character"
        , breakTest fuzzer extendCharacter tests.extend "extend character"
        , breakTest fuzzer regionalIndicatorCharacter tests.regionalIndicator "regional indicator character"
        , breakTest fuzzer prependCharacter tests.prepend "prepend character"
        , breakTest fuzzer spacingMarkCharacter tests.spacingMark "spacing mark character"
        , breakTest fuzzer lCharacter tests.l "hangul L character"
        , breakTest fuzzer vCharacter tests.v "hangul V character"
        , breakTest fuzzer tCharacter tests.t "hangul T character"
        , breakTest fuzzer lvCharacter tests.lv "hangul LV character"
        , breakTest fuzzer lvtCharacter tests.lvt "hangul LVT character"
        , breakTest fuzzer extendedPictographicCharacter tests.extendedPictographic "extended pictographic character"
        , breakTest fuzzer zwjCharacter tests.zwj "ZWJ character"
        ]


breakTest : Fuzzer String -> Fuzzer String -> Break -> String -> Test
breakTest first second break name =
    case break of
        Break ->
            fuzz2
                first
                second
                ("breaks on " ++ name)
                expectSplit

        NoBreak ->
            fuzz
                (Fuzz.map2 (++) first second)
                ("does not break on " ++ name)
                expectIdentity


expectIdentity : String -> Expectation
expectIdentity s =
    Expect.equal [ s ] (toList s)


expectSplit : String -> String -> Expectation
expectSplit c1 c2 =
    (c1 ++ c2)
        |> toList
        |> Expect.equal [ c1, c2 ]


otherCharacter : Fuzzer String
otherCharacter =
    Fuzz.intRange (Char.toCode 'A') (Char.toCode 'z')
        |> Fuzz.map Char.fromCode
        |> Fuzz.map List.singleton
        |> Fuzz.map String.fromList


crCharacter : Fuzzer String
crCharacter =
    RangeDictFuzzer.fromChars CR.chars


lfCharacter : Fuzzer String
lfCharacter =
    RangeDictFuzzer.fromChars LF.chars


controlCharacter : Fuzzer String
controlCharacter =
    RangeDictFuzzer.fromChars Control.chars


prependCharacter : Fuzzer String
prependCharacter =
    RangeDictFuzzer.fromChars Prepend.chars


extendCharacter : Fuzzer String
extendCharacter =
    RangeDictFuzzer.fromChars Extend.chars


regionalIndicatorCharacter : Fuzzer String
regionalIndicatorCharacter =
    RangeDictFuzzer.fromChars RegionalIndicator.chars


spacingMarkCharacter : Fuzzer String
spacingMarkCharacter =
    RangeDictFuzzer.fromChars SpacingMark.chars


lCharacter : Fuzzer String
lCharacter =
    RangeDictFuzzer.fromChars L.chars


vCharacter : Fuzzer String
vCharacter =
    RangeDictFuzzer.fromChars V.chars


tCharacter : Fuzzer String
tCharacter =
    RangeDictFuzzer.fromChars T.chars


lvCharacter : Fuzzer String
lvCharacter =
    RangeDictFuzzer.fromChars LV.chars


lvtCharacter : Fuzzer String
lvtCharacter =
    RangeDictFuzzer.fromChars LVT.chars


extendedPictographicCharacter : Fuzzer String
extendedPictographicCharacter =
    RangeDictFuzzer.fromChars ExtendedPictographic.chars


zwjCharacter : Fuzzer String
zwjCharacter =
    RangeDictFuzzer.fromChars ZWJ.chars
