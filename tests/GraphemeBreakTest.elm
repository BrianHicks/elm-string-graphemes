module GraphemeBreakTest exposing (spec)

{-| Hey, this module was generated automatically. Please don't edit it.

Run `make tests/GraphemeBreakTest.elm` instead!

-}

import Expect
import String.Graphemes as Grapheme
import Test exposing (..)


spec : Test
spec =
    describe "grapheme breaks"
        [ test "24: ÷ [0.2] SPACE (Other) ÷ [999.0] SPACE (Other) ÷ [0.3]" <|
            \_ ->
                "  "
                    |> Grapheme.toList
                    |> Expect.equal [ " ", " " ]
        , test "25: ÷ [0.2] SPACE (Other) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] SPACE (Other) ÷ [0.3]" <|
            \_ ->
                " ̈ "
                    |> Grapheme.toList
                    |> Expect.equal [ " ̈", " " ]
        , test "26: ÷ [0.2] SPACE (Other) ÷ [5.0] <CARRIAGE RETURN (CR)> (CR) ÷ [0.3]" <|
            \_ ->
                " \u{000D}"
                    |> Grapheme.toList
                    |> Expect.equal [ " ", "\u{000D}" ]
        , test "27: ÷ [0.2] SPACE (Other) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [5.0] <CARRIAGE RETURN (CR)> (CR) ÷ [0.3]" <|
            \_ ->
                " ̈\u{000D}"
                    |> Grapheme.toList
                    |> Expect.equal [ " ̈", "\u{000D}" ]
        , test "28: ÷ [0.2] SPACE (Other) ÷ [5.0] <LINE FEED (LF)> (LF) ÷ [0.3]" <|
            \_ ->
                " \n"
                    |> Grapheme.toList
                    |> Expect.equal [ " ", "\n" ]
        , test "29: ÷ [0.2] SPACE (Other) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [5.0] <LINE FEED (LF)> (LF) ÷ [0.3]" <|
            \_ ->
                " ̈\n"
                    |> Grapheme.toList
                    |> Expect.equal [ " ̈", "\n" ]
        , test "30: ÷ [0.2] SPACE (Other) ÷ [5.0] <START OF HEADING> (Control) ÷ [0.3]" <|
            \_ ->
                " \u{0001}"
                    |> Grapheme.toList
                    |> Expect.equal [ " ", "\u{0001}" ]
        , test "31: ÷ [0.2] SPACE (Other) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [5.0] <START OF HEADING> (Control) ÷ [0.3]" <|
            \_ ->
                " ̈\u{0001}"
                    |> Grapheme.toList
                    |> Expect.equal [ " ̈", "\u{0001}" ]
        , test "32: ÷ [0.2] SPACE (Other) × [9.0] COMBINING GRAPHEME JOINER (Extend) ÷ [0.3]" <|
            \_ ->
                " ͏"
                    |> Grapheme.toList
                    |> Expect.equal [ " ͏" ]
        , test "33: ÷ [0.2] SPACE (Other) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] COMBINING GRAPHEME JOINER (Extend) ÷ [0.3]" <|
            \_ ->
                " ̈͏"
                    |> Grapheme.toList
                    |> Expect.equal [ " ̈͏" ]
        , test "34: ÷ [0.2] SPACE (Other) ÷ [999.0] REGIONAL INDICATOR SYMBOL LETTER A (RI) ÷ [0.3]" <|
            \_ ->
                " 🇦"
                    |> Grapheme.toList
                    |> Expect.equal [ " ", "🇦" ]
        , test "35: ÷ [0.2] SPACE (Other) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] REGIONAL INDICATOR SYMBOL LETTER A (RI) ÷ [0.3]" <|
            \_ ->
                " ̈🇦"
                    |> Grapheme.toList
                    |> Expect.equal [ " ̈", "🇦" ]
        , test "36: ÷ [0.2] SPACE (Other) ÷ [999.0] ARABIC NUMBER SIGN (Prepend) ÷ [0.3]" <|
            \_ ->
                " \u{0600}"
                    |> Grapheme.toList
                    |> Expect.equal [ " ", "\u{0600}" ]
        , test "37: ÷ [0.2] SPACE (Other) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] ARABIC NUMBER SIGN (Prepend) ÷ [0.3]" <|
            \_ ->
                " ̈\u{0600}"
                    |> Grapheme.toList
                    |> Expect.equal [ " ̈", "\u{0600}" ]
        , test "38: ÷ [0.2] SPACE (Other) × [9.1] DEVANAGARI SIGN VISARGA (SpacingMark) ÷ [0.3]" <|
            \_ ->
                " ः"
                    |> Grapheme.toList
                    |> Expect.equal [ " ः" ]
        , test "39: ÷ [0.2] SPACE (Other) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.1] DEVANAGARI SIGN VISARGA (SpacingMark) ÷ [0.3]" <|
            \_ ->
                " ̈ः"
                    |> Grapheme.toList
                    |> Expect.equal [ " ̈ः" ]
        , test "40: ÷ [0.2] SPACE (Other) ÷ [999.0] HANGUL CHOSEONG KIYEOK (L) ÷ [0.3]" <|
            \_ ->
                " ᄀ"
                    |> Grapheme.toList
                    |> Expect.equal [ " ", "ᄀ" ]
        , test "41: ÷ [0.2] SPACE (Other) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL CHOSEONG KIYEOK (L) ÷ [0.3]" <|
            \_ ->
                " ̈ᄀ"
                    |> Grapheme.toList
                    |> Expect.equal [ " ̈", "ᄀ" ]
        , test "42: ÷ [0.2] SPACE (Other) ÷ [999.0] HANGUL JUNGSEONG FILLER (V) ÷ [0.3]" <|
            \_ ->
                " ᅠ"
                    |> Grapheme.toList
                    |> Expect.equal [ " ", "ᅠ" ]
        , test "43: ÷ [0.2] SPACE (Other) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL JUNGSEONG FILLER (V) ÷ [0.3]" <|
            \_ ->
                " ̈ᅠ"
                    |> Grapheme.toList
                    |> Expect.equal [ " ̈", "ᅠ" ]
        , test "44: ÷ [0.2] SPACE (Other) ÷ [999.0] HANGUL JONGSEONG KIYEOK (T) ÷ [0.3]" <|
            \_ ->
                " ᆨ"
                    |> Grapheme.toList
                    |> Expect.equal [ " ", "ᆨ" ]
        , test "45: ÷ [0.2] SPACE (Other) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL JONGSEONG KIYEOK (T) ÷ [0.3]" <|
            \_ ->
                " ̈ᆨ"
                    |> Grapheme.toList
                    |> Expect.equal [ " ̈", "ᆨ" ]
        , test "46: ÷ [0.2] SPACE (Other) ÷ [999.0] HANGUL SYLLABLE GA (LV) ÷ [0.3]" <|
            \_ ->
                " 가"
                    |> Grapheme.toList
                    |> Expect.equal [ " ", "가" ]
        , test "47: ÷ [0.2] SPACE (Other) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL SYLLABLE GA (LV) ÷ [0.3]" <|
            \_ ->
                " ̈가"
                    |> Grapheme.toList
                    |> Expect.equal [ " ̈", "가" ]
        , test "48: ÷ [0.2] SPACE (Other) ÷ [999.0] HANGUL SYLLABLE GAG (LVT) ÷ [0.3]" <|
            \_ ->
                " 각"
                    |> Grapheme.toList
                    |> Expect.equal [ " ", "각" ]
        , test "49: ÷ [0.2] SPACE (Other) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL SYLLABLE GAG (LVT) ÷ [0.3]" <|
            \_ ->
                " ̈각"
                    |> Grapheme.toList
                    |> Expect.equal [ " ̈", "각" ]
        , test "50: ÷ [0.2] SPACE (Other) ÷ [999.0] WATCH (ExtPict) ÷ [0.3]" <|
            \_ ->
                " ⌚"
                    |> Grapheme.toList
                    |> Expect.equal [ " ", "⌚" ]
        , test "51: ÷ [0.2] SPACE (Other) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] WATCH (ExtPict) ÷ [0.3]" <|
            \_ ->
                " ̈⌚"
                    |> Grapheme.toList
                    |> Expect.equal [ " ̈", "⌚" ]
        , test "52: ÷ [0.2] SPACE (Other) × [9.0] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) ÷ [0.3]" <|
            \_ ->
                " ̀"
                    |> Grapheme.toList
                    |> Expect.equal [ " ̀" ]
        , test "53: ÷ [0.2] SPACE (Other) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) ÷ [0.3]" <|
            \_ ->
                " ̈̀"
                    |> Grapheme.toList
                    |> Expect.equal [ " ̈̀" ]
        , test "54: ÷ [0.2] SPACE (Other) × [9.0] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) ÷ [0.3]" <|
            \_ ->
                " \u{200D}"
                    |> Grapheme.toList
                    |> Expect.equal [ " \u{200D}" ]
        , test "55: ÷ [0.2] SPACE (Other) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) ÷ [0.3]" <|
            \_ ->
                " ̈\u{200D}"
                    |> Grapheme.toList
                    |> Expect.equal [ " ̈\u{200D}" ]
        , test "56: ÷ [0.2] SPACE (Other) ÷ [999.0] <reserved-0378> (Other) ÷ [0.3]" <|
            \_ ->
                " \u{0378}"
                    |> Grapheme.toList
                    |> Expect.equal [ " ", "\u{0378}" ]
        , test "57: ÷ [0.2] SPACE (Other) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] <reserved-0378> (Other) ÷ [0.3]" <|
            \_ ->
                " ̈\u{0378}"
                    |> Grapheme.toList
                    |> Expect.equal [ " ̈", "\u{0378}" ]
        , test "58: ÷ [0.2] <CARRIAGE RETURN (CR)> (CR) ÷ [4.0] SPACE (Other) ÷ [0.3]" <|
            \_ ->
                "\u{000D} "
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{000D}", " " ]
        , test "59: ÷ [0.2] <CARRIAGE RETURN (CR)> (CR) ÷ [4.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] SPACE (Other) ÷ [0.3]" <|
            \_ ->
                "\u{000D}̈ "
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{000D}", "̈", " " ]
        , test "60: ÷ [0.2] <CARRIAGE RETURN (CR)> (CR) ÷ [4.0] <CARRIAGE RETURN (CR)> (CR) ÷ [0.3]" <|
            \_ ->
                "\u{000D}\u{000D}"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{000D}", "\u{000D}" ]
        , test "61: ÷ [0.2] <CARRIAGE RETURN (CR)> (CR) ÷ [4.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [5.0] <CARRIAGE RETURN (CR)> (CR) ÷ [0.3]" <|
            \_ ->
                "\u{000D}̈\u{000D}"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{000D}", "̈", "\u{000D}" ]
        , test "62: ÷ [0.2] <CARRIAGE RETURN (CR)> (CR) × [3.0] <LINE FEED (LF)> (LF) ÷ [0.3]" <|
            \_ ->
                "\u{000D}\n"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{000D}\n" ]
        , test "63: ÷ [0.2] <CARRIAGE RETURN (CR)> (CR) ÷ [4.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [5.0] <LINE FEED (LF)> (LF) ÷ [0.3]" <|
            \_ ->
                "\u{000D}̈\n"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{000D}", "̈", "\n" ]
        , test "64: ÷ [0.2] <CARRIAGE RETURN (CR)> (CR) ÷ [4.0] <START OF HEADING> (Control) ÷ [0.3]" <|
            \_ ->
                "\u{000D}\u{0001}"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{000D}", "\u{0001}" ]
        , test "65: ÷ [0.2] <CARRIAGE RETURN (CR)> (CR) ÷ [4.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [5.0] <START OF HEADING> (Control) ÷ [0.3]" <|
            \_ ->
                "\u{000D}̈\u{0001}"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{000D}", "̈", "\u{0001}" ]
        , test "66: ÷ [0.2] <CARRIAGE RETURN (CR)> (CR) ÷ [4.0] COMBINING GRAPHEME JOINER (Extend) ÷ [0.3]" <|
            \_ ->
                "\u{000D}͏"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{000D}", "͏" ]
        , test "67: ÷ [0.2] <CARRIAGE RETURN (CR)> (CR) ÷ [4.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] COMBINING GRAPHEME JOINER (Extend) ÷ [0.3]" <|
            \_ ->
                "\u{000D}̈͏"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{000D}", "̈͏" ]
        , test "68: ÷ [0.2] <CARRIAGE RETURN (CR)> (CR) ÷ [4.0] REGIONAL INDICATOR SYMBOL LETTER A (RI) ÷ [0.3]" <|
            \_ ->
                "\u{000D}🇦"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{000D}", "🇦" ]
        , test "69: ÷ [0.2] <CARRIAGE RETURN (CR)> (CR) ÷ [4.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] REGIONAL INDICATOR SYMBOL LETTER A (RI) ÷ [0.3]" <|
            \_ ->
                "\u{000D}̈🇦"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{000D}", "̈", "🇦" ]
        , test "70: ÷ [0.2] <CARRIAGE RETURN (CR)> (CR) ÷ [4.0] ARABIC NUMBER SIGN (Prepend) ÷ [0.3]" <|
            \_ ->
                "\u{000D}\u{0600}"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{000D}", "\u{0600}" ]
        , test "71: ÷ [0.2] <CARRIAGE RETURN (CR)> (CR) ÷ [4.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] ARABIC NUMBER SIGN (Prepend) ÷ [0.3]" <|
            \_ ->
                "\u{000D}̈\u{0600}"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{000D}", "̈", "\u{0600}" ]
        , test "72: ÷ [0.2] <CARRIAGE RETURN (CR)> (CR) ÷ [4.0] DEVANAGARI SIGN VISARGA (SpacingMark) ÷ [0.3]" <|
            \_ ->
                "\u{000D}ः"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{000D}", "ः" ]
        , test "73: ÷ [0.2] <CARRIAGE RETURN (CR)> (CR) ÷ [4.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.1] DEVANAGARI SIGN VISARGA (SpacingMark) ÷ [0.3]" <|
            \_ ->
                "\u{000D}̈ः"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{000D}", "̈ः" ]
        , test "74: ÷ [0.2] <CARRIAGE RETURN (CR)> (CR) ÷ [4.0] HANGUL CHOSEONG KIYEOK (L) ÷ [0.3]" <|
            \_ ->
                "\u{000D}ᄀ"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{000D}", "ᄀ" ]
        , test "75: ÷ [0.2] <CARRIAGE RETURN (CR)> (CR) ÷ [4.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL CHOSEONG KIYEOK (L) ÷ [0.3]" <|
            \_ ->
                "\u{000D}̈ᄀ"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{000D}", "̈", "ᄀ" ]
        , test "76: ÷ [0.2] <CARRIAGE RETURN (CR)> (CR) ÷ [4.0] HANGUL JUNGSEONG FILLER (V) ÷ [0.3]" <|
            \_ ->
                "\u{000D}ᅠ"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{000D}", "ᅠ" ]
        , test "77: ÷ [0.2] <CARRIAGE RETURN (CR)> (CR) ÷ [4.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL JUNGSEONG FILLER (V) ÷ [0.3]" <|
            \_ ->
                "\u{000D}̈ᅠ"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{000D}", "̈", "ᅠ" ]
        , test "78: ÷ [0.2] <CARRIAGE RETURN (CR)> (CR) ÷ [4.0] HANGUL JONGSEONG KIYEOK (T) ÷ [0.3]" <|
            \_ ->
                "\u{000D}ᆨ"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{000D}", "ᆨ" ]
        , test "79: ÷ [0.2] <CARRIAGE RETURN (CR)> (CR) ÷ [4.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL JONGSEONG KIYEOK (T) ÷ [0.3]" <|
            \_ ->
                "\u{000D}̈ᆨ"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{000D}", "̈", "ᆨ" ]
        , test "80: ÷ [0.2] <CARRIAGE RETURN (CR)> (CR) ÷ [4.0] HANGUL SYLLABLE GA (LV) ÷ [0.3]" <|
            \_ ->
                "\u{000D}가"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{000D}", "가" ]
        , test "81: ÷ [0.2] <CARRIAGE RETURN (CR)> (CR) ÷ [4.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL SYLLABLE GA (LV) ÷ [0.3]" <|
            \_ ->
                "\u{000D}̈가"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{000D}", "̈", "가" ]
        , test "82: ÷ [0.2] <CARRIAGE RETURN (CR)> (CR) ÷ [4.0] HANGUL SYLLABLE GAG (LVT) ÷ [0.3]" <|
            \_ ->
                "\u{000D}각"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{000D}", "각" ]
        , test "83: ÷ [0.2] <CARRIAGE RETURN (CR)> (CR) ÷ [4.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL SYLLABLE GAG (LVT) ÷ [0.3]" <|
            \_ ->
                "\u{000D}̈각"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{000D}", "̈", "각" ]
        , test "84: ÷ [0.2] <CARRIAGE RETURN (CR)> (CR) ÷ [4.0] WATCH (ExtPict) ÷ [0.3]" <|
            \_ ->
                "\u{000D}⌚"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{000D}", "⌚" ]
        , test "85: ÷ [0.2] <CARRIAGE RETURN (CR)> (CR) ÷ [4.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] WATCH (ExtPict) ÷ [0.3]" <|
            \_ ->
                "\u{000D}̈⌚"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{000D}", "̈", "⌚" ]
        , test "86: ÷ [0.2] <CARRIAGE RETURN (CR)> (CR) ÷ [4.0] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) ÷ [0.3]" <|
            \_ ->
                "\u{000D}̀"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{000D}", "̀" ]
        , test "87: ÷ [0.2] <CARRIAGE RETURN (CR)> (CR) ÷ [4.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) ÷ [0.3]" <|
            \_ ->
                "\u{000D}̈̀"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{000D}", "̈̀" ]
        , test "88: ÷ [0.2] <CARRIAGE RETURN (CR)> (CR) ÷ [4.0] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) ÷ [0.3]" <|
            \_ ->
                "\u{000D}\u{200D}"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{000D}", "\u{200D}" ]
        , test "89: ÷ [0.2] <CARRIAGE RETURN (CR)> (CR) ÷ [4.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) ÷ [0.3]" <|
            \_ ->
                "\u{000D}̈\u{200D}"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{000D}", "̈\u{200D}" ]
        , test "90: ÷ [0.2] <CARRIAGE RETURN (CR)> (CR) ÷ [4.0] <reserved-0378> (Other) ÷ [0.3]" <|
            \_ ->
                "\u{000D}\u{0378}"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{000D}", "\u{0378}" ]
        , test "91: ÷ [0.2] <CARRIAGE RETURN (CR)> (CR) ÷ [4.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] <reserved-0378> (Other) ÷ [0.3]" <|
            \_ ->
                "\u{000D}̈\u{0378}"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{000D}", "̈", "\u{0378}" ]
        , test "92: ÷ [0.2] <LINE FEED (LF)> (LF) ÷ [4.0] SPACE (Other) ÷ [0.3]" <|
            \_ ->
                "\n "
                    |> Grapheme.toList
                    |> Expect.equal [ "\n", " " ]
        , test "93: ÷ [0.2] <LINE FEED (LF)> (LF) ÷ [4.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] SPACE (Other) ÷ [0.3]" <|
            \_ ->
                "\n̈ "
                    |> Grapheme.toList
                    |> Expect.equal [ "\n", "̈", " " ]
        , test "94: ÷ [0.2] <LINE FEED (LF)> (LF) ÷ [4.0] <CARRIAGE RETURN (CR)> (CR) ÷ [0.3]" <|
            \_ ->
                "\n\u{000D}"
                    |> Grapheme.toList
                    |> Expect.equal [ "\n", "\u{000D}" ]
        , test "95: ÷ [0.2] <LINE FEED (LF)> (LF) ÷ [4.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [5.0] <CARRIAGE RETURN (CR)> (CR) ÷ [0.3]" <|
            \_ ->
                "\n̈\u{000D}"
                    |> Grapheme.toList
                    |> Expect.equal [ "\n", "̈", "\u{000D}" ]
        , test "96: ÷ [0.2] <LINE FEED (LF)> (LF) ÷ [4.0] <LINE FEED (LF)> (LF) ÷ [0.3]" <|
            \_ ->
                "\n\n"
                    |> Grapheme.toList
                    |> Expect.equal [ "\n", "\n" ]
        , test "97: ÷ [0.2] <LINE FEED (LF)> (LF) ÷ [4.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [5.0] <LINE FEED (LF)> (LF) ÷ [0.3]" <|
            \_ ->
                "\n̈\n"
                    |> Grapheme.toList
                    |> Expect.equal [ "\n", "̈", "\n" ]
        , test "98: ÷ [0.2] <LINE FEED (LF)> (LF) ÷ [4.0] <START OF HEADING> (Control) ÷ [0.3]" <|
            \_ ->
                "\n\u{0001}"
                    |> Grapheme.toList
                    |> Expect.equal [ "\n", "\u{0001}" ]
        , test "99: ÷ [0.2] <LINE FEED (LF)> (LF) ÷ [4.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [5.0] <START OF HEADING> (Control) ÷ [0.3]" <|
            \_ ->
                "\n̈\u{0001}"
                    |> Grapheme.toList
                    |> Expect.equal [ "\n", "̈", "\u{0001}" ]
        , test "100: ÷ [0.2] <LINE FEED (LF)> (LF) ÷ [4.0] COMBINING GRAPHEME JOINER (Extend) ÷ [0.3]" <|
            \_ ->
                "\n͏"
                    |> Grapheme.toList
                    |> Expect.equal [ "\n", "͏" ]
        , test "101: ÷ [0.2] <LINE FEED (LF)> (LF) ÷ [4.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] COMBINING GRAPHEME JOINER (Extend) ÷ [0.3]" <|
            \_ ->
                "\n̈͏"
                    |> Grapheme.toList
                    |> Expect.equal [ "\n", "̈͏" ]
        , test "102: ÷ [0.2] <LINE FEED (LF)> (LF) ÷ [4.0] REGIONAL INDICATOR SYMBOL LETTER A (RI) ÷ [0.3]" <|
            \_ ->
                "\n🇦"
                    |> Grapheme.toList
                    |> Expect.equal [ "\n", "🇦" ]
        , test "103: ÷ [0.2] <LINE FEED (LF)> (LF) ÷ [4.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] REGIONAL INDICATOR SYMBOL LETTER A (RI) ÷ [0.3]" <|
            \_ ->
                "\n̈🇦"
                    |> Grapheme.toList
                    |> Expect.equal [ "\n", "̈", "🇦" ]
        , test "104: ÷ [0.2] <LINE FEED (LF)> (LF) ÷ [4.0] ARABIC NUMBER SIGN (Prepend) ÷ [0.3]" <|
            \_ ->
                "\n\u{0600}"
                    |> Grapheme.toList
                    |> Expect.equal [ "\n", "\u{0600}" ]
        , test "105: ÷ [0.2] <LINE FEED (LF)> (LF) ÷ [4.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] ARABIC NUMBER SIGN (Prepend) ÷ [0.3]" <|
            \_ ->
                "\n̈\u{0600}"
                    |> Grapheme.toList
                    |> Expect.equal [ "\n", "̈", "\u{0600}" ]
        , test "106: ÷ [0.2] <LINE FEED (LF)> (LF) ÷ [4.0] DEVANAGARI SIGN VISARGA (SpacingMark) ÷ [0.3]" <|
            \_ ->
                "\nः"
                    |> Grapheme.toList
                    |> Expect.equal [ "\n", "ः" ]
        , test "107: ÷ [0.2] <LINE FEED (LF)> (LF) ÷ [4.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.1] DEVANAGARI SIGN VISARGA (SpacingMark) ÷ [0.3]" <|
            \_ ->
                "\n̈ः"
                    |> Grapheme.toList
                    |> Expect.equal [ "\n", "̈ः" ]
        , test "108: ÷ [0.2] <LINE FEED (LF)> (LF) ÷ [4.0] HANGUL CHOSEONG KIYEOK (L) ÷ [0.3]" <|
            \_ ->
                "\nᄀ"
                    |> Grapheme.toList
                    |> Expect.equal [ "\n", "ᄀ" ]
        , test "109: ÷ [0.2] <LINE FEED (LF)> (LF) ÷ [4.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL CHOSEONG KIYEOK (L) ÷ [0.3]" <|
            \_ ->
                "\n̈ᄀ"
                    |> Grapheme.toList
                    |> Expect.equal [ "\n", "̈", "ᄀ" ]
        , test "110: ÷ [0.2] <LINE FEED (LF)> (LF) ÷ [4.0] HANGUL JUNGSEONG FILLER (V) ÷ [0.3]" <|
            \_ ->
                "\nᅠ"
                    |> Grapheme.toList
                    |> Expect.equal [ "\n", "ᅠ" ]
        , test "111: ÷ [0.2] <LINE FEED (LF)> (LF) ÷ [4.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL JUNGSEONG FILLER (V) ÷ [0.3]" <|
            \_ ->
                "\n̈ᅠ"
                    |> Grapheme.toList
                    |> Expect.equal [ "\n", "̈", "ᅠ" ]
        , test "112: ÷ [0.2] <LINE FEED (LF)> (LF) ÷ [4.0] HANGUL JONGSEONG KIYEOK (T) ÷ [0.3]" <|
            \_ ->
                "\nᆨ"
                    |> Grapheme.toList
                    |> Expect.equal [ "\n", "ᆨ" ]
        , test "113: ÷ [0.2] <LINE FEED (LF)> (LF) ÷ [4.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL JONGSEONG KIYEOK (T) ÷ [0.3]" <|
            \_ ->
                "\n̈ᆨ"
                    |> Grapheme.toList
                    |> Expect.equal [ "\n", "̈", "ᆨ" ]
        , test "114: ÷ [0.2] <LINE FEED (LF)> (LF) ÷ [4.0] HANGUL SYLLABLE GA (LV) ÷ [0.3]" <|
            \_ ->
                "\n가"
                    |> Grapheme.toList
                    |> Expect.equal [ "\n", "가" ]
        , test "115: ÷ [0.2] <LINE FEED (LF)> (LF) ÷ [4.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL SYLLABLE GA (LV) ÷ [0.3]" <|
            \_ ->
                "\n̈가"
                    |> Grapheme.toList
                    |> Expect.equal [ "\n", "̈", "가" ]
        , test "116: ÷ [0.2] <LINE FEED (LF)> (LF) ÷ [4.0] HANGUL SYLLABLE GAG (LVT) ÷ [0.3]" <|
            \_ ->
                "\n각"
                    |> Grapheme.toList
                    |> Expect.equal [ "\n", "각" ]
        , test "117: ÷ [0.2] <LINE FEED (LF)> (LF) ÷ [4.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL SYLLABLE GAG (LVT) ÷ [0.3]" <|
            \_ ->
                "\n̈각"
                    |> Grapheme.toList
                    |> Expect.equal [ "\n", "̈", "각" ]
        , test "118: ÷ [0.2] <LINE FEED (LF)> (LF) ÷ [4.0] WATCH (ExtPict) ÷ [0.3]" <|
            \_ ->
                "\n⌚"
                    |> Grapheme.toList
                    |> Expect.equal [ "\n", "⌚" ]
        , test "119: ÷ [0.2] <LINE FEED (LF)> (LF) ÷ [4.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] WATCH (ExtPict) ÷ [0.3]" <|
            \_ ->
                "\n̈⌚"
                    |> Grapheme.toList
                    |> Expect.equal [ "\n", "̈", "⌚" ]
        , test "120: ÷ [0.2] <LINE FEED (LF)> (LF) ÷ [4.0] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) ÷ [0.3]" <|
            \_ ->
                "\ǹ"
                    |> Grapheme.toList
                    |> Expect.equal [ "\n", "̀" ]
        , test "121: ÷ [0.2] <LINE FEED (LF)> (LF) ÷ [4.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) ÷ [0.3]" <|
            \_ ->
                "\n̈̀"
                    |> Grapheme.toList
                    |> Expect.equal [ "\n", "̈̀" ]
        , test "122: ÷ [0.2] <LINE FEED (LF)> (LF) ÷ [4.0] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) ÷ [0.3]" <|
            \_ ->
                "\n\u{200D}"
                    |> Grapheme.toList
                    |> Expect.equal [ "\n", "\u{200D}" ]
        , test "123: ÷ [0.2] <LINE FEED (LF)> (LF) ÷ [4.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) ÷ [0.3]" <|
            \_ ->
                "\n̈\u{200D}"
                    |> Grapheme.toList
                    |> Expect.equal [ "\n", "̈\u{200D}" ]
        , test "124: ÷ [0.2] <LINE FEED (LF)> (LF) ÷ [4.0] <reserved-0378> (Other) ÷ [0.3]" <|
            \_ ->
                "\n\u{0378}"
                    |> Grapheme.toList
                    |> Expect.equal [ "\n", "\u{0378}" ]
        , test "125: ÷ [0.2] <LINE FEED (LF)> (LF) ÷ [4.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] <reserved-0378> (Other) ÷ [0.3]" <|
            \_ ->
                "\n̈\u{0378}"
                    |> Grapheme.toList
                    |> Expect.equal [ "\n", "̈", "\u{0378}" ]
        , test "126: ÷ [0.2] <START OF HEADING> (Control) ÷ [4.0] SPACE (Other) ÷ [0.3]" <|
            \_ ->
                "\u{0001} "
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{0001}", " " ]
        , test "127: ÷ [0.2] <START OF HEADING> (Control) ÷ [4.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] SPACE (Other) ÷ [0.3]" <|
            \_ ->
                "\u{0001}̈ "
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{0001}", "̈", " " ]
        , test "128: ÷ [0.2] <START OF HEADING> (Control) ÷ [4.0] <CARRIAGE RETURN (CR)> (CR) ÷ [0.3]" <|
            \_ ->
                "\u{0001}\u{000D}"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{0001}", "\u{000D}" ]
        , test "129: ÷ [0.2] <START OF HEADING> (Control) ÷ [4.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [5.0] <CARRIAGE RETURN (CR)> (CR) ÷ [0.3]" <|
            \_ ->
                "\u{0001}̈\u{000D}"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{0001}", "̈", "\u{000D}" ]
        , test "130: ÷ [0.2] <START OF HEADING> (Control) ÷ [4.0] <LINE FEED (LF)> (LF) ÷ [0.3]" <|
            \_ ->
                "\u{0001}\n"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{0001}", "\n" ]
        , test "131: ÷ [0.2] <START OF HEADING> (Control) ÷ [4.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [5.0] <LINE FEED (LF)> (LF) ÷ [0.3]" <|
            \_ ->
                "\u{0001}̈\n"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{0001}", "̈", "\n" ]
        , test "132: ÷ [0.2] <START OF HEADING> (Control) ÷ [4.0] <START OF HEADING> (Control) ÷ [0.3]" <|
            \_ ->
                "\u{0001}\u{0001}"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{0001}", "\u{0001}" ]
        , test "133: ÷ [0.2] <START OF HEADING> (Control) ÷ [4.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [5.0] <START OF HEADING> (Control) ÷ [0.3]" <|
            \_ ->
                "\u{0001}̈\u{0001}"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{0001}", "̈", "\u{0001}" ]
        , test "134: ÷ [0.2] <START OF HEADING> (Control) ÷ [4.0] COMBINING GRAPHEME JOINER (Extend) ÷ [0.3]" <|
            \_ ->
                "\u{0001}͏"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{0001}", "͏" ]
        , test "135: ÷ [0.2] <START OF HEADING> (Control) ÷ [4.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] COMBINING GRAPHEME JOINER (Extend) ÷ [0.3]" <|
            \_ ->
                "\u{0001}̈͏"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{0001}", "̈͏" ]
        , test "136: ÷ [0.2] <START OF HEADING> (Control) ÷ [4.0] REGIONAL INDICATOR SYMBOL LETTER A (RI) ÷ [0.3]" <|
            \_ ->
                "\u{0001}🇦"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{0001}", "🇦" ]
        , test "137: ÷ [0.2] <START OF HEADING> (Control) ÷ [4.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] REGIONAL INDICATOR SYMBOL LETTER A (RI) ÷ [0.3]" <|
            \_ ->
                "\u{0001}̈🇦"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{0001}", "̈", "🇦" ]
        , test "138: ÷ [0.2] <START OF HEADING> (Control) ÷ [4.0] ARABIC NUMBER SIGN (Prepend) ÷ [0.3]" <|
            \_ ->
                "\u{0001}\u{0600}"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{0001}", "\u{0600}" ]
        , test "139: ÷ [0.2] <START OF HEADING> (Control) ÷ [4.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] ARABIC NUMBER SIGN (Prepend) ÷ [0.3]" <|
            \_ ->
                "\u{0001}̈\u{0600}"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{0001}", "̈", "\u{0600}" ]
        , test "140: ÷ [0.2] <START OF HEADING> (Control) ÷ [4.0] DEVANAGARI SIGN VISARGA (SpacingMark) ÷ [0.3]" <|
            \_ ->
                "\u{0001}ः"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{0001}", "ः" ]
        , test "141: ÷ [0.2] <START OF HEADING> (Control) ÷ [4.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.1] DEVANAGARI SIGN VISARGA (SpacingMark) ÷ [0.3]" <|
            \_ ->
                "\u{0001}̈ः"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{0001}", "̈ः" ]
        , test "142: ÷ [0.2] <START OF HEADING> (Control) ÷ [4.0] HANGUL CHOSEONG KIYEOK (L) ÷ [0.3]" <|
            \_ ->
                "\u{0001}ᄀ"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{0001}", "ᄀ" ]
        , test "143: ÷ [0.2] <START OF HEADING> (Control) ÷ [4.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL CHOSEONG KIYEOK (L) ÷ [0.3]" <|
            \_ ->
                "\u{0001}̈ᄀ"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{0001}", "̈", "ᄀ" ]
        , test "144: ÷ [0.2] <START OF HEADING> (Control) ÷ [4.0] HANGUL JUNGSEONG FILLER (V) ÷ [0.3]" <|
            \_ ->
                "\u{0001}ᅠ"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{0001}", "ᅠ" ]
        , test "145: ÷ [0.2] <START OF HEADING> (Control) ÷ [4.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL JUNGSEONG FILLER (V) ÷ [0.3]" <|
            \_ ->
                "\u{0001}̈ᅠ"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{0001}", "̈", "ᅠ" ]
        , test "146: ÷ [0.2] <START OF HEADING> (Control) ÷ [4.0] HANGUL JONGSEONG KIYEOK (T) ÷ [0.3]" <|
            \_ ->
                "\u{0001}ᆨ"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{0001}", "ᆨ" ]
        , test "147: ÷ [0.2] <START OF HEADING> (Control) ÷ [4.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL JONGSEONG KIYEOK (T) ÷ [0.3]" <|
            \_ ->
                "\u{0001}̈ᆨ"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{0001}", "̈", "ᆨ" ]
        , test "148: ÷ [0.2] <START OF HEADING> (Control) ÷ [4.0] HANGUL SYLLABLE GA (LV) ÷ [0.3]" <|
            \_ ->
                "\u{0001}가"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{0001}", "가" ]
        , test "149: ÷ [0.2] <START OF HEADING> (Control) ÷ [4.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL SYLLABLE GA (LV) ÷ [0.3]" <|
            \_ ->
                "\u{0001}̈가"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{0001}", "̈", "가" ]
        , test "150: ÷ [0.2] <START OF HEADING> (Control) ÷ [4.0] HANGUL SYLLABLE GAG (LVT) ÷ [0.3]" <|
            \_ ->
                "\u{0001}각"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{0001}", "각" ]
        , test "151: ÷ [0.2] <START OF HEADING> (Control) ÷ [4.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL SYLLABLE GAG (LVT) ÷ [0.3]" <|
            \_ ->
                "\u{0001}̈각"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{0001}", "̈", "각" ]
        , test "152: ÷ [0.2] <START OF HEADING> (Control) ÷ [4.0] WATCH (ExtPict) ÷ [0.3]" <|
            \_ ->
                "\u{0001}⌚"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{0001}", "⌚" ]
        , test "153: ÷ [0.2] <START OF HEADING> (Control) ÷ [4.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] WATCH (ExtPict) ÷ [0.3]" <|
            \_ ->
                "\u{0001}̈⌚"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{0001}", "̈", "⌚" ]
        , test "154: ÷ [0.2] <START OF HEADING> (Control) ÷ [4.0] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) ÷ [0.3]" <|
            \_ ->
                "\u{0001}̀"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{0001}", "̀" ]
        , test "155: ÷ [0.2] <START OF HEADING> (Control) ÷ [4.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) ÷ [0.3]" <|
            \_ ->
                "\u{0001}̈̀"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{0001}", "̈̀" ]
        , test "156: ÷ [0.2] <START OF HEADING> (Control) ÷ [4.0] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) ÷ [0.3]" <|
            \_ ->
                "\u{0001}\u{200D}"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{0001}", "\u{200D}" ]
        , test "157: ÷ [0.2] <START OF HEADING> (Control) ÷ [4.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) ÷ [0.3]" <|
            \_ ->
                "\u{0001}̈\u{200D}"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{0001}", "̈\u{200D}" ]
        , test "158: ÷ [0.2] <START OF HEADING> (Control) ÷ [4.0] <reserved-0378> (Other) ÷ [0.3]" <|
            \_ ->
                "\u{0001}\u{0378}"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{0001}", "\u{0378}" ]
        , test "159: ÷ [0.2] <START OF HEADING> (Control) ÷ [4.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] <reserved-0378> (Other) ÷ [0.3]" <|
            \_ ->
                "\u{0001}̈\u{0378}"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{0001}", "̈", "\u{0378}" ]
        , test "160: ÷ [0.2] COMBINING GRAPHEME JOINER (Extend) ÷ [999.0] SPACE (Other) ÷ [0.3]" <|
            \_ ->
                "͏ "
                    |> Grapheme.toList
                    |> Expect.equal [ "͏", " " ]
        , test "161: ÷ [0.2] COMBINING GRAPHEME JOINER (Extend) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] SPACE (Other) ÷ [0.3]" <|
            \_ ->
                "͏̈ "
                    |> Grapheme.toList
                    |> Expect.equal [ "͏̈", " " ]
        , test "162: ÷ [0.2] COMBINING GRAPHEME JOINER (Extend) ÷ [5.0] <CARRIAGE RETURN (CR)> (CR) ÷ [0.3]" <|
            \_ ->
                "͏\u{000D}"
                    |> Grapheme.toList
                    |> Expect.equal [ "͏", "\u{000D}" ]
        , test "163: ÷ [0.2] COMBINING GRAPHEME JOINER (Extend) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [5.0] <CARRIAGE RETURN (CR)> (CR) ÷ [0.3]" <|
            \_ ->
                "͏̈\u{000D}"
                    |> Grapheme.toList
                    |> Expect.equal [ "͏̈", "\u{000D}" ]
        , test "164: ÷ [0.2] COMBINING GRAPHEME JOINER (Extend) ÷ [5.0] <LINE FEED (LF)> (LF) ÷ [0.3]" <|
            \_ ->
                "͏\n"
                    |> Grapheme.toList
                    |> Expect.equal [ "͏", "\n" ]
        , test "165: ÷ [0.2] COMBINING GRAPHEME JOINER (Extend) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [5.0] <LINE FEED (LF)> (LF) ÷ [0.3]" <|
            \_ ->
                "͏̈\n"
                    |> Grapheme.toList
                    |> Expect.equal [ "͏̈", "\n" ]
        , test "166: ÷ [0.2] COMBINING GRAPHEME JOINER (Extend) ÷ [5.0] <START OF HEADING> (Control) ÷ [0.3]" <|
            \_ ->
                "͏\u{0001}"
                    |> Grapheme.toList
                    |> Expect.equal [ "͏", "\u{0001}" ]
        , test "167: ÷ [0.2] COMBINING GRAPHEME JOINER (Extend) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [5.0] <START OF HEADING> (Control) ÷ [0.3]" <|
            \_ ->
                "͏̈\u{0001}"
                    |> Grapheme.toList
                    |> Expect.equal [ "͏̈", "\u{0001}" ]
        , test "168: ÷ [0.2] COMBINING GRAPHEME JOINER (Extend) × [9.0] COMBINING GRAPHEME JOINER (Extend) ÷ [0.3]" <|
            \_ ->
                "͏͏"
                    |> Grapheme.toList
                    |> Expect.equal [ "͏͏" ]
        , test "169: ÷ [0.2] COMBINING GRAPHEME JOINER (Extend) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] COMBINING GRAPHEME JOINER (Extend) ÷ [0.3]" <|
            \_ ->
                "͏̈͏"
                    |> Grapheme.toList
                    |> Expect.equal [ "͏̈͏" ]
        , test "170: ÷ [0.2] COMBINING GRAPHEME JOINER (Extend) ÷ [999.0] REGIONAL INDICATOR SYMBOL LETTER A (RI) ÷ [0.3]" <|
            \_ ->
                "͏🇦"
                    |> Grapheme.toList
                    |> Expect.equal [ "͏", "🇦" ]
        , test "171: ÷ [0.2] COMBINING GRAPHEME JOINER (Extend) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] REGIONAL INDICATOR SYMBOL LETTER A (RI) ÷ [0.3]" <|
            \_ ->
                "͏̈🇦"
                    |> Grapheme.toList
                    |> Expect.equal [ "͏̈", "🇦" ]
        , test "172: ÷ [0.2] COMBINING GRAPHEME JOINER (Extend) ÷ [999.0] ARABIC NUMBER SIGN (Prepend) ÷ [0.3]" <|
            \_ ->
                "͏\u{0600}"
                    |> Grapheme.toList
                    |> Expect.equal [ "͏", "\u{0600}" ]
        , test "173: ÷ [0.2] COMBINING GRAPHEME JOINER (Extend) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] ARABIC NUMBER SIGN (Prepend) ÷ [0.3]" <|
            \_ ->
                "͏̈\u{0600}"
                    |> Grapheme.toList
                    |> Expect.equal [ "͏̈", "\u{0600}" ]
        , test "174: ÷ [0.2] COMBINING GRAPHEME JOINER (Extend) × [9.1] DEVANAGARI SIGN VISARGA (SpacingMark) ÷ [0.3]" <|
            \_ ->
                "͏ः"
                    |> Grapheme.toList
                    |> Expect.equal [ "͏ः" ]
        , test "175: ÷ [0.2] COMBINING GRAPHEME JOINER (Extend) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.1] DEVANAGARI SIGN VISARGA (SpacingMark) ÷ [0.3]" <|
            \_ ->
                "͏̈ः"
                    |> Grapheme.toList
                    |> Expect.equal [ "͏̈ः" ]
        , test "176: ÷ [0.2] COMBINING GRAPHEME JOINER (Extend) ÷ [999.0] HANGUL CHOSEONG KIYEOK (L) ÷ [0.3]" <|
            \_ ->
                "͏ᄀ"
                    |> Grapheme.toList
                    |> Expect.equal [ "͏", "ᄀ" ]
        , test "177: ÷ [0.2] COMBINING GRAPHEME JOINER (Extend) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL CHOSEONG KIYEOK (L) ÷ [0.3]" <|
            \_ ->
                "͏̈ᄀ"
                    |> Grapheme.toList
                    |> Expect.equal [ "͏̈", "ᄀ" ]
        , test "178: ÷ [0.2] COMBINING GRAPHEME JOINER (Extend) ÷ [999.0] HANGUL JUNGSEONG FILLER (V) ÷ [0.3]" <|
            \_ ->
                "͏ᅠ"
                    |> Grapheme.toList
                    |> Expect.equal [ "͏", "ᅠ" ]
        , test "179: ÷ [0.2] COMBINING GRAPHEME JOINER (Extend) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL JUNGSEONG FILLER (V) ÷ [0.3]" <|
            \_ ->
                "͏̈ᅠ"
                    |> Grapheme.toList
                    |> Expect.equal [ "͏̈", "ᅠ" ]
        , test "180: ÷ [0.2] COMBINING GRAPHEME JOINER (Extend) ÷ [999.0] HANGUL JONGSEONG KIYEOK (T) ÷ [0.3]" <|
            \_ ->
                "͏ᆨ"
                    |> Grapheme.toList
                    |> Expect.equal [ "͏", "ᆨ" ]
        , test "181: ÷ [0.2] COMBINING GRAPHEME JOINER (Extend) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL JONGSEONG KIYEOK (T) ÷ [0.3]" <|
            \_ ->
                "͏̈ᆨ"
                    |> Grapheme.toList
                    |> Expect.equal [ "͏̈", "ᆨ" ]
        , test "182: ÷ [0.2] COMBINING GRAPHEME JOINER (Extend) ÷ [999.0] HANGUL SYLLABLE GA (LV) ÷ [0.3]" <|
            \_ ->
                "͏가"
                    |> Grapheme.toList
                    |> Expect.equal [ "͏", "가" ]
        , test "183: ÷ [0.2] COMBINING GRAPHEME JOINER (Extend) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL SYLLABLE GA (LV) ÷ [0.3]" <|
            \_ ->
                "͏̈가"
                    |> Grapheme.toList
                    |> Expect.equal [ "͏̈", "가" ]
        , test "184: ÷ [0.2] COMBINING GRAPHEME JOINER (Extend) ÷ [999.0] HANGUL SYLLABLE GAG (LVT) ÷ [0.3]" <|
            \_ ->
                "͏각"
                    |> Grapheme.toList
                    |> Expect.equal [ "͏", "각" ]
        , test "185: ÷ [0.2] COMBINING GRAPHEME JOINER (Extend) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL SYLLABLE GAG (LVT) ÷ [0.3]" <|
            \_ ->
                "͏̈각"
                    |> Grapheme.toList
                    |> Expect.equal [ "͏̈", "각" ]
        , test "186: ÷ [0.2] COMBINING GRAPHEME JOINER (Extend) ÷ [999.0] WATCH (ExtPict) ÷ [0.3]" <|
            \_ ->
                "͏⌚"
                    |> Grapheme.toList
                    |> Expect.equal [ "͏", "⌚" ]
        , test "187: ÷ [0.2] COMBINING GRAPHEME JOINER (Extend) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] WATCH (ExtPict) ÷ [0.3]" <|
            \_ ->
                "͏̈⌚"
                    |> Grapheme.toList
                    |> Expect.equal [ "͏̈", "⌚" ]
        , test "188: ÷ [0.2] COMBINING GRAPHEME JOINER (Extend) × [9.0] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) ÷ [0.3]" <|
            \_ ->
                "͏̀"
                    |> Grapheme.toList
                    |> Expect.equal [ "͏̀" ]
        , test "189: ÷ [0.2] COMBINING GRAPHEME JOINER (Extend) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) ÷ [0.3]" <|
            \_ ->
                "͏̈̀"
                    |> Grapheme.toList
                    |> Expect.equal [ "͏̈̀" ]
        , test "190: ÷ [0.2] COMBINING GRAPHEME JOINER (Extend) × [9.0] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) ÷ [0.3]" <|
            \_ ->
                "͏\u{200D}"
                    |> Grapheme.toList
                    |> Expect.equal [ "͏\u{200D}" ]
        , test "191: ÷ [0.2] COMBINING GRAPHEME JOINER (Extend) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) ÷ [0.3]" <|
            \_ ->
                "͏̈\u{200D}"
                    |> Grapheme.toList
                    |> Expect.equal [ "͏̈\u{200D}" ]
        , test "192: ÷ [0.2] COMBINING GRAPHEME JOINER (Extend) ÷ [999.0] <reserved-0378> (Other) ÷ [0.3]" <|
            \_ ->
                "͏\u{0378}"
                    |> Grapheme.toList
                    |> Expect.equal [ "͏", "\u{0378}" ]
        , test "193: ÷ [0.2] COMBINING GRAPHEME JOINER (Extend) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] <reserved-0378> (Other) ÷ [0.3]" <|
            \_ ->
                "͏̈\u{0378}"
                    |> Grapheme.toList
                    |> Expect.equal [ "͏̈", "\u{0378}" ]
        , test "194: ÷ [0.2] REGIONAL INDICATOR SYMBOL LETTER A (RI) ÷ [999.0] SPACE (Other) ÷ [0.3]" <|
            \_ ->
                "🇦 "
                    |> Grapheme.toList
                    |> Expect.equal [ "🇦", " " ]
        , test "195: ÷ [0.2] REGIONAL INDICATOR SYMBOL LETTER A (RI) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] SPACE (Other) ÷ [0.3]" <|
            \_ ->
                "🇦̈ "
                    |> Grapheme.toList
                    |> Expect.equal [ "🇦̈", " " ]
        , test "196: ÷ [0.2] REGIONAL INDICATOR SYMBOL LETTER A (RI) ÷ [5.0] <CARRIAGE RETURN (CR)> (CR) ÷ [0.3]" <|
            \_ ->
                "🇦\u{000D}"
                    |> Grapheme.toList
                    |> Expect.equal [ "🇦", "\u{000D}" ]
        , test "197: ÷ [0.2] REGIONAL INDICATOR SYMBOL LETTER A (RI) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [5.0] <CARRIAGE RETURN (CR)> (CR) ÷ [0.3]" <|
            \_ ->
                "🇦̈\u{000D}"
                    |> Grapheme.toList
                    |> Expect.equal [ "🇦̈", "\u{000D}" ]
        , test "198: ÷ [0.2] REGIONAL INDICATOR SYMBOL LETTER A (RI) ÷ [5.0] <LINE FEED (LF)> (LF) ÷ [0.3]" <|
            \_ ->
                "🇦\n"
                    |> Grapheme.toList
                    |> Expect.equal [ "🇦", "\n" ]
        , test "199: ÷ [0.2] REGIONAL INDICATOR SYMBOL LETTER A (RI) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [5.0] <LINE FEED (LF)> (LF) ÷ [0.3]" <|
            \_ ->
                "🇦̈\n"
                    |> Grapheme.toList
                    |> Expect.equal [ "🇦̈", "\n" ]
        , test "200: ÷ [0.2] REGIONAL INDICATOR SYMBOL LETTER A (RI) ÷ [5.0] <START OF HEADING> (Control) ÷ [0.3]" <|
            \_ ->
                "🇦\u{0001}"
                    |> Grapheme.toList
                    |> Expect.equal [ "🇦", "\u{0001}" ]
        , test "201: ÷ [0.2] REGIONAL INDICATOR SYMBOL LETTER A (RI) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [5.0] <START OF HEADING> (Control) ÷ [0.3]" <|
            \_ ->
                "🇦̈\u{0001}"
                    |> Grapheme.toList
                    |> Expect.equal [ "🇦̈", "\u{0001}" ]
        , test "202: ÷ [0.2] REGIONAL INDICATOR SYMBOL LETTER A (RI) × [9.0] COMBINING GRAPHEME JOINER (Extend) ÷ [0.3]" <|
            \_ ->
                "🇦͏"
                    |> Grapheme.toList
                    |> Expect.equal [ "🇦͏" ]
        , test "203: ÷ [0.2] REGIONAL INDICATOR SYMBOL LETTER A (RI) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] COMBINING GRAPHEME JOINER (Extend) ÷ [0.3]" <|
            \_ ->
                "🇦̈͏"
                    |> Grapheme.toList
                    |> Expect.equal [ "🇦̈͏" ]
        , test "204: ÷ [0.2] REGIONAL INDICATOR SYMBOL LETTER A (RI) × [12.0] REGIONAL INDICATOR SYMBOL LETTER A (RI) ÷ [0.3]" <|
            \_ ->
                "🇦🇦"
                    |> Grapheme.toList
                    |> Expect.equal [ "🇦🇦" ]
        , test "205: ÷ [0.2] REGIONAL INDICATOR SYMBOL LETTER A (RI) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] REGIONAL INDICATOR SYMBOL LETTER A (RI) ÷ [0.3]" <|
            \_ ->
                "🇦̈🇦"
                    |> Grapheme.toList
                    |> Expect.equal [ "🇦̈", "🇦" ]
        , test "206: ÷ [0.2] REGIONAL INDICATOR SYMBOL LETTER A (RI) ÷ [999.0] ARABIC NUMBER SIGN (Prepend) ÷ [0.3]" <|
            \_ ->
                "🇦\u{0600}"
                    |> Grapheme.toList
                    |> Expect.equal [ "🇦", "\u{0600}" ]
        , test "207: ÷ [0.2] REGIONAL INDICATOR SYMBOL LETTER A (RI) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] ARABIC NUMBER SIGN (Prepend) ÷ [0.3]" <|
            \_ ->
                "🇦̈\u{0600}"
                    |> Grapheme.toList
                    |> Expect.equal [ "🇦̈", "\u{0600}" ]
        , test "208: ÷ [0.2] REGIONAL INDICATOR SYMBOL LETTER A (RI) × [9.1] DEVANAGARI SIGN VISARGA (SpacingMark) ÷ [0.3]" <|
            \_ ->
                "🇦ः"
                    |> Grapheme.toList
                    |> Expect.equal [ "🇦ः" ]
        , test "209: ÷ [0.2] REGIONAL INDICATOR SYMBOL LETTER A (RI) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.1] DEVANAGARI SIGN VISARGA (SpacingMark) ÷ [0.3]" <|
            \_ ->
                "🇦̈ः"
                    |> Grapheme.toList
                    |> Expect.equal [ "🇦̈ः" ]
        , test "210: ÷ [0.2] REGIONAL INDICATOR SYMBOL LETTER A (RI) ÷ [999.0] HANGUL CHOSEONG KIYEOK (L) ÷ [0.3]" <|
            \_ ->
                "🇦ᄀ"
                    |> Grapheme.toList
                    |> Expect.equal [ "🇦", "ᄀ" ]
        , test "211: ÷ [0.2] REGIONAL INDICATOR SYMBOL LETTER A (RI) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL CHOSEONG KIYEOK (L) ÷ [0.3]" <|
            \_ ->
                "🇦̈ᄀ"
                    |> Grapheme.toList
                    |> Expect.equal [ "🇦̈", "ᄀ" ]
        , test "212: ÷ [0.2] REGIONAL INDICATOR SYMBOL LETTER A (RI) ÷ [999.0] HANGUL JUNGSEONG FILLER (V) ÷ [0.3]" <|
            \_ ->
                "🇦ᅠ"
                    |> Grapheme.toList
                    |> Expect.equal [ "🇦", "ᅠ" ]
        , test "213: ÷ [0.2] REGIONAL INDICATOR SYMBOL LETTER A (RI) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL JUNGSEONG FILLER (V) ÷ [0.3]" <|
            \_ ->
                "🇦̈ᅠ"
                    |> Grapheme.toList
                    |> Expect.equal [ "🇦̈", "ᅠ" ]
        , test "214: ÷ [0.2] REGIONAL INDICATOR SYMBOL LETTER A (RI) ÷ [999.0] HANGUL JONGSEONG KIYEOK (T) ÷ [0.3]" <|
            \_ ->
                "🇦ᆨ"
                    |> Grapheme.toList
                    |> Expect.equal [ "🇦", "ᆨ" ]
        , test "215: ÷ [0.2] REGIONAL INDICATOR SYMBOL LETTER A (RI) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL JONGSEONG KIYEOK (T) ÷ [0.3]" <|
            \_ ->
                "🇦̈ᆨ"
                    |> Grapheme.toList
                    |> Expect.equal [ "🇦̈", "ᆨ" ]
        , test "216: ÷ [0.2] REGIONAL INDICATOR SYMBOL LETTER A (RI) ÷ [999.0] HANGUL SYLLABLE GA (LV) ÷ [0.3]" <|
            \_ ->
                "🇦가"
                    |> Grapheme.toList
                    |> Expect.equal [ "🇦", "가" ]
        , test "217: ÷ [0.2] REGIONAL INDICATOR SYMBOL LETTER A (RI) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL SYLLABLE GA (LV) ÷ [0.3]" <|
            \_ ->
                "🇦̈가"
                    |> Grapheme.toList
                    |> Expect.equal [ "🇦̈", "가" ]
        , test "218: ÷ [0.2] REGIONAL INDICATOR SYMBOL LETTER A (RI) ÷ [999.0] HANGUL SYLLABLE GAG (LVT) ÷ [0.3]" <|
            \_ ->
                "🇦각"
                    |> Grapheme.toList
                    |> Expect.equal [ "🇦", "각" ]
        , test "219: ÷ [0.2] REGIONAL INDICATOR SYMBOL LETTER A (RI) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL SYLLABLE GAG (LVT) ÷ [0.3]" <|
            \_ ->
                "🇦̈각"
                    |> Grapheme.toList
                    |> Expect.equal [ "🇦̈", "각" ]
        , test "220: ÷ [0.2] REGIONAL INDICATOR SYMBOL LETTER A (RI) ÷ [999.0] WATCH (ExtPict) ÷ [0.3]" <|
            \_ ->
                "🇦⌚"
                    |> Grapheme.toList
                    |> Expect.equal [ "🇦", "⌚" ]
        , test "221: ÷ [0.2] REGIONAL INDICATOR SYMBOL LETTER A (RI) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] WATCH (ExtPict) ÷ [0.3]" <|
            \_ ->
                "🇦̈⌚"
                    |> Grapheme.toList
                    |> Expect.equal [ "🇦̈", "⌚" ]
        , test "222: ÷ [0.2] REGIONAL INDICATOR SYMBOL LETTER A (RI) × [9.0] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) ÷ [0.3]" <|
            \_ ->
                "🇦̀"
                    |> Grapheme.toList
                    |> Expect.equal [ "🇦̀" ]
        , test "223: ÷ [0.2] REGIONAL INDICATOR SYMBOL LETTER A (RI) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) ÷ [0.3]" <|
            \_ ->
                "🇦̈̀"
                    |> Grapheme.toList
                    |> Expect.equal [ "🇦̈̀" ]
        , test "224: ÷ [0.2] REGIONAL INDICATOR SYMBOL LETTER A (RI) × [9.0] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) ÷ [0.3]" <|
            \_ ->
                "🇦\u{200D}"
                    |> Grapheme.toList
                    |> Expect.equal [ "🇦\u{200D}" ]
        , test "225: ÷ [0.2] REGIONAL INDICATOR SYMBOL LETTER A (RI) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) ÷ [0.3]" <|
            \_ ->
                "🇦̈\u{200D}"
                    |> Grapheme.toList
                    |> Expect.equal [ "🇦̈\u{200D}" ]
        , test "226: ÷ [0.2] REGIONAL INDICATOR SYMBOL LETTER A (RI) ÷ [999.0] <reserved-0378> (Other) ÷ [0.3]" <|
            \_ ->
                "🇦\u{0378}"
                    |> Grapheme.toList
                    |> Expect.equal [ "🇦", "\u{0378}" ]
        , test "227: ÷ [0.2] REGIONAL INDICATOR SYMBOL LETTER A (RI) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] <reserved-0378> (Other) ÷ [0.3]" <|
            \_ ->
                "🇦̈\u{0378}"
                    |> Grapheme.toList
                    |> Expect.equal [ "🇦̈", "\u{0378}" ]
        , test "228: ÷ [0.2] ARABIC NUMBER SIGN (Prepend) × [9.2] SPACE (Other) ÷ [0.3]" <|
            \_ ->
                "\u{0600} "
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{0600} " ]
        , test "229: ÷ [0.2] ARABIC NUMBER SIGN (Prepend) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] SPACE (Other) ÷ [0.3]" <|
            \_ ->
                "\u{0600}̈ "
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{0600}̈", " " ]
        , test "230: ÷ [0.2] ARABIC NUMBER SIGN (Prepend) ÷ [5.0] <CARRIAGE RETURN (CR)> (CR) ÷ [0.3]" <|
            \_ ->
                "\u{0600}\u{000D}"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{0600}", "\u{000D}" ]
        , test "231: ÷ [0.2] ARABIC NUMBER SIGN (Prepend) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [5.0] <CARRIAGE RETURN (CR)> (CR) ÷ [0.3]" <|
            \_ ->
                "\u{0600}̈\u{000D}"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{0600}̈", "\u{000D}" ]
        , test "232: ÷ [0.2] ARABIC NUMBER SIGN (Prepend) ÷ [5.0] <LINE FEED (LF)> (LF) ÷ [0.3]" <|
            \_ ->
                "\u{0600}\n"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{0600}", "\n" ]
        , test "233: ÷ [0.2] ARABIC NUMBER SIGN (Prepend) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [5.0] <LINE FEED (LF)> (LF) ÷ [0.3]" <|
            \_ ->
                "\u{0600}̈\n"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{0600}̈", "\n" ]
        , test "234: ÷ [0.2] ARABIC NUMBER SIGN (Prepend) ÷ [5.0] <START OF HEADING> (Control) ÷ [0.3]" <|
            \_ ->
                "\u{0600}\u{0001}"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{0600}", "\u{0001}" ]
        , test "235: ÷ [0.2] ARABIC NUMBER SIGN (Prepend) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [5.0] <START OF HEADING> (Control) ÷ [0.3]" <|
            \_ ->
                "\u{0600}̈\u{0001}"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{0600}̈", "\u{0001}" ]
        , test "236: ÷ [0.2] ARABIC NUMBER SIGN (Prepend) × [9.0] COMBINING GRAPHEME JOINER (Extend) ÷ [0.3]" <|
            \_ ->
                "\u{0600}͏"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{0600}͏" ]
        , test "237: ÷ [0.2] ARABIC NUMBER SIGN (Prepend) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] COMBINING GRAPHEME JOINER (Extend) ÷ [0.3]" <|
            \_ ->
                "\u{0600}̈͏"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{0600}̈͏" ]
        , test "238: ÷ [0.2] ARABIC NUMBER SIGN (Prepend) × [9.2] REGIONAL INDICATOR SYMBOL LETTER A (RI) ÷ [0.3]" <|
            \_ ->
                "\u{0600}🇦"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{0600}🇦" ]
        , test "239: ÷ [0.2] ARABIC NUMBER SIGN (Prepend) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] REGIONAL INDICATOR SYMBOL LETTER A (RI) ÷ [0.3]" <|
            \_ ->
                "\u{0600}̈🇦"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{0600}̈", "🇦" ]
        , test "240: ÷ [0.2] ARABIC NUMBER SIGN (Prepend) × [9.2] ARABIC NUMBER SIGN (Prepend) ÷ [0.3]" <|
            \_ ->
                "\u{0600}\u{0600}"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{0600}\u{0600}" ]
        , test "241: ÷ [0.2] ARABIC NUMBER SIGN (Prepend) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] ARABIC NUMBER SIGN (Prepend) ÷ [0.3]" <|
            \_ ->
                "\u{0600}̈\u{0600}"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{0600}̈", "\u{0600}" ]
        , test "242: ÷ [0.2] ARABIC NUMBER SIGN (Prepend) × [9.1] DEVANAGARI SIGN VISARGA (SpacingMark) ÷ [0.3]" <|
            \_ ->
                "\u{0600}ः"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{0600}ः" ]
        , test "243: ÷ [0.2] ARABIC NUMBER SIGN (Prepend) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.1] DEVANAGARI SIGN VISARGA (SpacingMark) ÷ [0.3]" <|
            \_ ->
                "\u{0600}̈ः"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{0600}̈ः" ]
        , test "244: ÷ [0.2] ARABIC NUMBER SIGN (Prepend) × [9.2] HANGUL CHOSEONG KIYEOK (L) ÷ [0.3]" <|
            \_ ->
                "\u{0600}ᄀ"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{0600}ᄀ" ]
        , test "245: ÷ [0.2] ARABIC NUMBER SIGN (Prepend) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL CHOSEONG KIYEOK (L) ÷ [0.3]" <|
            \_ ->
                "\u{0600}̈ᄀ"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{0600}̈", "ᄀ" ]
        , test "246: ÷ [0.2] ARABIC NUMBER SIGN (Prepend) × [9.2] HANGUL JUNGSEONG FILLER (V) ÷ [0.3]" <|
            \_ ->
                "\u{0600}ᅠ"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{0600}ᅠ" ]
        , test "247: ÷ [0.2] ARABIC NUMBER SIGN (Prepend) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL JUNGSEONG FILLER (V) ÷ [0.3]" <|
            \_ ->
                "\u{0600}̈ᅠ"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{0600}̈", "ᅠ" ]
        , test "248: ÷ [0.2] ARABIC NUMBER SIGN (Prepend) × [9.2] HANGUL JONGSEONG KIYEOK (T) ÷ [0.3]" <|
            \_ ->
                "\u{0600}ᆨ"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{0600}ᆨ" ]
        , test "249: ÷ [0.2] ARABIC NUMBER SIGN (Prepend) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL JONGSEONG KIYEOK (T) ÷ [0.3]" <|
            \_ ->
                "\u{0600}̈ᆨ"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{0600}̈", "ᆨ" ]
        , test "250: ÷ [0.2] ARABIC NUMBER SIGN (Prepend) × [9.2] HANGUL SYLLABLE GA (LV) ÷ [0.3]" <|
            \_ ->
                "\u{0600}가"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{0600}가" ]
        , test "251: ÷ [0.2] ARABIC NUMBER SIGN (Prepend) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL SYLLABLE GA (LV) ÷ [0.3]" <|
            \_ ->
                "\u{0600}̈가"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{0600}̈", "가" ]
        , test "252: ÷ [0.2] ARABIC NUMBER SIGN (Prepend) × [9.2] HANGUL SYLLABLE GAG (LVT) ÷ [0.3]" <|
            \_ ->
                "\u{0600}각"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{0600}각" ]
        , test "253: ÷ [0.2] ARABIC NUMBER SIGN (Prepend) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL SYLLABLE GAG (LVT) ÷ [0.3]" <|
            \_ ->
                "\u{0600}̈각"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{0600}̈", "각" ]
        , test "254: ÷ [0.2] ARABIC NUMBER SIGN (Prepend) × [9.2] WATCH (ExtPict) ÷ [0.3]" <|
            \_ ->
                "\u{0600}⌚"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{0600}⌚" ]
        , test "255: ÷ [0.2] ARABIC NUMBER SIGN (Prepend) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] WATCH (ExtPict) ÷ [0.3]" <|
            \_ ->
                "\u{0600}̈⌚"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{0600}̈", "⌚" ]
        , test "256: ÷ [0.2] ARABIC NUMBER SIGN (Prepend) × [9.0] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) ÷ [0.3]" <|
            \_ ->
                "\u{0600}̀"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{0600}̀" ]
        , test "257: ÷ [0.2] ARABIC NUMBER SIGN (Prepend) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) ÷ [0.3]" <|
            \_ ->
                "\u{0600}̈̀"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{0600}̈̀" ]
        , test "258: ÷ [0.2] ARABIC NUMBER SIGN (Prepend) × [9.0] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) ÷ [0.3]" <|
            \_ ->
                "\u{0600}\u{200D}"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{0600}\u{200D}" ]
        , test "259: ÷ [0.2] ARABIC NUMBER SIGN (Prepend) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) ÷ [0.3]" <|
            \_ ->
                "\u{0600}̈\u{200D}"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{0600}̈\u{200D}" ]
        , test "260: ÷ [0.2] ARABIC NUMBER SIGN (Prepend) × [9.2] <reserved-0378> (Other) ÷ [0.3]" <|
            \_ ->
                "\u{0600}\u{0378}"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{0600}\u{0378}" ]
        , test "261: ÷ [0.2] ARABIC NUMBER SIGN (Prepend) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] <reserved-0378> (Other) ÷ [0.3]" <|
            \_ ->
                "\u{0600}̈\u{0378}"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{0600}̈", "\u{0378}" ]
        , test "262: ÷ [0.2] DEVANAGARI SIGN VISARGA (SpacingMark) ÷ [999.0] SPACE (Other) ÷ [0.3]" <|
            \_ ->
                "ः "
                    |> Grapheme.toList
                    |> Expect.equal [ "ः", " " ]
        , test "263: ÷ [0.2] DEVANAGARI SIGN VISARGA (SpacingMark) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] SPACE (Other) ÷ [0.3]" <|
            \_ ->
                "ः̈ "
                    |> Grapheme.toList
                    |> Expect.equal [ "ः̈", " " ]
        , test "264: ÷ [0.2] DEVANAGARI SIGN VISARGA (SpacingMark) ÷ [5.0] <CARRIAGE RETURN (CR)> (CR) ÷ [0.3]" <|
            \_ ->
                "ः\u{000D}"
                    |> Grapheme.toList
                    |> Expect.equal [ "ः", "\u{000D}" ]
        , test "265: ÷ [0.2] DEVANAGARI SIGN VISARGA (SpacingMark) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [5.0] <CARRIAGE RETURN (CR)> (CR) ÷ [0.3]" <|
            \_ ->
                "ः̈\u{000D}"
                    |> Grapheme.toList
                    |> Expect.equal [ "ः̈", "\u{000D}" ]
        , test "266: ÷ [0.2] DEVANAGARI SIGN VISARGA (SpacingMark) ÷ [5.0] <LINE FEED (LF)> (LF) ÷ [0.3]" <|
            \_ ->
                "ः\n"
                    |> Grapheme.toList
                    |> Expect.equal [ "ः", "\n" ]
        , test "267: ÷ [0.2] DEVANAGARI SIGN VISARGA (SpacingMark) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [5.0] <LINE FEED (LF)> (LF) ÷ [0.3]" <|
            \_ ->
                "ः̈\n"
                    |> Grapheme.toList
                    |> Expect.equal [ "ः̈", "\n" ]
        , test "268: ÷ [0.2] DEVANAGARI SIGN VISARGA (SpacingMark) ÷ [5.0] <START OF HEADING> (Control) ÷ [0.3]" <|
            \_ ->
                "ः\u{0001}"
                    |> Grapheme.toList
                    |> Expect.equal [ "ः", "\u{0001}" ]
        , test "269: ÷ [0.2] DEVANAGARI SIGN VISARGA (SpacingMark) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [5.0] <START OF HEADING> (Control) ÷ [0.3]" <|
            \_ ->
                "ः̈\u{0001}"
                    |> Grapheme.toList
                    |> Expect.equal [ "ः̈", "\u{0001}" ]
        , test "270: ÷ [0.2] DEVANAGARI SIGN VISARGA (SpacingMark) × [9.0] COMBINING GRAPHEME JOINER (Extend) ÷ [0.3]" <|
            \_ ->
                "ः͏"
                    |> Grapheme.toList
                    |> Expect.equal [ "ः͏" ]
        , test "271: ÷ [0.2] DEVANAGARI SIGN VISARGA (SpacingMark) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] COMBINING GRAPHEME JOINER (Extend) ÷ [0.3]" <|
            \_ ->
                "ः̈͏"
                    |> Grapheme.toList
                    |> Expect.equal [ "ः̈͏" ]
        , test "272: ÷ [0.2] DEVANAGARI SIGN VISARGA (SpacingMark) ÷ [999.0] REGIONAL INDICATOR SYMBOL LETTER A (RI) ÷ [0.3]" <|
            \_ ->
                "ः🇦"
                    |> Grapheme.toList
                    |> Expect.equal [ "ः", "🇦" ]
        , test "273: ÷ [0.2] DEVANAGARI SIGN VISARGA (SpacingMark) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] REGIONAL INDICATOR SYMBOL LETTER A (RI) ÷ [0.3]" <|
            \_ ->
                "ः̈🇦"
                    |> Grapheme.toList
                    |> Expect.equal [ "ः̈", "🇦" ]
        , test "274: ÷ [0.2] DEVANAGARI SIGN VISARGA (SpacingMark) ÷ [999.0] ARABIC NUMBER SIGN (Prepend) ÷ [0.3]" <|
            \_ ->
                "ः\u{0600}"
                    |> Grapheme.toList
                    |> Expect.equal [ "ः", "\u{0600}" ]
        , test "275: ÷ [0.2] DEVANAGARI SIGN VISARGA (SpacingMark) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] ARABIC NUMBER SIGN (Prepend) ÷ [0.3]" <|
            \_ ->
                "ः̈\u{0600}"
                    |> Grapheme.toList
                    |> Expect.equal [ "ः̈", "\u{0600}" ]
        , test "276: ÷ [0.2] DEVANAGARI SIGN VISARGA (SpacingMark) × [9.1] DEVANAGARI SIGN VISARGA (SpacingMark) ÷ [0.3]" <|
            \_ ->
                "ःः"
                    |> Grapheme.toList
                    |> Expect.equal [ "ःः" ]
        , test "277: ÷ [0.2] DEVANAGARI SIGN VISARGA (SpacingMark) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.1] DEVANAGARI SIGN VISARGA (SpacingMark) ÷ [0.3]" <|
            \_ ->
                "ः̈ः"
                    |> Grapheme.toList
                    |> Expect.equal [ "ः̈ः" ]
        , test "278: ÷ [0.2] DEVANAGARI SIGN VISARGA (SpacingMark) ÷ [999.0] HANGUL CHOSEONG KIYEOK (L) ÷ [0.3]" <|
            \_ ->
                "ःᄀ"
                    |> Grapheme.toList
                    |> Expect.equal [ "ः", "ᄀ" ]
        , test "279: ÷ [0.2] DEVANAGARI SIGN VISARGA (SpacingMark) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL CHOSEONG KIYEOK (L) ÷ [0.3]" <|
            \_ ->
                "ः̈ᄀ"
                    |> Grapheme.toList
                    |> Expect.equal [ "ः̈", "ᄀ" ]
        , test "280: ÷ [0.2] DEVANAGARI SIGN VISARGA (SpacingMark) ÷ [999.0] HANGUL JUNGSEONG FILLER (V) ÷ [0.3]" <|
            \_ ->
                "ःᅠ"
                    |> Grapheme.toList
                    |> Expect.equal [ "ः", "ᅠ" ]
        , test "281: ÷ [0.2] DEVANAGARI SIGN VISARGA (SpacingMark) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL JUNGSEONG FILLER (V) ÷ [0.3]" <|
            \_ ->
                "ः̈ᅠ"
                    |> Grapheme.toList
                    |> Expect.equal [ "ः̈", "ᅠ" ]
        , test "282: ÷ [0.2] DEVANAGARI SIGN VISARGA (SpacingMark) ÷ [999.0] HANGUL JONGSEONG KIYEOK (T) ÷ [0.3]" <|
            \_ ->
                "ःᆨ"
                    |> Grapheme.toList
                    |> Expect.equal [ "ः", "ᆨ" ]
        , test "283: ÷ [0.2] DEVANAGARI SIGN VISARGA (SpacingMark) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL JONGSEONG KIYEOK (T) ÷ [0.3]" <|
            \_ ->
                "ः̈ᆨ"
                    |> Grapheme.toList
                    |> Expect.equal [ "ः̈", "ᆨ" ]
        , test "284: ÷ [0.2] DEVANAGARI SIGN VISARGA (SpacingMark) ÷ [999.0] HANGUL SYLLABLE GA (LV) ÷ [0.3]" <|
            \_ ->
                "ः가"
                    |> Grapheme.toList
                    |> Expect.equal [ "ः", "가" ]
        , test "285: ÷ [0.2] DEVANAGARI SIGN VISARGA (SpacingMark) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL SYLLABLE GA (LV) ÷ [0.3]" <|
            \_ ->
                "ः̈가"
                    |> Grapheme.toList
                    |> Expect.equal [ "ः̈", "가" ]
        , test "286: ÷ [0.2] DEVANAGARI SIGN VISARGA (SpacingMark) ÷ [999.0] HANGUL SYLLABLE GAG (LVT) ÷ [0.3]" <|
            \_ ->
                "ः각"
                    |> Grapheme.toList
                    |> Expect.equal [ "ः", "각" ]
        , test "287: ÷ [0.2] DEVANAGARI SIGN VISARGA (SpacingMark) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL SYLLABLE GAG (LVT) ÷ [0.3]" <|
            \_ ->
                "ः̈각"
                    |> Grapheme.toList
                    |> Expect.equal [ "ः̈", "각" ]
        , test "288: ÷ [0.2] DEVANAGARI SIGN VISARGA (SpacingMark) ÷ [999.0] WATCH (ExtPict) ÷ [0.3]" <|
            \_ ->
                "ः⌚"
                    |> Grapheme.toList
                    |> Expect.equal [ "ः", "⌚" ]
        , test "289: ÷ [0.2] DEVANAGARI SIGN VISARGA (SpacingMark) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] WATCH (ExtPict) ÷ [0.3]" <|
            \_ ->
                "ः̈⌚"
                    |> Grapheme.toList
                    |> Expect.equal [ "ः̈", "⌚" ]
        , test "290: ÷ [0.2] DEVANAGARI SIGN VISARGA (SpacingMark) × [9.0] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) ÷ [0.3]" <|
            \_ ->
                "ः̀"
                    |> Grapheme.toList
                    |> Expect.equal [ "ः̀" ]
        , test "291: ÷ [0.2] DEVANAGARI SIGN VISARGA (SpacingMark) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) ÷ [0.3]" <|
            \_ ->
                "ः̈̀"
                    |> Grapheme.toList
                    |> Expect.equal [ "ः̈̀" ]
        , test "292: ÷ [0.2] DEVANAGARI SIGN VISARGA (SpacingMark) × [9.0] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) ÷ [0.3]" <|
            \_ ->
                "ः\u{200D}"
                    |> Grapheme.toList
                    |> Expect.equal [ "ः\u{200D}" ]
        , test "293: ÷ [0.2] DEVANAGARI SIGN VISARGA (SpacingMark) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) ÷ [0.3]" <|
            \_ ->
                "ः̈\u{200D}"
                    |> Grapheme.toList
                    |> Expect.equal [ "ः̈\u{200D}" ]
        , test "294: ÷ [0.2] DEVANAGARI SIGN VISARGA (SpacingMark) ÷ [999.0] <reserved-0378> (Other) ÷ [0.3]" <|
            \_ ->
                "ः\u{0378}"
                    |> Grapheme.toList
                    |> Expect.equal [ "ः", "\u{0378}" ]
        , test "295: ÷ [0.2] DEVANAGARI SIGN VISARGA (SpacingMark) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] <reserved-0378> (Other) ÷ [0.3]" <|
            \_ ->
                "ः̈\u{0378}"
                    |> Grapheme.toList
                    |> Expect.equal [ "ः̈", "\u{0378}" ]
        , test "296: ÷ [0.2] HANGUL CHOSEONG KIYEOK (L) ÷ [999.0] SPACE (Other) ÷ [0.3]" <|
            \_ ->
                "ᄀ "
                    |> Grapheme.toList
                    |> Expect.equal [ "ᄀ", " " ]
        , test "297: ÷ [0.2] HANGUL CHOSEONG KIYEOK (L) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] SPACE (Other) ÷ [0.3]" <|
            \_ ->
                "ᄀ̈ "
                    |> Grapheme.toList
                    |> Expect.equal [ "ᄀ̈", " " ]
        , test "298: ÷ [0.2] HANGUL CHOSEONG KIYEOK (L) ÷ [5.0] <CARRIAGE RETURN (CR)> (CR) ÷ [0.3]" <|
            \_ ->
                "ᄀ\u{000D}"
                    |> Grapheme.toList
                    |> Expect.equal [ "ᄀ", "\u{000D}" ]
        , test "299: ÷ [0.2] HANGUL CHOSEONG KIYEOK (L) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [5.0] <CARRIAGE RETURN (CR)> (CR) ÷ [0.3]" <|
            \_ ->
                "ᄀ̈\u{000D}"
                    |> Grapheme.toList
                    |> Expect.equal [ "ᄀ̈", "\u{000D}" ]
        , test "300: ÷ [0.2] HANGUL CHOSEONG KIYEOK (L) ÷ [5.0] <LINE FEED (LF)> (LF) ÷ [0.3]" <|
            \_ ->
                "ᄀ\n"
                    |> Grapheme.toList
                    |> Expect.equal [ "ᄀ", "\n" ]
        , test "301: ÷ [0.2] HANGUL CHOSEONG KIYEOK (L) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [5.0] <LINE FEED (LF)> (LF) ÷ [0.3]" <|
            \_ ->
                "ᄀ̈\n"
                    |> Grapheme.toList
                    |> Expect.equal [ "ᄀ̈", "\n" ]
        , test "302: ÷ [0.2] HANGUL CHOSEONG KIYEOK (L) ÷ [5.0] <START OF HEADING> (Control) ÷ [0.3]" <|
            \_ ->
                "ᄀ\u{0001}"
                    |> Grapheme.toList
                    |> Expect.equal [ "ᄀ", "\u{0001}" ]
        , test "303: ÷ [0.2] HANGUL CHOSEONG KIYEOK (L) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [5.0] <START OF HEADING> (Control) ÷ [0.3]" <|
            \_ ->
                "ᄀ̈\u{0001}"
                    |> Grapheme.toList
                    |> Expect.equal [ "ᄀ̈", "\u{0001}" ]
        , test "304: ÷ [0.2] HANGUL CHOSEONG KIYEOK (L) × [9.0] COMBINING GRAPHEME JOINER (Extend) ÷ [0.3]" <|
            \_ ->
                "ᄀ͏"
                    |> Grapheme.toList
                    |> Expect.equal [ "ᄀ͏" ]
        , test "305: ÷ [0.2] HANGUL CHOSEONG KIYEOK (L) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] COMBINING GRAPHEME JOINER (Extend) ÷ [0.3]" <|
            \_ ->
                "ᄀ̈͏"
                    |> Grapheme.toList
                    |> Expect.equal [ "ᄀ̈͏" ]
        , test "306: ÷ [0.2] HANGUL CHOSEONG KIYEOK (L) ÷ [999.0] REGIONAL INDICATOR SYMBOL LETTER A (RI) ÷ [0.3]" <|
            \_ ->
                "ᄀ🇦"
                    |> Grapheme.toList
                    |> Expect.equal [ "ᄀ", "🇦" ]
        , test "307: ÷ [0.2] HANGUL CHOSEONG KIYEOK (L) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] REGIONAL INDICATOR SYMBOL LETTER A (RI) ÷ [0.3]" <|
            \_ ->
                "ᄀ̈🇦"
                    |> Grapheme.toList
                    |> Expect.equal [ "ᄀ̈", "🇦" ]
        , test "308: ÷ [0.2] HANGUL CHOSEONG KIYEOK (L) ÷ [999.0] ARABIC NUMBER SIGN (Prepend) ÷ [0.3]" <|
            \_ ->
                "ᄀ\u{0600}"
                    |> Grapheme.toList
                    |> Expect.equal [ "ᄀ", "\u{0600}" ]
        , test "309: ÷ [0.2] HANGUL CHOSEONG KIYEOK (L) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] ARABIC NUMBER SIGN (Prepend) ÷ [0.3]" <|
            \_ ->
                "ᄀ̈\u{0600}"
                    |> Grapheme.toList
                    |> Expect.equal [ "ᄀ̈", "\u{0600}" ]
        , test "310: ÷ [0.2] HANGUL CHOSEONG KIYEOK (L) × [9.1] DEVANAGARI SIGN VISARGA (SpacingMark) ÷ [0.3]" <|
            \_ ->
                "ᄀः"
                    |> Grapheme.toList
                    |> Expect.equal [ "ᄀः" ]
        , test "311: ÷ [0.2] HANGUL CHOSEONG KIYEOK (L) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.1] DEVANAGARI SIGN VISARGA (SpacingMark) ÷ [0.3]" <|
            \_ ->
                "ᄀ̈ः"
                    |> Grapheme.toList
                    |> Expect.equal [ "ᄀ̈ः" ]
        , test "312: ÷ [0.2] HANGUL CHOSEONG KIYEOK (L) × [6.0] HANGUL CHOSEONG KIYEOK (L) ÷ [0.3]" <|
            \_ ->
                "ᄀᄀ"
                    |> Grapheme.toList
                    |> Expect.equal [ "ᄀᄀ" ]
        , test "313: ÷ [0.2] HANGUL CHOSEONG KIYEOK (L) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL CHOSEONG KIYEOK (L) ÷ [0.3]" <|
            \_ ->
                "ᄀ̈ᄀ"
                    |> Grapheme.toList
                    |> Expect.equal [ "ᄀ̈", "ᄀ" ]
        , test "314: ÷ [0.2] HANGUL CHOSEONG KIYEOK (L) × [6.0] HANGUL JUNGSEONG FILLER (V) ÷ [0.3]" <|
            \_ ->
                "ᄀᅠ"
                    |> Grapheme.toList
                    |> Expect.equal [ "ᄀᅠ" ]
        , test "315: ÷ [0.2] HANGUL CHOSEONG KIYEOK (L) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL JUNGSEONG FILLER (V) ÷ [0.3]" <|
            \_ ->
                "ᄀ̈ᅠ"
                    |> Grapheme.toList
                    |> Expect.equal [ "ᄀ̈", "ᅠ" ]
        , test "316: ÷ [0.2] HANGUL CHOSEONG KIYEOK (L) ÷ [999.0] HANGUL JONGSEONG KIYEOK (T) ÷ [0.3]" <|
            \_ ->
                "ᄀᆨ"
                    |> Grapheme.toList
                    |> Expect.equal [ "ᄀ", "ᆨ" ]
        , test "317: ÷ [0.2] HANGUL CHOSEONG KIYEOK (L) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL JONGSEONG KIYEOK (T) ÷ [0.3]" <|
            \_ ->
                "ᄀ̈ᆨ"
                    |> Grapheme.toList
                    |> Expect.equal [ "ᄀ̈", "ᆨ" ]
        , test "318: ÷ [0.2] HANGUL CHOSEONG KIYEOK (L) × [6.0] HANGUL SYLLABLE GA (LV) ÷ [0.3]" <|
            \_ ->
                "ᄀ가"
                    |> Grapheme.toList
                    |> Expect.equal [ "ᄀ가" ]
        , test "319: ÷ [0.2] HANGUL CHOSEONG KIYEOK (L) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL SYLLABLE GA (LV) ÷ [0.3]" <|
            \_ ->
                "ᄀ̈가"
                    |> Grapheme.toList
                    |> Expect.equal [ "ᄀ̈", "가" ]
        , test "320: ÷ [0.2] HANGUL CHOSEONG KIYEOK (L) × [6.0] HANGUL SYLLABLE GAG (LVT) ÷ [0.3]" <|
            \_ ->
                "ᄀ각"
                    |> Grapheme.toList
                    |> Expect.equal [ "ᄀ각" ]
        , test "321: ÷ [0.2] HANGUL CHOSEONG KIYEOK (L) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL SYLLABLE GAG (LVT) ÷ [0.3]" <|
            \_ ->
                "ᄀ̈각"
                    |> Grapheme.toList
                    |> Expect.equal [ "ᄀ̈", "각" ]
        , test "322: ÷ [0.2] HANGUL CHOSEONG KIYEOK (L) ÷ [999.0] WATCH (ExtPict) ÷ [0.3]" <|
            \_ ->
                "ᄀ⌚"
                    |> Grapheme.toList
                    |> Expect.equal [ "ᄀ", "⌚" ]
        , test "323: ÷ [0.2] HANGUL CHOSEONG KIYEOK (L) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] WATCH (ExtPict) ÷ [0.3]" <|
            \_ ->
                "ᄀ̈⌚"
                    |> Grapheme.toList
                    |> Expect.equal [ "ᄀ̈", "⌚" ]
        , test "324: ÷ [0.2] HANGUL CHOSEONG KIYEOK (L) × [9.0] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) ÷ [0.3]" <|
            \_ ->
                "ᄀ̀"
                    |> Grapheme.toList
                    |> Expect.equal [ "ᄀ̀" ]
        , test "325: ÷ [0.2] HANGUL CHOSEONG KIYEOK (L) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) ÷ [0.3]" <|
            \_ ->
                "ᄀ̈̀"
                    |> Grapheme.toList
                    |> Expect.equal [ "ᄀ̈̀" ]
        , test "326: ÷ [0.2] HANGUL CHOSEONG KIYEOK (L) × [9.0] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) ÷ [0.3]" <|
            \_ ->
                "ᄀ\u{200D}"
                    |> Grapheme.toList
                    |> Expect.equal [ "ᄀ\u{200D}" ]
        , test "327: ÷ [0.2] HANGUL CHOSEONG KIYEOK (L) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) ÷ [0.3]" <|
            \_ ->
                "ᄀ̈\u{200D}"
                    |> Grapheme.toList
                    |> Expect.equal [ "ᄀ̈\u{200D}" ]
        , test "328: ÷ [0.2] HANGUL CHOSEONG KIYEOK (L) ÷ [999.0] <reserved-0378> (Other) ÷ [0.3]" <|
            \_ ->
                "ᄀ\u{0378}"
                    |> Grapheme.toList
                    |> Expect.equal [ "ᄀ", "\u{0378}" ]
        , test "329: ÷ [0.2] HANGUL CHOSEONG KIYEOK (L) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] <reserved-0378> (Other) ÷ [0.3]" <|
            \_ ->
                "ᄀ̈\u{0378}"
                    |> Grapheme.toList
                    |> Expect.equal [ "ᄀ̈", "\u{0378}" ]
        , test "330: ÷ [0.2] HANGUL JUNGSEONG FILLER (V) ÷ [999.0] SPACE (Other) ÷ [0.3]" <|
            \_ ->
                "ᅠ "
                    |> Grapheme.toList
                    |> Expect.equal [ "ᅠ", " " ]
        , test "331: ÷ [0.2] HANGUL JUNGSEONG FILLER (V) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] SPACE (Other) ÷ [0.3]" <|
            \_ ->
                "ᅠ̈ "
                    |> Grapheme.toList
                    |> Expect.equal [ "ᅠ̈", " " ]
        , test "332: ÷ [0.2] HANGUL JUNGSEONG FILLER (V) ÷ [5.0] <CARRIAGE RETURN (CR)> (CR) ÷ [0.3]" <|
            \_ ->
                "ᅠ\u{000D}"
                    |> Grapheme.toList
                    |> Expect.equal [ "ᅠ", "\u{000D}" ]
        , test "333: ÷ [0.2] HANGUL JUNGSEONG FILLER (V) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [5.0] <CARRIAGE RETURN (CR)> (CR) ÷ [0.3]" <|
            \_ ->
                "ᅠ̈\u{000D}"
                    |> Grapheme.toList
                    |> Expect.equal [ "ᅠ̈", "\u{000D}" ]
        , test "334: ÷ [0.2] HANGUL JUNGSEONG FILLER (V) ÷ [5.0] <LINE FEED (LF)> (LF) ÷ [0.3]" <|
            \_ ->
                "ᅠ\n"
                    |> Grapheme.toList
                    |> Expect.equal [ "ᅠ", "\n" ]
        , test "335: ÷ [0.2] HANGUL JUNGSEONG FILLER (V) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [5.0] <LINE FEED (LF)> (LF) ÷ [0.3]" <|
            \_ ->
                "ᅠ̈\n"
                    |> Grapheme.toList
                    |> Expect.equal [ "ᅠ̈", "\n" ]
        , test "336: ÷ [0.2] HANGUL JUNGSEONG FILLER (V) ÷ [5.0] <START OF HEADING> (Control) ÷ [0.3]" <|
            \_ ->
                "ᅠ\u{0001}"
                    |> Grapheme.toList
                    |> Expect.equal [ "ᅠ", "\u{0001}" ]
        , test "337: ÷ [0.2] HANGUL JUNGSEONG FILLER (V) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [5.0] <START OF HEADING> (Control) ÷ [0.3]" <|
            \_ ->
                "ᅠ̈\u{0001}"
                    |> Grapheme.toList
                    |> Expect.equal [ "ᅠ̈", "\u{0001}" ]
        , test "338: ÷ [0.2] HANGUL JUNGSEONG FILLER (V) × [9.0] COMBINING GRAPHEME JOINER (Extend) ÷ [0.3]" <|
            \_ ->
                "ᅠ͏"
                    |> Grapheme.toList
                    |> Expect.equal [ "ᅠ͏" ]
        , test "339: ÷ [0.2] HANGUL JUNGSEONG FILLER (V) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] COMBINING GRAPHEME JOINER (Extend) ÷ [0.3]" <|
            \_ ->
                "ᅠ̈͏"
                    |> Grapheme.toList
                    |> Expect.equal [ "ᅠ̈͏" ]
        , test "340: ÷ [0.2] HANGUL JUNGSEONG FILLER (V) ÷ [999.0] REGIONAL INDICATOR SYMBOL LETTER A (RI) ÷ [0.3]" <|
            \_ ->
                "ᅠ🇦"
                    |> Grapheme.toList
                    |> Expect.equal [ "ᅠ", "🇦" ]
        , test "341: ÷ [0.2] HANGUL JUNGSEONG FILLER (V) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] REGIONAL INDICATOR SYMBOL LETTER A (RI) ÷ [0.3]" <|
            \_ ->
                "ᅠ̈🇦"
                    |> Grapheme.toList
                    |> Expect.equal [ "ᅠ̈", "🇦" ]
        , test "342: ÷ [0.2] HANGUL JUNGSEONG FILLER (V) ÷ [999.0] ARABIC NUMBER SIGN (Prepend) ÷ [0.3]" <|
            \_ ->
                "ᅠ\u{0600}"
                    |> Grapheme.toList
                    |> Expect.equal [ "ᅠ", "\u{0600}" ]
        , test "343: ÷ [0.2] HANGUL JUNGSEONG FILLER (V) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] ARABIC NUMBER SIGN (Prepend) ÷ [0.3]" <|
            \_ ->
                "ᅠ̈\u{0600}"
                    |> Grapheme.toList
                    |> Expect.equal [ "ᅠ̈", "\u{0600}" ]
        , test "344: ÷ [0.2] HANGUL JUNGSEONG FILLER (V) × [9.1] DEVANAGARI SIGN VISARGA (SpacingMark) ÷ [0.3]" <|
            \_ ->
                "ᅠः"
                    |> Grapheme.toList
                    |> Expect.equal [ "ᅠः" ]
        , test "345: ÷ [0.2] HANGUL JUNGSEONG FILLER (V) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.1] DEVANAGARI SIGN VISARGA (SpacingMark) ÷ [0.3]" <|
            \_ ->
                "ᅠ̈ः"
                    |> Grapheme.toList
                    |> Expect.equal [ "ᅠ̈ः" ]
        , test "346: ÷ [0.2] HANGUL JUNGSEONG FILLER (V) ÷ [999.0] HANGUL CHOSEONG KIYEOK (L) ÷ [0.3]" <|
            \_ ->
                "ᅠᄀ"
                    |> Grapheme.toList
                    |> Expect.equal [ "ᅠ", "ᄀ" ]
        , test "347: ÷ [0.2] HANGUL JUNGSEONG FILLER (V) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL CHOSEONG KIYEOK (L) ÷ [0.3]" <|
            \_ ->
                "ᅠ̈ᄀ"
                    |> Grapheme.toList
                    |> Expect.equal [ "ᅠ̈", "ᄀ" ]
        , test "348: ÷ [0.2] HANGUL JUNGSEONG FILLER (V) × [7.0] HANGUL JUNGSEONG FILLER (V) ÷ [0.3]" <|
            \_ ->
                "ᅠᅠ"
                    |> Grapheme.toList
                    |> Expect.equal [ "ᅠᅠ" ]
        , test "349: ÷ [0.2] HANGUL JUNGSEONG FILLER (V) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL JUNGSEONG FILLER (V) ÷ [0.3]" <|
            \_ ->
                "ᅠ̈ᅠ"
                    |> Grapheme.toList
                    |> Expect.equal [ "ᅠ̈", "ᅠ" ]
        , test "350: ÷ [0.2] HANGUL JUNGSEONG FILLER (V) × [7.0] HANGUL JONGSEONG KIYEOK (T) ÷ [0.3]" <|
            \_ ->
                "ᅠᆨ"
                    |> Grapheme.toList
                    |> Expect.equal [ "ᅠᆨ" ]
        , test "351: ÷ [0.2] HANGUL JUNGSEONG FILLER (V) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL JONGSEONG KIYEOK (T) ÷ [0.3]" <|
            \_ ->
                "ᅠ̈ᆨ"
                    |> Grapheme.toList
                    |> Expect.equal [ "ᅠ̈", "ᆨ" ]
        , test "352: ÷ [0.2] HANGUL JUNGSEONG FILLER (V) ÷ [999.0] HANGUL SYLLABLE GA (LV) ÷ [0.3]" <|
            \_ ->
                "ᅠ가"
                    |> Grapheme.toList
                    |> Expect.equal [ "ᅠ", "가" ]
        , test "353: ÷ [0.2] HANGUL JUNGSEONG FILLER (V) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL SYLLABLE GA (LV) ÷ [0.3]" <|
            \_ ->
                "ᅠ̈가"
                    |> Grapheme.toList
                    |> Expect.equal [ "ᅠ̈", "가" ]
        , test "354: ÷ [0.2] HANGUL JUNGSEONG FILLER (V) ÷ [999.0] HANGUL SYLLABLE GAG (LVT) ÷ [0.3]" <|
            \_ ->
                "ᅠ각"
                    |> Grapheme.toList
                    |> Expect.equal [ "ᅠ", "각" ]
        , test "355: ÷ [0.2] HANGUL JUNGSEONG FILLER (V) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL SYLLABLE GAG (LVT) ÷ [0.3]" <|
            \_ ->
                "ᅠ̈각"
                    |> Grapheme.toList
                    |> Expect.equal [ "ᅠ̈", "각" ]
        , test "356: ÷ [0.2] HANGUL JUNGSEONG FILLER (V) ÷ [999.0] WATCH (ExtPict) ÷ [0.3]" <|
            \_ ->
                "ᅠ⌚"
                    |> Grapheme.toList
                    |> Expect.equal [ "ᅠ", "⌚" ]
        , test "357: ÷ [0.2] HANGUL JUNGSEONG FILLER (V) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] WATCH (ExtPict) ÷ [0.3]" <|
            \_ ->
                "ᅠ̈⌚"
                    |> Grapheme.toList
                    |> Expect.equal [ "ᅠ̈", "⌚" ]
        , test "358: ÷ [0.2] HANGUL JUNGSEONG FILLER (V) × [9.0] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) ÷ [0.3]" <|
            \_ ->
                "ᅠ̀"
                    |> Grapheme.toList
                    |> Expect.equal [ "ᅠ̀" ]
        , test "359: ÷ [0.2] HANGUL JUNGSEONG FILLER (V) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) ÷ [0.3]" <|
            \_ ->
                "ᅠ̈̀"
                    |> Grapheme.toList
                    |> Expect.equal [ "ᅠ̈̀" ]
        , test "360: ÷ [0.2] HANGUL JUNGSEONG FILLER (V) × [9.0] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) ÷ [0.3]" <|
            \_ ->
                "ᅠ\u{200D}"
                    |> Grapheme.toList
                    |> Expect.equal [ "ᅠ\u{200D}" ]
        , test "361: ÷ [0.2] HANGUL JUNGSEONG FILLER (V) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) ÷ [0.3]" <|
            \_ ->
                "ᅠ̈\u{200D}"
                    |> Grapheme.toList
                    |> Expect.equal [ "ᅠ̈\u{200D}" ]
        , test "362: ÷ [0.2] HANGUL JUNGSEONG FILLER (V) ÷ [999.0] <reserved-0378> (Other) ÷ [0.3]" <|
            \_ ->
                "ᅠ\u{0378}"
                    |> Grapheme.toList
                    |> Expect.equal [ "ᅠ", "\u{0378}" ]
        , test "363: ÷ [0.2] HANGUL JUNGSEONG FILLER (V) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] <reserved-0378> (Other) ÷ [0.3]" <|
            \_ ->
                "ᅠ̈\u{0378}"
                    |> Grapheme.toList
                    |> Expect.equal [ "ᅠ̈", "\u{0378}" ]
        , test "364: ÷ [0.2] HANGUL JONGSEONG KIYEOK (T) ÷ [999.0] SPACE (Other) ÷ [0.3]" <|
            \_ ->
                "ᆨ "
                    |> Grapheme.toList
                    |> Expect.equal [ "ᆨ", " " ]
        , test "365: ÷ [0.2] HANGUL JONGSEONG KIYEOK (T) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] SPACE (Other) ÷ [0.3]" <|
            \_ ->
                "ᆨ̈ "
                    |> Grapheme.toList
                    |> Expect.equal [ "ᆨ̈", " " ]
        , test "366: ÷ [0.2] HANGUL JONGSEONG KIYEOK (T) ÷ [5.0] <CARRIAGE RETURN (CR)> (CR) ÷ [0.3]" <|
            \_ ->
                "ᆨ\u{000D}"
                    |> Grapheme.toList
                    |> Expect.equal [ "ᆨ", "\u{000D}" ]
        , test "367: ÷ [0.2] HANGUL JONGSEONG KIYEOK (T) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [5.0] <CARRIAGE RETURN (CR)> (CR) ÷ [0.3]" <|
            \_ ->
                "ᆨ̈\u{000D}"
                    |> Grapheme.toList
                    |> Expect.equal [ "ᆨ̈", "\u{000D}" ]
        , test "368: ÷ [0.2] HANGUL JONGSEONG KIYEOK (T) ÷ [5.0] <LINE FEED (LF)> (LF) ÷ [0.3]" <|
            \_ ->
                "ᆨ\n"
                    |> Grapheme.toList
                    |> Expect.equal [ "ᆨ", "\n" ]
        , test "369: ÷ [0.2] HANGUL JONGSEONG KIYEOK (T) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [5.0] <LINE FEED (LF)> (LF) ÷ [0.3]" <|
            \_ ->
                "ᆨ̈\n"
                    |> Grapheme.toList
                    |> Expect.equal [ "ᆨ̈", "\n" ]
        , test "370: ÷ [0.2] HANGUL JONGSEONG KIYEOK (T) ÷ [5.0] <START OF HEADING> (Control) ÷ [0.3]" <|
            \_ ->
                "ᆨ\u{0001}"
                    |> Grapheme.toList
                    |> Expect.equal [ "ᆨ", "\u{0001}" ]
        , test "371: ÷ [0.2] HANGUL JONGSEONG KIYEOK (T) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [5.0] <START OF HEADING> (Control) ÷ [0.3]" <|
            \_ ->
                "ᆨ̈\u{0001}"
                    |> Grapheme.toList
                    |> Expect.equal [ "ᆨ̈", "\u{0001}" ]
        , test "372: ÷ [0.2] HANGUL JONGSEONG KIYEOK (T) × [9.0] COMBINING GRAPHEME JOINER (Extend) ÷ [0.3]" <|
            \_ ->
                "ᆨ͏"
                    |> Grapheme.toList
                    |> Expect.equal [ "ᆨ͏" ]
        , test "373: ÷ [0.2] HANGUL JONGSEONG KIYEOK (T) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] COMBINING GRAPHEME JOINER (Extend) ÷ [0.3]" <|
            \_ ->
                "ᆨ̈͏"
                    |> Grapheme.toList
                    |> Expect.equal [ "ᆨ̈͏" ]
        , test "374: ÷ [0.2] HANGUL JONGSEONG KIYEOK (T) ÷ [999.0] REGIONAL INDICATOR SYMBOL LETTER A (RI) ÷ [0.3]" <|
            \_ ->
                "ᆨ🇦"
                    |> Grapheme.toList
                    |> Expect.equal [ "ᆨ", "🇦" ]
        , test "375: ÷ [0.2] HANGUL JONGSEONG KIYEOK (T) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] REGIONAL INDICATOR SYMBOL LETTER A (RI) ÷ [0.3]" <|
            \_ ->
                "ᆨ̈🇦"
                    |> Grapheme.toList
                    |> Expect.equal [ "ᆨ̈", "🇦" ]
        , test "376: ÷ [0.2] HANGUL JONGSEONG KIYEOK (T) ÷ [999.0] ARABIC NUMBER SIGN (Prepend) ÷ [0.3]" <|
            \_ ->
                "ᆨ\u{0600}"
                    |> Grapheme.toList
                    |> Expect.equal [ "ᆨ", "\u{0600}" ]
        , test "377: ÷ [0.2] HANGUL JONGSEONG KIYEOK (T) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] ARABIC NUMBER SIGN (Prepend) ÷ [0.3]" <|
            \_ ->
                "ᆨ̈\u{0600}"
                    |> Grapheme.toList
                    |> Expect.equal [ "ᆨ̈", "\u{0600}" ]
        , test "378: ÷ [0.2] HANGUL JONGSEONG KIYEOK (T) × [9.1] DEVANAGARI SIGN VISARGA (SpacingMark) ÷ [0.3]" <|
            \_ ->
                "ᆨः"
                    |> Grapheme.toList
                    |> Expect.equal [ "ᆨः" ]
        , test "379: ÷ [0.2] HANGUL JONGSEONG KIYEOK (T) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.1] DEVANAGARI SIGN VISARGA (SpacingMark) ÷ [0.3]" <|
            \_ ->
                "ᆨ̈ः"
                    |> Grapheme.toList
                    |> Expect.equal [ "ᆨ̈ः" ]
        , test "380: ÷ [0.2] HANGUL JONGSEONG KIYEOK (T) ÷ [999.0] HANGUL CHOSEONG KIYEOK (L) ÷ [0.3]" <|
            \_ ->
                "ᆨᄀ"
                    |> Grapheme.toList
                    |> Expect.equal [ "ᆨ", "ᄀ" ]
        , test "381: ÷ [0.2] HANGUL JONGSEONG KIYEOK (T) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL CHOSEONG KIYEOK (L) ÷ [0.3]" <|
            \_ ->
                "ᆨ̈ᄀ"
                    |> Grapheme.toList
                    |> Expect.equal [ "ᆨ̈", "ᄀ" ]
        , test "382: ÷ [0.2] HANGUL JONGSEONG KIYEOK (T) ÷ [999.0] HANGUL JUNGSEONG FILLER (V) ÷ [0.3]" <|
            \_ ->
                "ᆨᅠ"
                    |> Grapheme.toList
                    |> Expect.equal [ "ᆨ", "ᅠ" ]
        , test "383: ÷ [0.2] HANGUL JONGSEONG KIYEOK (T) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL JUNGSEONG FILLER (V) ÷ [0.3]" <|
            \_ ->
                "ᆨ̈ᅠ"
                    |> Grapheme.toList
                    |> Expect.equal [ "ᆨ̈", "ᅠ" ]
        , test "384: ÷ [0.2] HANGUL JONGSEONG KIYEOK (T) × [8.0] HANGUL JONGSEONG KIYEOK (T) ÷ [0.3]" <|
            \_ ->
                "ᆨᆨ"
                    |> Grapheme.toList
                    |> Expect.equal [ "ᆨᆨ" ]
        , test "385: ÷ [0.2] HANGUL JONGSEONG KIYEOK (T) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL JONGSEONG KIYEOK (T) ÷ [0.3]" <|
            \_ ->
                "ᆨ̈ᆨ"
                    |> Grapheme.toList
                    |> Expect.equal [ "ᆨ̈", "ᆨ" ]
        , test "386: ÷ [0.2] HANGUL JONGSEONG KIYEOK (T) ÷ [999.0] HANGUL SYLLABLE GA (LV) ÷ [0.3]" <|
            \_ ->
                "ᆨ가"
                    |> Grapheme.toList
                    |> Expect.equal [ "ᆨ", "가" ]
        , test "387: ÷ [0.2] HANGUL JONGSEONG KIYEOK (T) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL SYLLABLE GA (LV) ÷ [0.3]" <|
            \_ ->
                "ᆨ̈가"
                    |> Grapheme.toList
                    |> Expect.equal [ "ᆨ̈", "가" ]
        , test "388: ÷ [0.2] HANGUL JONGSEONG KIYEOK (T) ÷ [999.0] HANGUL SYLLABLE GAG (LVT) ÷ [0.3]" <|
            \_ ->
                "ᆨ각"
                    |> Grapheme.toList
                    |> Expect.equal [ "ᆨ", "각" ]
        , test "389: ÷ [0.2] HANGUL JONGSEONG KIYEOK (T) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL SYLLABLE GAG (LVT) ÷ [0.3]" <|
            \_ ->
                "ᆨ̈각"
                    |> Grapheme.toList
                    |> Expect.equal [ "ᆨ̈", "각" ]
        , test "390: ÷ [0.2] HANGUL JONGSEONG KIYEOK (T) ÷ [999.0] WATCH (ExtPict) ÷ [0.3]" <|
            \_ ->
                "ᆨ⌚"
                    |> Grapheme.toList
                    |> Expect.equal [ "ᆨ", "⌚" ]
        , test "391: ÷ [0.2] HANGUL JONGSEONG KIYEOK (T) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] WATCH (ExtPict) ÷ [0.3]" <|
            \_ ->
                "ᆨ̈⌚"
                    |> Grapheme.toList
                    |> Expect.equal [ "ᆨ̈", "⌚" ]
        , test "392: ÷ [0.2] HANGUL JONGSEONG KIYEOK (T) × [9.0] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) ÷ [0.3]" <|
            \_ ->
                "ᆨ̀"
                    |> Grapheme.toList
                    |> Expect.equal [ "ᆨ̀" ]
        , test "393: ÷ [0.2] HANGUL JONGSEONG KIYEOK (T) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) ÷ [0.3]" <|
            \_ ->
                "ᆨ̈̀"
                    |> Grapheme.toList
                    |> Expect.equal [ "ᆨ̈̀" ]
        , test "394: ÷ [0.2] HANGUL JONGSEONG KIYEOK (T) × [9.0] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) ÷ [0.3]" <|
            \_ ->
                "ᆨ\u{200D}"
                    |> Grapheme.toList
                    |> Expect.equal [ "ᆨ\u{200D}" ]
        , test "395: ÷ [0.2] HANGUL JONGSEONG KIYEOK (T) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) ÷ [0.3]" <|
            \_ ->
                "ᆨ̈\u{200D}"
                    |> Grapheme.toList
                    |> Expect.equal [ "ᆨ̈\u{200D}" ]
        , test "396: ÷ [0.2] HANGUL JONGSEONG KIYEOK (T) ÷ [999.0] <reserved-0378> (Other) ÷ [0.3]" <|
            \_ ->
                "ᆨ\u{0378}"
                    |> Grapheme.toList
                    |> Expect.equal [ "ᆨ", "\u{0378}" ]
        , test "397: ÷ [0.2] HANGUL JONGSEONG KIYEOK (T) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] <reserved-0378> (Other) ÷ [0.3]" <|
            \_ ->
                "ᆨ̈\u{0378}"
                    |> Grapheme.toList
                    |> Expect.equal [ "ᆨ̈", "\u{0378}" ]
        , test "398: ÷ [0.2] HANGUL SYLLABLE GA (LV) ÷ [999.0] SPACE (Other) ÷ [0.3]" <|
            \_ ->
                "가 "
                    |> Grapheme.toList
                    |> Expect.equal [ "가", " " ]
        , test "399: ÷ [0.2] HANGUL SYLLABLE GA (LV) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] SPACE (Other) ÷ [0.3]" <|
            \_ ->
                "가̈ "
                    |> Grapheme.toList
                    |> Expect.equal [ "가̈", " " ]
        , test "400: ÷ [0.2] HANGUL SYLLABLE GA (LV) ÷ [5.0] <CARRIAGE RETURN (CR)> (CR) ÷ [0.3]" <|
            \_ ->
                "가\u{000D}"
                    |> Grapheme.toList
                    |> Expect.equal [ "가", "\u{000D}" ]
        , test "401: ÷ [0.2] HANGUL SYLLABLE GA (LV) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [5.0] <CARRIAGE RETURN (CR)> (CR) ÷ [0.3]" <|
            \_ ->
                "가̈\u{000D}"
                    |> Grapheme.toList
                    |> Expect.equal [ "가̈", "\u{000D}" ]
        , test "402: ÷ [0.2] HANGUL SYLLABLE GA (LV) ÷ [5.0] <LINE FEED (LF)> (LF) ÷ [0.3]" <|
            \_ ->
                "가\n"
                    |> Grapheme.toList
                    |> Expect.equal [ "가", "\n" ]
        , test "403: ÷ [0.2] HANGUL SYLLABLE GA (LV) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [5.0] <LINE FEED (LF)> (LF) ÷ [0.3]" <|
            \_ ->
                "가̈\n"
                    |> Grapheme.toList
                    |> Expect.equal [ "가̈", "\n" ]
        , test "404: ÷ [0.2] HANGUL SYLLABLE GA (LV) ÷ [5.0] <START OF HEADING> (Control) ÷ [0.3]" <|
            \_ ->
                "가\u{0001}"
                    |> Grapheme.toList
                    |> Expect.equal [ "가", "\u{0001}" ]
        , test "405: ÷ [0.2] HANGUL SYLLABLE GA (LV) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [5.0] <START OF HEADING> (Control) ÷ [0.3]" <|
            \_ ->
                "가̈\u{0001}"
                    |> Grapheme.toList
                    |> Expect.equal [ "가̈", "\u{0001}" ]
        , test "406: ÷ [0.2] HANGUL SYLLABLE GA (LV) × [9.0] COMBINING GRAPHEME JOINER (Extend) ÷ [0.3]" <|
            \_ ->
                "가͏"
                    |> Grapheme.toList
                    |> Expect.equal [ "가͏" ]
        , test "407: ÷ [0.2] HANGUL SYLLABLE GA (LV) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] COMBINING GRAPHEME JOINER (Extend) ÷ [0.3]" <|
            \_ ->
                "가̈͏"
                    |> Grapheme.toList
                    |> Expect.equal [ "가̈͏" ]
        , test "408: ÷ [0.2] HANGUL SYLLABLE GA (LV) ÷ [999.0] REGIONAL INDICATOR SYMBOL LETTER A (RI) ÷ [0.3]" <|
            \_ ->
                "가🇦"
                    |> Grapheme.toList
                    |> Expect.equal [ "가", "🇦" ]
        , test "409: ÷ [0.2] HANGUL SYLLABLE GA (LV) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] REGIONAL INDICATOR SYMBOL LETTER A (RI) ÷ [0.3]" <|
            \_ ->
                "가̈🇦"
                    |> Grapheme.toList
                    |> Expect.equal [ "가̈", "🇦" ]
        , test "410: ÷ [0.2] HANGUL SYLLABLE GA (LV) ÷ [999.0] ARABIC NUMBER SIGN (Prepend) ÷ [0.3]" <|
            \_ ->
                "가\u{0600}"
                    |> Grapheme.toList
                    |> Expect.equal [ "가", "\u{0600}" ]
        , test "411: ÷ [0.2] HANGUL SYLLABLE GA (LV) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] ARABIC NUMBER SIGN (Prepend) ÷ [0.3]" <|
            \_ ->
                "가̈\u{0600}"
                    |> Grapheme.toList
                    |> Expect.equal [ "가̈", "\u{0600}" ]
        , test "412: ÷ [0.2] HANGUL SYLLABLE GA (LV) × [9.1] DEVANAGARI SIGN VISARGA (SpacingMark) ÷ [0.3]" <|
            \_ ->
                "가ः"
                    |> Grapheme.toList
                    |> Expect.equal [ "가ः" ]
        , test "413: ÷ [0.2] HANGUL SYLLABLE GA (LV) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.1] DEVANAGARI SIGN VISARGA (SpacingMark) ÷ [0.3]" <|
            \_ ->
                "가̈ः"
                    |> Grapheme.toList
                    |> Expect.equal [ "가̈ः" ]
        , test "414: ÷ [0.2] HANGUL SYLLABLE GA (LV) ÷ [999.0] HANGUL CHOSEONG KIYEOK (L) ÷ [0.3]" <|
            \_ ->
                "가ᄀ"
                    |> Grapheme.toList
                    |> Expect.equal [ "가", "ᄀ" ]
        , test "415: ÷ [0.2] HANGUL SYLLABLE GA (LV) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL CHOSEONG KIYEOK (L) ÷ [0.3]" <|
            \_ ->
                "가̈ᄀ"
                    |> Grapheme.toList
                    |> Expect.equal [ "가̈", "ᄀ" ]
        , test "416: ÷ [0.2] HANGUL SYLLABLE GA (LV) × [7.0] HANGUL JUNGSEONG FILLER (V) ÷ [0.3]" <|
            \_ ->
                "가ᅠ"
                    |> Grapheme.toList
                    |> Expect.equal [ "가ᅠ" ]
        , test "417: ÷ [0.2] HANGUL SYLLABLE GA (LV) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL JUNGSEONG FILLER (V) ÷ [0.3]" <|
            \_ ->
                "가̈ᅠ"
                    |> Grapheme.toList
                    |> Expect.equal [ "가̈", "ᅠ" ]
        , test "418: ÷ [0.2] HANGUL SYLLABLE GA (LV) × [7.0] HANGUL JONGSEONG KIYEOK (T) ÷ [0.3]" <|
            \_ ->
                "각"
                    |> Grapheme.toList
                    |> Expect.equal [ "각" ]
        , test "419: ÷ [0.2] HANGUL SYLLABLE GA (LV) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL JONGSEONG KIYEOK (T) ÷ [0.3]" <|
            \_ ->
                "가̈ᆨ"
                    |> Grapheme.toList
                    |> Expect.equal [ "가̈", "ᆨ" ]
        , test "420: ÷ [0.2] HANGUL SYLLABLE GA (LV) ÷ [999.0] HANGUL SYLLABLE GA (LV) ÷ [0.3]" <|
            \_ ->
                "가가"
                    |> Grapheme.toList
                    |> Expect.equal [ "가", "가" ]
        , test "421: ÷ [0.2] HANGUL SYLLABLE GA (LV) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL SYLLABLE GA (LV) ÷ [0.3]" <|
            \_ ->
                "가̈가"
                    |> Grapheme.toList
                    |> Expect.equal [ "가̈", "가" ]
        , test "422: ÷ [0.2] HANGUL SYLLABLE GA (LV) ÷ [999.0] HANGUL SYLLABLE GAG (LVT) ÷ [0.3]" <|
            \_ ->
                "가각"
                    |> Grapheme.toList
                    |> Expect.equal [ "가", "각" ]
        , test "423: ÷ [0.2] HANGUL SYLLABLE GA (LV) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL SYLLABLE GAG (LVT) ÷ [0.3]" <|
            \_ ->
                "가̈각"
                    |> Grapheme.toList
                    |> Expect.equal [ "가̈", "각" ]
        , test "424: ÷ [0.2] HANGUL SYLLABLE GA (LV) ÷ [999.0] WATCH (ExtPict) ÷ [0.3]" <|
            \_ ->
                "가⌚"
                    |> Grapheme.toList
                    |> Expect.equal [ "가", "⌚" ]
        , test "425: ÷ [0.2] HANGUL SYLLABLE GA (LV) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] WATCH (ExtPict) ÷ [0.3]" <|
            \_ ->
                "가̈⌚"
                    |> Grapheme.toList
                    |> Expect.equal [ "가̈", "⌚" ]
        , test "426: ÷ [0.2] HANGUL SYLLABLE GA (LV) × [9.0] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) ÷ [0.3]" <|
            \_ ->
                "가̀"
                    |> Grapheme.toList
                    |> Expect.equal [ "가̀" ]
        , test "427: ÷ [0.2] HANGUL SYLLABLE GA (LV) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) ÷ [0.3]" <|
            \_ ->
                "가̈̀"
                    |> Grapheme.toList
                    |> Expect.equal [ "가̈̀" ]
        , test "428: ÷ [0.2] HANGUL SYLLABLE GA (LV) × [9.0] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) ÷ [0.3]" <|
            \_ ->
                "가\u{200D}"
                    |> Grapheme.toList
                    |> Expect.equal [ "가\u{200D}" ]
        , test "429: ÷ [0.2] HANGUL SYLLABLE GA (LV) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) ÷ [0.3]" <|
            \_ ->
                "가̈\u{200D}"
                    |> Grapheme.toList
                    |> Expect.equal [ "가̈\u{200D}" ]
        , test "430: ÷ [0.2] HANGUL SYLLABLE GA (LV) ÷ [999.0] <reserved-0378> (Other) ÷ [0.3]" <|
            \_ ->
                "가\u{0378}"
                    |> Grapheme.toList
                    |> Expect.equal [ "가", "\u{0378}" ]
        , test "431: ÷ [0.2] HANGUL SYLLABLE GA (LV) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] <reserved-0378> (Other) ÷ [0.3]" <|
            \_ ->
                "가̈\u{0378}"
                    |> Grapheme.toList
                    |> Expect.equal [ "가̈", "\u{0378}" ]
        , test "432: ÷ [0.2] HANGUL SYLLABLE GAG (LVT) ÷ [999.0] SPACE (Other) ÷ [0.3]" <|
            \_ ->
                "각 "
                    |> Grapheme.toList
                    |> Expect.equal [ "각", " " ]
        , test "433: ÷ [0.2] HANGUL SYLLABLE GAG (LVT) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] SPACE (Other) ÷ [0.3]" <|
            \_ ->
                "각̈ "
                    |> Grapheme.toList
                    |> Expect.equal [ "각̈", " " ]
        , test "434: ÷ [0.2] HANGUL SYLLABLE GAG (LVT) ÷ [5.0] <CARRIAGE RETURN (CR)> (CR) ÷ [0.3]" <|
            \_ ->
                "각\u{000D}"
                    |> Grapheme.toList
                    |> Expect.equal [ "각", "\u{000D}" ]
        , test "435: ÷ [0.2] HANGUL SYLLABLE GAG (LVT) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [5.0] <CARRIAGE RETURN (CR)> (CR) ÷ [0.3]" <|
            \_ ->
                "각̈\u{000D}"
                    |> Grapheme.toList
                    |> Expect.equal [ "각̈", "\u{000D}" ]
        , test "436: ÷ [0.2] HANGUL SYLLABLE GAG (LVT) ÷ [5.0] <LINE FEED (LF)> (LF) ÷ [0.3]" <|
            \_ ->
                "각\n"
                    |> Grapheme.toList
                    |> Expect.equal [ "각", "\n" ]
        , test "437: ÷ [0.2] HANGUL SYLLABLE GAG (LVT) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [5.0] <LINE FEED (LF)> (LF) ÷ [0.3]" <|
            \_ ->
                "각̈\n"
                    |> Grapheme.toList
                    |> Expect.equal [ "각̈", "\n" ]
        , test "438: ÷ [0.2] HANGUL SYLLABLE GAG (LVT) ÷ [5.0] <START OF HEADING> (Control) ÷ [0.3]" <|
            \_ ->
                "각\u{0001}"
                    |> Grapheme.toList
                    |> Expect.equal [ "각", "\u{0001}" ]
        , test "439: ÷ [0.2] HANGUL SYLLABLE GAG (LVT) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [5.0] <START OF HEADING> (Control) ÷ [0.3]" <|
            \_ ->
                "각̈\u{0001}"
                    |> Grapheme.toList
                    |> Expect.equal [ "각̈", "\u{0001}" ]
        , test "440: ÷ [0.2] HANGUL SYLLABLE GAG (LVT) × [9.0] COMBINING GRAPHEME JOINER (Extend) ÷ [0.3]" <|
            \_ ->
                "각͏"
                    |> Grapheme.toList
                    |> Expect.equal [ "각͏" ]
        , test "441: ÷ [0.2] HANGUL SYLLABLE GAG (LVT) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] COMBINING GRAPHEME JOINER (Extend) ÷ [0.3]" <|
            \_ ->
                "각̈͏"
                    |> Grapheme.toList
                    |> Expect.equal [ "각̈͏" ]
        , test "442: ÷ [0.2] HANGUL SYLLABLE GAG (LVT) ÷ [999.0] REGIONAL INDICATOR SYMBOL LETTER A (RI) ÷ [0.3]" <|
            \_ ->
                "각🇦"
                    |> Grapheme.toList
                    |> Expect.equal [ "각", "🇦" ]
        , test "443: ÷ [0.2] HANGUL SYLLABLE GAG (LVT) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] REGIONAL INDICATOR SYMBOL LETTER A (RI) ÷ [0.3]" <|
            \_ ->
                "각̈🇦"
                    |> Grapheme.toList
                    |> Expect.equal [ "각̈", "🇦" ]
        , test "444: ÷ [0.2] HANGUL SYLLABLE GAG (LVT) ÷ [999.0] ARABIC NUMBER SIGN (Prepend) ÷ [0.3]" <|
            \_ ->
                "각\u{0600}"
                    |> Grapheme.toList
                    |> Expect.equal [ "각", "\u{0600}" ]
        , test "445: ÷ [0.2] HANGUL SYLLABLE GAG (LVT) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] ARABIC NUMBER SIGN (Prepend) ÷ [0.3]" <|
            \_ ->
                "각̈\u{0600}"
                    |> Grapheme.toList
                    |> Expect.equal [ "각̈", "\u{0600}" ]
        , test "446: ÷ [0.2] HANGUL SYLLABLE GAG (LVT) × [9.1] DEVANAGARI SIGN VISARGA (SpacingMark) ÷ [0.3]" <|
            \_ ->
                "각ः"
                    |> Grapheme.toList
                    |> Expect.equal [ "각ः" ]
        , test "447: ÷ [0.2] HANGUL SYLLABLE GAG (LVT) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.1] DEVANAGARI SIGN VISARGA (SpacingMark) ÷ [0.3]" <|
            \_ ->
                "각̈ः"
                    |> Grapheme.toList
                    |> Expect.equal [ "각̈ः" ]
        , test "448: ÷ [0.2] HANGUL SYLLABLE GAG (LVT) ÷ [999.0] HANGUL CHOSEONG KIYEOK (L) ÷ [0.3]" <|
            \_ ->
                "각ᄀ"
                    |> Grapheme.toList
                    |> Expect.equal [ "각", "ᄀ" ]
        , test "449: ÷ [0.2] HANGUL SYLLABLE GAG (LVT) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL CHOSEONG KIYEOK (L) ÷ [0.3]" <|
            \_ ->
                "각̈ᄀ"
                    |> Grapheme.toList
                    |> Expect.equal [ "각̈", "ᄀ" ]
        , test "450: ÷ [0.2] HANGUL SYLLABLE GAG (LVT) ÷ [999.0] HANGUL JUNGSEONG FILLER (V) ÷ [0.3]" <|
            \_ ->
                "각ᅠ"
                    |> Grapheme.toList
                    |> Expect.equal [ "각", "ᅠ" ]
        , test "451: ÷ [0.2] HANGUL SYLLABLE GAG (LVT) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL JUNGSEONG FILLER (V) ÷ [0.3]" <|
            \_ ->
                "각̈ᅠ"
                    |> Grapheme.toList
                    |> Expect.equal [ "각̈", "ᅠ" ]
        , test "452: ÷ [0.2] HANGUL SYLLABLE GAG (LVT) × [8.0] HANGUL JONGSEONG KIYEOK (T) ÷ [0.3]" <|
            \_ ->
                "각ᆨ"
                    |> Grapheme.toList
                    |> Expect.equal [ "각ᆨ" ]
        , test "453: ÷ [0.2] HANGUL SYLLABLE GAG (LVT) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL JONGSEONG KIYEOK (T) ÷ [0.3]" <|
            \_ ->
                "각̈ᆨ"
                    |> Grapheme.toList
                    |> Expect.equal [ "각̈", "ᆨ" ]
        , test "454: ÷ [0.2] HANGUL SYLLABLE GAG (LVT) ÷ [999.0] HANGUL SYLLABLE GA (LV) ÷ [0.3]" <|
            \_ ->
                "각가"
                    |> Grapheme.toList
                    |> Expect.equal [ "각", "가" ]
        , test "455: ÷ [0.2] HANGUL SYLLABLE GAG (LVT) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL SYLLABLE GA (LV) ÷ [0.3]" <|
            \_ ->
                "각̈가"
                    |> Grapheme.toList
                    |> Expect.equal [ "각̈", "가" ]
        , test "456: ÷ [0.2] HANGUL SYLLABLE GAG (LVT) ÷ [999.0] HANGUL SYLLABLE GAG (LVT) ÷ [0.3]" <|
            \_ ->
                "각각"
                    |> Grapheme.toList
                    |> Expect.equal [ "각", "각" ]
        , test "457: ÷ [0.2] HANGUL SYLLABLE GAG (LVT) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL SYLLABLE GAG (LVT) ÷ [0.3]" <|
            \_ ->
                "각̈각"
                    |> Grapheme.toList
                    |> Expect.equal [ "각̈", "각" ]
        , test "458: ÷ [0.2] HANGUL SYLLABLE GAG (LVT) ÷ [999.0] WATCH (ExtPict) ÷ [0.3]" <|
            \_ ->
                "각⌚"
                    |> Grapheme.toList
                    |> Expect.equal [ "각", "⌚" ]
        , test "459: ÷ [0.2] HANGUL SYLLABLE GAG (LVT) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] WATCH (ExtPict) ÷ [0.3]" <|
            \_ ->
                "각̈⌚"
                    |> Grapheme.toList
                    |> Expect.equal [ "각̈", "⌚" ]
        , test "460: ÷ [0.2] HANGUL SYLLABLE GAG (LVT) × [9.0] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) ÷ [0.3]" <|
            \_ ->
                "각̀"
                    |> Grapheme.toList
                    |> Expect.equal [ "각̀" ]
        , test "461: ÷ [0.2] HANGUL SYLLABLE GAG (LVT) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) ÷ [0.3]" <|
            \_ ->
                "각̈̀"
                    |> Grapheme.toList
                    |> Expect.equal [ "각̈̀" ]
        , test "462: ÷ [0.2] HANGUL SYLLABLE GAG (LVT) × [9.0] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) ÷ [0.3]" <|
            \_ ->
                "각\u{200D}"
                    |> Grapheme.toList
                    |> Expect.equal [ "각\u{200D}" ]
        , test "463: ÷ [0.2] HANGUL SYLLABLE GAG (LVT) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) ÷ [0.3]" <|
            \_ ->
                "각̈\u{200D}"
                    |> Grapheme.toList
                    |> Expect.equal [ "각̈\u{200D}" ]
        , test "464: ÷ [0.2] HANGUL SYLLABLE GAG (LVT) ÷ [999.0] <reserved-0378> (Other) ÷ [0.3]" <|
            \_ ->
                "각\u{0378}"
                    |> Grapheme.toList
                    |> Expect.equal [ "각", "\u{0378}" ]
        , test "465: ÷ [0.2] HANGUL SYLLABLE GAG (LVT) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] <reserved-0378> (Other) ÷ [0.3]" <|
            \_ ->
                "각̈\u{0378}"
                    |> Grapheme.toList
                    |> Expect.equal [ "각̈", "\u{0378}" ]
        , test "466: ÷ [0.2] WATCH (ExtPict) ÷ [999.0] SPACE (Other) ÷ [0.3]" <|
            \_ ->
                "⌚ "
                    |> Grapheme.toList
                    |> Expect.equal [ "⌚", " " ]
        , test "467: ÷ [0.2] WATCH (ExtPict) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] SPACE (Other) ÷ [0.3]" <|
            \_ ->
                "⌚̈ "
                    |> Grapheme.toList
                    |> Expect.equal [ "⌚̈", " " ]
        , test "468: ÷ [0.2] WATCH (ExtPict) ÷ [5.0] <CARRIAGE RETURN (CR)> (CR) ÷ [0.3]" <|
            \_ ->
                "⌚\u{000D}"
                    |> Grapheme.toList
                    |> Expect.equal [ "⌚", "\u{000D}" ]
        , test "469: ÷ [0.2] WATCH (ExtPict) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [5.0] <CARRIAGE RETURN (CR)> (CR) ÷ [0.3]" <|
            \_ ->
                "⌚̈\u{000D}"
                    |> Grapheme.toList
                    |> Expect.equal [ "⌚̈", "\u{000D}" ]
        , test "470: ÷ [0.2] WATCH (ExtPict) ÷ [5.0] <LINE FEED (LF)> (LF) ÷ [0.3]" <|
            \_ ->
                "⌚\n"
                    |> Grapheme.toList
                    |> Expect.equal [ "⌚", "\n" ]
        , test "471: ÷ [0.2] WATCH (ExtPict) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [5.0] <LINE FEED (LF)> (LF) ÷ [0.3]" <|
            \_ ->
                "⌚̈\n"
                    |> Grapheme.toList
                    |> Expect.equal [ "⌚̈", "\n" ]
        , test "472: ÷ [0.2] WATCH (ExtPict) ÷ [5.0] <START OF HEADING> (Control) ÷ [0.3]" <|
            \_ ->
                "⌚\u{0001}"
                    |> Grapheme.toList
                    |> Expect.equal [ "⌚", "\u{0001}" ]
        , test "473: ÷ [0.2] WATCH (ExtPict) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [5.0] <START OF HEADING> (Control) ÷ [0.3]" <|
            \_ ->
                "⌚̈\u{0001}"
                    |> Grapheme.toList
                    |> Expect.equal [ "⌚̈", "\u{0001}" ]
        , test "474: ÷ [0.2] WATCH (ExtPict) × [9.0] COMBINING GRAPHEME JOINER (Extend) ÷ [0.3]" <|
            \_ ->
                "⌚͏"
                    |> Grapheme.toList
                    |> Expect.equal [ "⌚͏" ]
        , test "475: ÷ [0.2] WATCH (ExtPict) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] COMBINING GRAPHEME JOINER (Extend) ÷ [0.3]" <|
            \_ ->
                "⌚̈͏"
                    |> Grapheme.toList
                    |> Expect.equal [ "⌚̈͏" ]
        , test "476: ÷ [0.2] WATCH (ExtPict) ÷ [999.0] REGIONAL INDICATOR SYMBOL LETTER A (RI) ÷ [0.3]" <|
            \_ ->
                "⌚🇦"
                    |> Grapheme.toList
                    |> Expect.equal [ "⌚", "🇦" ]
        , test "477: ÷ [0.2] WATCH (ExtPict) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] REGIONAL INDICATOR SYMBOL LETTER A (RI) ÷ [0.3]" <|
            \_ ->
                "⌚̈🇦"
                    |> Grapheme.toList
                    |> Expect.equal [ "⌚̈", "🇦" ]
        , test "478: ÷ [0.2] WATCH (ExtPict) ÷ [999.0] ARABIC NUMBER SIGN (Prepend) ÷ [0.3]" <|
            \_ ->
                "⌚\u{0600}"
                    |> Grapheme.toList
                    |> Expect.equal [ "⌚", "\u{0600}" ]
        , test "479: ÷ [0.2] WATCH (ExtPict) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] ARABIC NUMBER SIGN (Prepend) ÷ [0.3]" <|
            \_ ->
                "⌚̈\u{0600}"
                    |> Grapheme.toList
                    |> Expect.equal [ "⌚̈", "\u{0600}" ]
        , test "480: ÷ [0.2] WATCH (ExtPict) × [9.1] DEVANAGARI SIGN VISARGA (SpacingMark) ÷ [0.3]" <|
            \_ ->
                "⌚ः"
                    |> Grapheme.toList
                    |> Expect.equal [ "⌚ः" ]
        , test "481: ÷ [0.2] WATCH (ExtPict) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.1] DEVANAGARI SIGN VISARGA (SpacingMark) ÷ [0.3]" <|
            \_ ->
                "⌚̈ः"
                    |> Grapheme.toList
                    |> Expect.equal [ "⌚̈ः" ]
        , test "482: ÷ [0.2] WATCH (ExtPict) ÷ [999.0] HANGUL CHOSEONG KIYEOK (L) ÷ [0.3]" <|
            \_ ->
                "⌚ᄀ"
                    |> Grapheme.toList
                    |> Expect.equal [ "⌚", "ᄀ" ]
        , test "483: ÷ [0.2] WATCH (ExtPict) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL CHOSEONG KIYEOK (L) ÷ [0.3]" <|
            \_ ->
                "⌚̈ᄀ"
                    |> Grapheme.toList
                    |> Expect.equal [ "⌚̈", "ᄀ" ]
        , test "484: ÷ [0.2] WATCH (ExtPict) ÷ [999.0] HANGUL JUNGSEONG FILLER (V) ÷ [0.3]" <|
            \_ ->
                "⌚ᅠ"
                    |> Grapheme.toList
                    |> Expect.equal [ "⌚", "ᅠ" ]
        , test "485: ÷ [0.2] WATCH (ExtPict) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL JUNGSEONG FILLER (V) ÷ [0.3]" <|
            \_ ->
                "⌚̈ᅠ"
                    |> Grapheme.toList
                    |> Expect.equal [ "⌚̈", "ᅠ" ]
        , test "486: ÷ [0.2] WATCH (ExtPict) ÷ [999.0] HANGUL JONGSEONG KIYEOK (T) ÷ [0.3]" <|
            \_ ->
                "⌚ᆨ"
                    |> Grapheme.toList
                    |> Expect.equal [ "⌚", "ᆨ" ]
        , test "487: ÷ [0.2] WATCH (ExtPict) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL JONGSEONG KIYEOK (T) ÷ [0.3]" <|
            \_ ->
                "⌚̈ᆨ"
                    |> Grapheme.toList
                    |> Expect.equal [ "⌚̈", "ᆨ" ]
        , test "488: ÷ [0.2] WATCH (ExtPict) ÷ [999.0] HANGUL SYLLABLE GA (LV) ÷ [0.3]" <|
            \_ ->
                "⌚가"
                    |> Grapheme.toList
                    |> Expect.equal [ "⌚", "가" ]
        , test "489: ÷ [0.2] WATCH (ExtPict) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL SYLLABLE GA (LV) ÷ [0.3]" <|
            \_ ->
                "⌚̈가"
                    |> Grapheme.toList
                    |> Expect.equal [ "⌚̈", "가" ]
        , test "490: ÷ [0.2] WATCH (ExtPict) ÷ [999.0] HANGUL SYLLABLE GAG (LVT) ÷ [0.3]" <|
            \_ ->
                "⌚각"
                    |> Grapheme.toList
                    |> Expect.equal [ "⌚", "각" ]
        , test "491: ÷ [0.2] WATCH (ExtPict) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL SYLLABLE GAG (LVT) ÷ [0.3]" <|
            \_ ->
                "⌚̈각"
                    |> Grapheme.toList
                    |> Expect.equal [ "⌚̈", "각" ]
        , test "492: ÷ [0.2] WATCH (ExtPict) ÷ [999.0] WATCH (ExtPict) ÷ [0.3]" <|
            \_ ->
                "⌚⌚"
                    |> Grapheme.toList
                    |> Expect.equal [ "⌚", "⌚" ]
        , test "493: ÷ [0.2] WATCH (ExtPict) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] WATCH (ExtPict) ÷ [0.3]" <|
            \_ ->
                "⌚̈⌚"
                    |> Grapheme.toList
                    |> Expect.equal [ "⌚̈", "⌚" ]
        , test "494: ÷ [0.2] WATCH (ExtPict) × [9.0] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) ÷ [0.3]" <|
            \_ ->
                "⌚̀"
                    |> Grapheme.toList
                    |> Expect.equal [ "⌚̀" ]
        , test "495: ÷ [0.2] WATCH (ExtPict) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) ÷ [0.3]" <|
            \_ ->
                "⌚̈̀"
                    |> Grapheme.toList
                    |> Expect.equal [ "⌚̈̀" ]
        , test "496: ÷ [0.2] WATCH (ExtPict) × [9.0] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) ÷ [0.3]" <|
            \_ ->
                "⌚\u{200D}"
                    |> Grapheme.toList
                    |> Expect.equal [ "⌚\u{200D}" ]
        , test "497: ÷ [0.2] WATCH (ExtPict) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) ÷ [0.3]" <|
            \_ ->
                "⌚̈\u{200D}"
                    |> Grapheme.toList
                    |> Expect.equal [ "⌚̈\u{200D}" ]
        , test "498: ÷ [0.2] WATCH (ExtPict) ÷ [999.0] <reserved-0378> (Other) ÷ [0.3]" <|
            \_ ->
                "⌚\u{0378}"
                    |> Grapheme.toList
                    |> Expect.equal [ "⌚", "\u{0378}" ]
        , test "499: ÷ [0.2] WATCH (ExtPict) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] <reserved-0378> (Other) ÷ [0.3]" <|
            \_ ->
                "⌚̈\u{0378}"
                    |> Grapheme.toList
                    |> Expect.equal [ "⌚̈", "\u{0378}" ]
        , test "500: ÷ [0.2] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) ÷ [999.0] SPACE (Other) ÷ [0.3]" <|
            \_ ->
                "̀ "
                    |> Grapheme.toList
                    |> Expect.equal [ "̀", " " ]
        , test "501: ÷ [0.2] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] SPACE (Other) ÷ [0.3]" <|
            \_ ->
                "̀̈ "
                    |> Grapheme.toList
                    |> Expect.equal [ "̀̈", " " ]
        , test "502: ÷ [0.2] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) ÷ [5.0] <CARRIAGE RETURN (CR)> (CR) ÷ [0.3]" <|
            \_ ->
                "̀\u{000D}"
                    |> Grapheme.toList
                    |> Expect.equal [ "̀", "\u{000D}" ]
        , test "503: ÷ [0.2] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [5.0] <CARRIAGE RETURN (CR)> (CR) ÷ [0.3]" <|
            \_ ->
                "̀̈\u{000D}"
                    |> Grapheme.toList
                    |> Expect.equal [ "̀̈", "\u{000D}" ]
        , test "504: ÷ [0.2] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) ÷ [5.0] <LINE FEED (LF)> (LF) ÷ [0.3]" <|
            \_ ->
                "̀\n"
                    |> Grapheme.toList
                    |> Expect.equal [ "̀", "\n" ]
        , test "505: ÷ [0.2] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [5.0] <LINE FEED (LF)> (LF) ÷ [0.3]" <|
            \_ ->
                "̀̈\n"
                    |> Grapheme.toList
                    |> Expect.equal [ "̀̈", "\n" ]
        , test "506: ÷ [0.2] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) ÷ [5.0] <START OF HEADING> (Control) ÷ [0.3]" <|
            \_ ->
                "̀\u{0001}"
                    |> Grapheme.toList
                    |> Expect.equal [ "̀", "\u{0001}" ]
        , test "507: ÷ [0.2] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [5.0] <START OF HEADING> (Control) ÷ [0.3]" <|
            \_ ->
                "̀̈\u{0001}"
                    |> Grapheme.toList
                    |> Expect.equal [ "̀̈", "\u{0001}" ]
        , test "508: ÷ [0.2] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) × [9.0] COMBINING GRAPHEME JOINER (Extend) ÷ [0.3]" <|
            \_ ->
                "̀͏"
                    |> Grapheme.toList
                    |> Expect.equal [ "̀͏" ]
        , test "509: ÷ [0.2] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] COMBINING GRAPHEME JOINER (Extend) ÷ [0.3]" <|
            \_ ->
                "̀̈͏"
                    |> Grapheme.toList
                    |> Expect.equal [ "̀̈͏" ]
        , test "510: ÷ [0.2] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) ÷ [999.0] REGIONAL INDICATOR SYMBOL LETTER A (RI) ÷ [0.3]" <|
            \_ ->
                "̀🇦"
                    |> Grapheme.toList
                    |> Expect.equal [ "̀", "🇦" ]
        , test "511: ÷ [0.2] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] REGIONAL INDICATOR SYMBOL LETTER A (RI) ÷ [0.3]" <|
            \_ ->
                "̀̈🇦"
                    |> Grapheme.toList
                    |> Expect.equal [ "̀̈", "🇦" ]
        , test "512: ÷ [0.2] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) ÷ [999.0] ARABIC NUMBER SIGN (Prepend) ÷ [0.3]" <|
            \_ ->
                "̀\u{0600}"
                    |> Grapheme.toList
                    |> Expect.equal [ "̀", "\u{0600}" ]
        , test "513: ÷ [0.2] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] ARABIC NUMBER SIGN (Prepend) ÷ [0.3]" <|
            \_ ->
                "̀̈\u{0600}"
                    |> Grapheme.toList
                    |> Expect.equal [ "̀̈", "\u{0600}" ]
        , test "514: ÷ [0.2] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) × [9.1] DEVANAGARI SIGN VISARGA (SpacingMark) ÷ [0.3]" <|
            \_ ->
                "̀ः"
                    |> Grapheme.toList
                    |> Expect.equal [ "̀ः" ]
        , test "515: ÷ [0.2] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.1] DEVANAGARI SIGN VISARGA (SpacingMark) ÷ [0.3]" <|
            \_ ->
                "̀̈ः"
                    |> Grapheme.toList
                    |> Expect.equal [ "̀̈ः" ]
        , test "516: ÷ [0.2] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) ÷ [999.0] HANGUL CHOSEONG KIYEOK (L) ÷ [0.3]" <|
            \_ ->
                "̀ᄀ"
                    |> Grapheme.toList
                    |> Expect.equal [ "̀", "ᄀ" ]
        , test "517: ÷ [0.2] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL CHOSEONG KIYEOK (L) ÷ [0.3]" <|
            \_ ->
                "̀̈ᄀ"
                    |> Grapheme.toList
                    |> Expect.equal [ "̀̈", "ᄀ" ]
        , test "518: ÷ [0.2] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) ÷ [999.0] HANGUL JUNGSEONG FILLER (V) ÷ [0.3]" <|
            \_ ->
                "̀ᅠ"
                    |> Grapheme.toList
                    |> Expect.equal [ "̀", "ᅠ" ]
        , test "519: ÷ [0.2] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL JUNGSEONG FILLER (V) ÷ [0.3]" <|
            \_ ->
                "̀̈ᅠ"
                    |> Grapheme.toList
                    |> Expect.equal [ "̀̈", "ᅠ" ]
        , test "520: ÷ [0.2] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) ÷ [999.0] HANGUL JONGSEONG KIYEOK (T) ÷ [0.3]" <|
            \_ ->
                "̀ᆨ"
                    |> Grapheme.toList
                    |> Expect.equal [ "̀", "ᆨ" ]
        , test "521: ÷ [0.2] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL JONGSEONG KIYEOK (T) ÷ [0.3]" <|
            \_ ->
                "̀̈ᆨ"
                    |> Grapheme.toList
                    |> Expect.equal [ "̀̈", "ᆨ" ]
        , test "522: ÷ [0.2] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) ÷ [999.0] HANGUL SYLLABLE GA (LV) ÷ [0.3]" <|
            \_ ->
                "̀가"
                    |> Grapheme.toList
                    |> Expect.equal [ "̀", "가" ]
        , test "523: ÷ [0.2] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL SYLLABLE GA (LV) ÷ [0.3]" <|
            \_ ->
                "̀̈가"
                    |> Grapheme.toList
                    |> Expect.equal [ "̀̈", "가" ]
        , test "524: ÷ [0.2] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) ÷ [999.0] HANGUL SYLLABLE GAG (LVT) ÷ [0.3]" <|
            \_ ->
                "̀각"
                    |> Grapheme.toList
                    |> Expect.equal [ "̀", "각" ]
        , test "525: ÷ [0.2] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL SYLLABLE GAG (LVT) ÷ [0.3]" <|
            \_ ->
                "̀̈각"
                    |> Grapheme.toList
                    |> Expect.equal [ "̀̈", "각" ]
        , test "526: ÷ [0.2] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) ÷ [999.0] WATCH (ExtPict) ÷ [0.3]" <|
            \_ ->
                "̀⌚"
                    |> Grapheme.toList
                    |> Expect.equal [ "̀", "⌚" ]
        , test "527: ÷ [0.2] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] WATCH (ExtPict) ÷ [0.3]" <|
            \_ ->
                "̀̈⌚"
                    |> Grapheme.toList
                    |> Expect.equal [ "̀̈", "⌚" ]
        , test "528: ÷ [0.2] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) × [9.0] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) ÷ [0.3]" <|
            \_ ->
                "̀̀"
                    |> Grapheme.toList
                    |> Expect.equal [ "̀̀" ]
        , test "529: ÷ [0.2] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) ÷ [0.3]" <|
            \_ ->
                "̀̈̀"
                    |> Grapheme.toList
                    |> Expect.equal [ "̀̈̀" ]
        , test "530: ÷ [0.2] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) × [9.0] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) ÷ [0.3]" <|
            \_ ->
                "̀\u{200D}"
                    |> Grapheme.toList
                    |> Expect.equal [ "̀\u{200D}" ]
        , test "531: ÷ [0.2] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) ÷ [0.3]" <|
            \_ ->
                "̀̈\u{200D}"
                    |> Grapheme.toList
                    |> Expect.equal [ "̀̈\u{200D}" ]
        , test "532: ÷ [0.2] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) ÷ [999.0] <reserved-0378> (Other) ÷ [0.3]" <|
            \_ ->
                "̀\u{0378}"
                    |> Grapheme.toList
                    |> Expect.equal [ "̀", "\u{0378}" ]
        , test "533: ÷ [0.2] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] <reserved-0378> (Other) ÷ [0.3]" <|
            \_ ->
                "̀̈\u{0378}"
                    |> Grapheme.toList
                    |> Expect.equal [ "̀̈", "\u{0378}" ]
        , test "534: ÷ [0.2] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) ÷ [999.0] SPACE (Other) ÷ [0.3]" <|
            \_ ->
                "\u{200D} "
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{200D}", " " ]
        , test "535: ÷ [0.2] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] SPACE (Other) ÷ [0.3]" <|
            \_ ->
                "\u{200D}̈ "
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{200D}̈", " " ]
        , test "536: ÷ [0.2] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) ÷ [5.0] <CARRIAGE RETURN (CR)> (CR) ÷ [0.3]" <|
            \_ ->
                "\u{200D}\u{000D}"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{200D}", "\u{000D}" ]
        , test "537: ÷ [0.2] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [5.0] <CARRIAGE RETURN (CR)> (CR) ÷ [0.3]" <|
            \_ ->
                "\u{200D}̈\u{000D}"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{200D}̈", "\u{000D}" ]
        , test "538: ÷ [0.2] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) ÷ [5.0] <LINE FEED (LF)> (LF) ÷ [0.3]" <|
            \_ ->
                "\u{200D}\n"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{200D}", "\n" ]
        , test "539: ÷ [0.2] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [5.0] <LINE FEED (LF)> (LF) ÷ [0.3]" <|
            \_ ->
                "\u{200D}̈\n"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{200D}̈", "\n" ]
        , test "540: ÷ [0.2] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) ÷ [5.0] <START OF HEADING> (Control) ÷ [0.3]" <|
            \_ ->
                "\u{200D}\u{0001}"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{200D}", "\u{0001}" ]
        , test "541: ÷ [0.2] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [5.0] <START OF HEADING> (Control) ÷ [0.3]" <|
            \_ ->
                "\u{200D}̈\u{0001}"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{200D}̈", "\u{0001}" ]
        , test "542: ÷ [0.2] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) × [9.0] COMBINING GRAPHEME JOINER (Extend) ÷ [0.3]" <|
            \_ ->
                "\u{200D}͏"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{200D}͏" ]
        , test "543: ÷ [0.2] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] COMBINING GRAPHEME JOINER (Extend) ÷ [0.3]" <|
            \_ ->
                "\u{200D}̈͏"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{200D}̈͏" ]
        , test "544: ÷ [0.2] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) ÷ [999.0] REGIONAL INDICATOR SYMBOL LETTER A (RI) ÷ [0.3]" <|
            \_ ->
                "\u{200D}🇦"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{200D}", "🇦" ]
        , test "545: ÷ [0.2] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] REGIONAL INDICATOR SYMBOL LETTER A (RI) ÷ [0.3]" <|
            \_ ->
                "\u{200D}̈🇦"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{200D}̈", "🇦" ]
        , test "546: ÷ [0.2] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) ÷ [999.0] ARABIC NUMBER SIGN (Prepend) ÷ [0.3]" <|
            \_ ->
                "\u{200D}\u{0600}"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{200D}", "\u{0600}" ]
        , test "547: ÷ [0.2] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] ARABIC NUMBER SIGN (Prepend) ÷ [0.3]" <|
            \_ ->
                "\u{200D}̈\u{0600}"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{200D}̈", "\u{0600}" ]
        , test "548: ÷ [0.2] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) × [9.1] DEVANAGARI SIGN VISARGA (SpacingMark) ÷ [0.3]" <|
            \_ ->
                "\u{200D}ः"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{200D}ः" ]
        , test "549: ÷ [0.2] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.1] DEVANAGARI SIGN VISARGA (SpacingMark) ÷ [0.3]" <|
            \_ ->
                "\u{200D}̈ः"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{200D}̈ः" ]
        , test "550: ÷ [0.2] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) ÷ [999.0] HANGUL CHOSEONG KIYEOK (L) ÷ [0.3]" <|
            \_ ->
                "\u{200D}ᄀ"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{200D}", "ᄀ" ]
        , test "551: ÷ [0.2] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL CHOSEONG KIYEOK (L) ÷ [0.3]" <|
            \_ ->
                "\u{200D}̈ᄀ"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{200D}̈", "ᄀ" ]
        , test "552: ÷ [0.2] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) ÷ [999.0] HANGUL JUNGSEONG FILLER (V) ÷ [0.3]" <|
            \_ ->
                "\u{200D}ᅠ"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{200D}", "ᅠ" ]
        , test "553: ÷ [0.2] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL JUNGSEONG FILLER (V) ÷ [0.3]" <|
            \_ ->
                "\u{200D}̈ᅠ"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{200D}̈", "ᅠ" ]
        , test "554: ÷ [0.2] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) ÷ [999.0] HANGUL JONGSEONG KIYEOK (T) ÷ [0.3]" <|
            \_ ->
                "\u{200D}ᆨ"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{200D}", "ᆨ" ]
        , test "555: ÷ [0.2] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL JONGSEONG KIYEOK (T) ÷ [0.3]" <|
            \_ ->
                "\u{200D}̈ᆨ"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{200D}̈", "ᆨ" ]
        , test "556: ÷ [0.2] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) ÷ [999.0] HANGUL SYLLABLE GA (LV) ÷ [0.3]" <|
            \_ ->
                "\u{200D}가"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{200D}", "가" ]
        , test "557: ÷ [0.2] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL SYLLABLE GA (LV) ÷ [0.3]" <|
            \_ ->
                "\u{200D}̈가"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{200D}̈", "가" ]
        , test "558: ÷ [0.2] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) ÷ [999.0] HANGUL SYLLABLE GAG (LVT) ÷ [0.3]" <|
            \_ ->
                "\u{200D}각"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{200D}", "각" ]
        , test "559: ÷ [0.2] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL SYLLABLE GAG (LVT) ÷ [0.3]" <|
            \_ ->
                "\u{200D}̈각"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{200D}̈", "각" ]
        , test "560: ÷ [0.2] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) ÷ [999.0] WATCH (ExtPict) ÷ [0.3]" <|
            \_ ->
                "\u{200D}⌚"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{200D}", "⌚" ]
        , test "561: ÷ [0.2] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] WATCH (ExtPict) ÷ [0.3]" <|
            \_ ->
                "\u{200D}̈⌚"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{200D}̈", "⌚" ]
        , test "562: ÷ [0.2] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) × [9.0] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) ÷ [0.3]" <|
            \_ ->
                "\u{200D}̀"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{200D}̀" ]
        , test "563: ÷ [0.2] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) ÷ [0.3]" <|
            \_ ->
                "\u{200D}̈̀"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{200D}̈̀" ]
        , test "564: ÷ [0.2] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) × [9.0] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) ÷ [0.3]" <|
            \_ ->
                "\u{200D}\u{200D}"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{200D}\u{200D}" ]
        , test "565: ÷ [0.2] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) ÷ [0.3]" <|
            \_ ->
                "\u{200D}̈\u{200D}"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{200D}̈\u{200D}" ]
        , test "566: ÷ [0.2] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) ÷ [999.0] <reserved-0378> (Other) ÷ [0.3]" <|
            \_ ->
                "\u{200D}\u{0378}"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{200D}", "\u{0378}" ]
        , test "567: ÷ [0.2] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] <reserved-0378> (Other) ÷ [0.3]" <|
            \_ ->
                "\u{200D}̈\u{0378}"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{200D}̈", "\u{0378}" ]
        , test "568: ÷ [0.2] <reserved-0378> (Other) ÷ [999.0] SPACE (Other) ÷ [0.3]" <|
            \_ ->
                "\u{0378} "
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{0378}", " " ]
        , test "569: ÷ [0.2] <reserved-0378> (Other) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] SPACE (Other) ÷ [0.3]" <|
            \_ ->
                "\u{0378}̈ "
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{0378}̈", " " ]
        , test "570: ÷ [0.2] <reserved-0378> (Other) ÷ [5.0] <CARRIAGE RETURN (CR)> (CR) ÷ [0.3]" <|
            \_ ->
                "\u{0378}\u{000D}"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{0378}", "\u{000D}" ]
        , test "571: ÷ [0.2] <reserved-0378> (Other) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [5.0] <CARRIAGE RETURN (CR)> (CR) ÷ [0.3]" <|
            \_ ->
                "\u{0378}̈\u{000D}"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{0378}̈", "\u{000D}" ]
        , test "572: ÷ [0.2] <reserved-0378> (Other) ÷ [5.0] <LINE FEED (LF)> (LF) ÷ [0.3]" <|
            \_ ->
                "\u{0378}\n"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{0378}", "\n" ]
        , test "573: ÷ [0.2] <reserved-0378> (Other) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [5.0] <LINE FEED (LF)> (LF) ÷ [0.3]" <|
            \_ ->
                "\u{0378}̈\n"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{0378}̈", "\n" ]
        , test "574: ÷ [0.2] <reserved-0378> (Other) ÷ [5.0] <START OF HEADING> (Control) ÷ [0.3]" <|
            \_ ->
                "\u{0378}\u{0001}"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{0378}", "\u{0001}" ]
        , test "575: ÷ [0.2] <reserved-0378> (Other) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [5.0] <START OF HEADING> (Control) ÷ [0.3]" <|
            \_ ->
                "\u{0378}̈\u{0001}"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{0378}̈", "\u{0001}" ]
        , test "576: ÷ [0.2] <reserved-0378> (Other) × [9.0] COMBINING GRAPHEME JOINER (Extend) ÷ [0.3]" <|
            \_ ->
                "\u{0378}͏"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{0378}͏" ]
        , test "577: ÷ [0.2] <reserved-0378> (Other) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] COMBINING GRAPHEME JOINER (Extend) ÷ [0.3]" <|
            \_ ->
                "\u{0378}̈͏"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{0378}̈͏" ]
        , test "578: ÷ [0.2] <reserved-0378> (Other) ÷ [999.0] REGIONAL INDICATOR SYMBOL LETTER A (RI) ÷ [0.3]" <|
            \_ ->
                "\u{0378}🇦"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{0378}", "🇦" ]
        , test "579: ÷ [0.2] <reserved-0378> (Other) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] REGIONAL INDICATOR SYMBOL LETTER A (RI) ÷ [0.3]" <|
            \_ ->
                "\u{0378}̈🇦"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{0378}̈", "🇦" ]
        , test "580: ÷ [0.2] <reserved-0378> (Other) ÷ [999.0] ARABIC NUMBER SIGN (Prepend) ÷ [0.3]" <|
            \_ ->
                "\u{0378}\u{0600}"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{0378}", "\u{0600}" ]
        , test "581: ÷ [0.2] <reserved-0378> (Other) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] ARABIC NUMBER SIGN (Prepend) ÷ [0.3]" <|
            \_ ->
                "\u{0378}̈\u{0600}"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{0378}̈", "\u{0600}" ]
        , test "582: ÷ [0.2] <reserved-0378> (Other) × [9.1] DEVANAGARI SIGN VISARGA (SpacingMark) ÷ [0.3]" <|
            \_ ->
                "\u{0378}ः"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{0378}ः" ]
        , test "583: ÷ [0.2] <reserved-0378> (Other) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.1] DEVANAGARI SIGN VISARGA (SpacingMark) ÷ [0.3]" <|
            \_ ->
                "\u{0378}̈ः"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{0378}̈ः" ]
        , test "584: ÷ [0.2] <reserved-0378> (Other) ÷ [999.0] HANGUL CHOSEONG KIYEOK (L) ÷ [0.3]" <|
            \_ ->
                "\u{0378}ᄀ"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{0378}", "ᄀ" ]
        , test "585: ÷ [0.2] <reserved-0378> (Other) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL CHOSEONG KIYEOK (L) ÷ [0.3]" <|
            \_ ->
                "\u{0378}̈ᄀ"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{0378}̈", "ᄀ" ]
        , test "586: ÷ [0.2] <reserved-0378> (Other) ÷ [999.0] HANGUL JUNGSEONG FILLER (V) ÷ [0.3]" <|
            \_ ->
                "\u{0378}ᅠ"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{0378}", "ᅠ" ]
        , test "587: ÷ [0.2] <reserved-0378> (Other) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL JUNGSEONG FILLER (V) ÷ [0.3]" <|
            \_ ->
                "\u{0378}̈ᅠ"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{0378}̈", "ᅠ" ]
        , test "588: ÷ [0.2] <reserved-0378> (Other) ÷ [999.0] HANGUL JONGSEONG KIYEOK (T) ÷ [0.3]" <|
            \_ ->
                "\u{0378}ᆨ"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{0378}", "ᆨ" ]
        , test "589: ÷ [0.2] <reserved-0378> (Other) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL JONGSEONG KIYEOK (T) ÷ [0.3]" <|
            \_ ->
                "\u{0378}̈ᆨ"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{0378}̈", "ᆨ" ]
        , test "590: ÷ [0.2] <reserved-0378> (Other) ÷ [999.0] HANGUL SYLLABLE GA (LV) ÷ [0.3]" <|
            \_ ->
                "\u{0378}가"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{0378}", "가" ]
        , test "591: ÷ [0.2] <reserved-0378> (Other) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL SYLLABLE GA (LV) ÷ [0.3]" <|
            \_ ->
                "\u{0378}̈가"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{0378}̈", "가" ]
        , test "592: ÷ [0.2] <reserved-0378> (Other) ÷ [999.0] HANGUL SYLLABLE GAG (LVT) ÷ [0.3]" <|
            \_ ->
                "\u{0378}각"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{0378}", "각" ]
        , test "593: ÷ [0.2] <reserved-0378> (Other) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL SYLLABLE GAG (LVT) ÷ [0.3]" <|
            \_ ->
                "\u{0378}̈각"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{0378}̈", "각" ]
        , test "594: ÷ [0.2] <reserved-0378> (Other) ÷ [999.0] WATCH (ExtPict) ÷ [0.3]" <|
            \_ ->
                "\u{0378}⌚"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{0378}", "⌚" ]
        , test "595: ÷ [0.2] <reserved-0378> (Other) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] WATCH (ExtPict) ÷ [0.3]" <|
            \_ ->
                "\u{0378}̈⌚"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{0378}̈", "⌚" ]
        , test "596: ÷ [0.2] <reserved-0378> (Other) × [9.0] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) ÷ [0.3]" <|
            \_ ->
                "\u{0378}̀"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{0378}̀" ]
        , test "597: ÷ [0.2] <reserved-0378> (Other) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) ÷ [0.3]" <|
            \_ ->
                "\u{0378}̈̀"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{0378}̈̀" ]
        , test "598: ÷ [0.2] <reserved-0378> (Other) × [9.0] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) ÷ [0.3]" <|
            \_ ->
                "\u{0378}\u{200D}"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{0378}\u{200D}" ]
        , test "599: ÷ [0.2] <reserved-0378> (Other) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) ÷ [0.3]" <|
            \_ ->
                "\u{0378}̈\u{200D}"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{0378}̈\u{200D}" ]
        , test "600: ÷ [0.2] <reserved-0378> (Other) ÷ [999.0] <reserved-0378> (Other) ÷ [0.3]" <|
            \_ ->
                "\u{0378}\u{0378}"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{0378}", "\u{0378}" ]
        , test "601: ÷ [0.2] <reserved-0378> (Other) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] <reserved-0378> (Other) ÷ [0.3]" <|
            \_ ->
                "\u{0378}̈\u{0378}"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{0378}̈", "\u{0378}" ]
        , test "602: ÷ [0.2] <CARRIAGE RETURN (CR)> (CR) × [3.0] <LINE FEED (LF)> (LF) ÷ [4.0] LATIN SMALL LETTER A (Other) ÷ [5.0] <LINE FEED (LF)> (LF) ÷ [4.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [0.3]" <|
            \_ ->
                "\u{000D}\na\n̈"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{000D}\n", "a", "\n", "̈" ]
        , test "603: ÷ [0.2] LATIN SMALL LETTER A (Other) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [0.3]" <|
            \_ ->
                "ä"
                    |> Grapheme.toList
                    |> Expect.equal [ "ä" ]
        , test "604: ÷ [0.2] SPACE (Other) × [9.0] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) ÷ [999.0] ARABIC LETTER NOON (Other) ÷ [0.3]" <|
            \_ ->
                " \u{200D}ن"
                    |> Grapheme.toList
                    |> Expect.equal [ " \u{200D}", "ن" ]
        , test "605: ÷ [0.2] ARABIC LETTER NOON (Other) × [9.0] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) ÷ [999.0] SPACE (Other) ÷ [0.3]" <|
            \_ ->
                "ن\u{200D} "
                    |> Grapheme.toList
                    |> Expect.equal [ "ن\u{200D}", " " ]
        , test "606: ÷ [0.2] HANGUL CHOSEONG KIYEOK (L) × [6.0] HANGUL CHOSEONG KIYEOK (L) ÷ [0.3]" <|
            \_ ->
                "ᄀᄀ"
                    |> Grapheme.toList
                    |> Expect.equal [ "ᄀᄀ" ]
        , test "607: ÷ [0.2] HANGUL SYLLABLE GA (LV) × [7.0] HANGUL JONGSEONG KIYEOK (T) ÷ [999.0] HANGUL CHOSEONG KIYEOK (L) ÷ [0.3]" <|
            \_ ->
                "각ᄀ"
                    |> Grapheme.toList
                    |> Expect.equal [ "각", "ᄀ" ]
        , test "608: ÷ [0.2] HANGUL SYLLABLE GAG (LVT) × [8.0] HANGUL JONGSEONG KIYEOK (T) ÷ [999.0] HANGUL CHOSEONG KIYEOK (L) ÷ [0.3]" <|
            \_ ->
                "각ᆨᄀ"
                    |> Grapheme.toList
                    |> Expect.equal [ "각ᆨ", "ᄀ" ]
        , test "609: ÷ [0.2] REGIONAL INDICATOR SYMBOL LETTER A (RI) × [12.0] REGIONAL INDICATOR SYMBOL LETTER B (RI) ÷ [999.0] REGIONAL INDICATOR SYMBOL LETTER C (RI) ÷ [999.0] LATIN SMALL LETTER B (Other) ÷ [0.3]" <|
            \_ ->
                "🇦🇧🇨b"
                    |> Grapheme.toList
                    |> Expect.equal [ "🇦🇧", "🇨", "b" ]
        , test "610: ÷ [0.2] LATIN SMALL LETTER A (Other) ÷ [999.0] REGIONAL INDICATOR SYMBOL LETTER A (RI) × [13.0] REGIONAL INDICATOR SYMBOL LETTER B (RI) ÷ [999.0] REGIONAL INDICATOR SYMBOL LETTER C (RI) ÷ [999.0] LATIN SMALL LETTER B (Other) ÷ [0.3]" <|
            \_ ->
                "a🇦🇧🇨b"
                    |> Grapheme.toList
                    |> Expect.equal [ "a", "🇦🇧", "🇨", "b" ]
        , test "611: ÷ [0.2] LATIN SMALL LETTER A (Other) ÷ [999.0] REGIONAL INDICATOR SYMBOL LETTER A (RI) × [13.0] REGIONAL INDICATOR SYMBOL LETTER B (RI) × [9.0] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) ÷ [999.0] REGIONAL INDICATOR SYMBOL LETTER C (RI) ÷ [999.0] LATIN SMALL LETTER B (Other) ÷ [0.3]" <|
            \_ ->
                "a🇦🇧\u{200D}🇨b"
                    |> Grapheme.toList
                    |> Expect.equal [ "a", "🇦🇧\u{200D}", "🇨", "b" ]
        , test "612: ÷ [0.2] LATIN SMALL LETTER A (Other) ÷ [999.0] REGIONAL INDICATOR SYMBOL LETTER A (RI) × [9.0] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) ÷ [999.0] REGIONAL INDICATOR SYMBOL LETTER B (RI) × [13.0] REGIONAL INDICATOR SYMBOL LETTER C (RI) ÷ [999.0] LATIN SMALL LETTER B (Other) ÷ [0.3]" <|
            \_ ->
                "a🇦\u{200D}🇧🇨b"
                    |> Grapheme.toList
                    |> Expect.equal [ "a", "🇦\u{200D}", "🇧🇨", "b" ]
        , test "613: ÷ [0.2] LATIN SMALL LETTER A (Other) ÷ [999.0] REGIONAL INDICATOR SYMBOL LETTER A (RI) × [13.0] REGIONAL INDICATOR SYMBOL LETTER B (RI) ÷ [999.0] REGIONAL INDICATOR SYMBOL LETTER C (RI) × [13.0] REGIONAL INDICATOR SYMBOL LETTER D (RI) ÷ [999.0] LATIN SMALL LETTER B (Other) ÷ [0.3]" <|
            \_ ->
                "a🇦🇧🇨🇩b"
                    |> Grapheme.toList
                    |> Expect.equal [ "a", "🇦🇧", "🇨🇩", "b" ]
        , test "614: ÷ [0.2] LATIN SMALL LETTER A (Other) × [9.0] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) ÷ [0.3]" <|
            \_ ->
                "a\u{200D}"
                    |> Grapheme.toList
                    |> Expect.equal [ "a\u{200D}" ]
        , test "615: ÷ [0.2] LATIN SMALL LETTER A (Other) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] LATIN SMALL LETTER B (Other) ÷ [0.3]" <|
            \_ ->
                "äb"
                    |> Grapheme.toList
                    |> Expect.equal [ "ä", "b" ]
        , test "616: ÷ [0.2] LATIN SMALL LETTER A (Other) × [9.1] DEVANAGARI SIGN VISARGA (SpacingMark) ÷ [999.0] LATIN SMALL LETTER B (Other) ÷ [0.3]" <|
            \_ ->
                "aःb"
                    |> Grapheme.toList
                    |> Expect.equal [ "aः", "b" ]
        , test "617: ÷ [0.2] LATIN SMALL LETTER A (Other) ÷ [999.0] ARABIC NUMBER SIGN (Prepend) × [9.2] LATIN SMALL LETTER B (Other) ÷ [0.3]" <|
            \_ ->
                "a\u{0600}b"
                    |> Grapheme.toList
                    |> Expect.equal [ "a", "\u{0600}b" ]
        , test "618: ÷ [0.2] BABY (ExtPict) × [9.0] EMOJI MODIFIER FITZPATRICK TYPE-6 (Extend) ÷ [999.0] BABY (ExtPict) ÷ [0.3]" <|
            \_ ->
                "👶\u{1F3FF}👶"
                    |> Grapheme.toList
                    |> Expect.equal [ "👶\u{1F3FF}", "👶" ]
        , test "619: ÷ [0.2] LATIN SMALL LETTER A (Other) × [9.0] EMOJI MODIFIER FITZPATRICK TYPE-6 (Extend) ÷ [999.0] BABY (ExtPict) ÷ [0.3]" <|
            \_ ->
                "a\u{1F3FF}👶"
                    |> Grapheme.toList
                    |> Expect.equal [ "a\u{1F3FF}", "👶" ]
        , test "620: ÷ [0.2] LATIN SMALL LETTER A (Other) × [9.0] EMOJI MODIFIER FITZPATRICK TYPE-6 (Extend) ÷ [999.0] BABY (ExtPict) × [9.0] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) × [11.0] OCTAGONAL SIGN (ExtPict) ÷ [0.3]" <|
            \_ ->
                "a\u{1F3FF}👶\u{200D}\u{1F6D1}"
                    |> Grapheme.toList
                    |> Expect.equal [ "a\u{1F3FF}", "👶\u{200D}\u{1F6D1}" ]
        , test "621: ÷ [0.2] BABY (ExtPict) × [9.0] EMOJI MODIFIER FITZPATRICK TYPE-6 (Extend) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) × [11.0] BABY (ExtPict) × [9.0] EMOJI MODIFIER FITZPATRICK TYPE-6 (Extend) ÷ [0.3]" <|
            \_ ->
                "👶\u{1F3FF}̈\u{200D}👶\u{1F3FF}"
                    |> Grapheme.toList
                    |> Expect.equal [ "👶\u{1F3FF}̈\u{200D}👶\u{1F3FF}" ]
        , test "622: ÷ [0.2] OCTAGONAL SIGN (ExtPict) × [9.0] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) × [11.0] OCTAGONAL SIGN (ExtPict) ÷ [0.3]" <|
            \_ ->
                "\u{1F6D1}\u{200D}\u{1F6D1}"
                    |> Grapheme.toList
                    |> Expect.equal [ "\u{1F6D1}\u{200D}\u{1F6D1}" ]
        , test "623: ÷ [0.2] LATIN SMALL LETTER A (Other) × [9.0] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) ÷ [999.0] OCTAGONAL SIGN (ExtPict) ÷ [0.3]" <|
            \_ ->
                "a\u{200D}\u{1F6D1}"
                    |> Grapheme.toList
                    |> Expect.equal [ "a\u{200D}", "\u{1F6D1}" ]
        , test "624: ÷ [0.2] UPPER BLADE SCISSORS (Other) × [9.0] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) × [11.0] UPPER BLADE SCISSORS (Other) ÷ [0.3]" <|
            \_ ->
                "✁\u{200D}✁"
                    |> Grapheme.toList
                    |> Expect.equal [ "✁\u{200D}✁" ]
        , test "625: ÷ [0.2] LATIN SMALL LETTER A (Other) × [9.0] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) ÷ [999.0] UPPER BLADE SCISSORS (Other) ÷ [0.3]" <|
            \_ ->
                "a\u{200D}✁"
                    |> Grapheme.toList
                    |> Expect.equal [ "a\u{200D}", "✁" ]
        ]
