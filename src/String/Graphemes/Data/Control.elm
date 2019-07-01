module String.Graphemes.Data.Control exposing (chars, match, parser)

{-| Hey, this module was generated automatically. Please don't edit it.

Run `make src/String/Graphemes/Data/Control.elm` instead!

-}

import Parser exposing (Parser)
import String.Graphemes.RangeSet as RangeSet exposing (RangeSet)
import String.Graphemes.RangeSet.Range as Range exposing (Range)


parser : Parser ()
parser =
    Parser.chompIf match


match : Char -> Bool
match c =
    RangeSet.member c chars


chars : RangeSet Char
chars =
    RangeSet.fromList (points ++ ranges)


points : List (Range Char)
points =
    List.map Range.point
        [ '\u{00AD}' -- Cf       SOFT HYPHEN
        , '\u{061C}' -- Cf       ARABIC LETTER MARK
        , '\u{180E}' -- Cf       MONGOLIAN VOWEL SEPARATOR
        , '\u{200B}' -- Cf       ZERO WIDTH SPACE
        , '\u{2028}' -- Zl       LINE SEPARATOR
        , '\u{2029}' -- Zp       PARAGRAPH SEPARATOR
        , '\u{2065}' -- Cn       <reserved-2065>
        , '\u{FEFF}' -- Cf       ZERO WIDTH NO-BREAK SPACE
        , '\u{E0000}' -- Cn       <reserved-E0000>
        , '\u{E0001}' -- Cf       LANGUAGE TAG
        ]


ranges : List (Range Char)
ranges =
    List.map (\( low, high ) -> Range.range low high)
        [ ( '\u{0000}', '\t' ) -- Cc  [10] <control-0000>..<control-0009>
        , ( '\u{000B}', '\u{000C}' ) -- Cc   [2] <control-000B>..<control-000C>
        , ( '\u{000E}', '\u{001F}' ) -- Cc  [18] <control-000E>..<control-001F>
        , ( '\u{007F}', '\u{009F}' ) -- Cc  [33] <control-007F>..<control-009F>
        , ( '\u{200E}', '\u{200F}' ) -- Cf   [2] LEFT-TO-RIGHT MARK..RIGHT-TO-LEFT MARK
        , ( '\u{202A}', '\u{202E}' ) -- Cf   [5] LEFT-TO-RIGHT EMBEDDING..RIGHT-TO-LEFT OVERRIDE
        , ( '\u{2060}', '\u{2064}' ) -- Cf   [5] WORD JOINER..INVISIBLE PLUS
        , ( '\u{2066}', '\u{206F}' ) -- Cf  [10] LEFT-TO-RIGHT ISOLATE..NOMINAL DIGIT SHAPES
        , ( '\u{FFF0}', '\u{FFF8}' ) -- Cn   [9] <reserved-FFF0>..<reserved-FFF8>
        , ( '\u{FFF9}', '\u{FFFB}' ) -- Cf   [3] INTERLINEAR ANNOTATION ANCHOR..INTERLINEAR ANNOTATION TERMINATOR
        , ( '\u{13430}', '\u{13438}' ) -- Cf   [9] EGYPTIAN HIEROGLYPH VERTICAL JOINER..EGYPTIAN HIEROGLYPH END SEGMENT
        , ( '\u{1BCA0}', '\u{1BCA3}' ) -- Cf   [4] SHORTHAND FORMAT LETTER OVERLAP..SHORTHAND FORMAT UP STEP
        , ( '\u{1D173}', '\u{1D17A}' ) -- Cf   [8] MUSICAL SYMBOL BEGIN BEAM..MUSICAL SYMBOL END PHRASE
        , ( '\u{E0002}', '\u{E001F}' ) -- Cn  [30] <reserved-E0002>..<reserved-E001F>
        , ( '\u{E0080}', '\u{E00FF}' ) -- Cn [128] <reserved-E0080>..<reserved-E00FF>
        , ( '\u{E01F0}', '\u{E0FFF}' ) -- Cn [3600] <reserved-E01F0>..<reserved-E0FFF>
        ]
