module String.Segmentation.Data.Control exposing (chars, match, parser)

{-| Hey, this module was generated automatically. Please don't edit it.

Run `make src/String/Segmentation/Data/Control.elm` instead!

-}

import Parser exposing (Parser)
import String.Segmentation.RangeSet as RangeSet exposing (RangeSet)
import String.Segmentation.RangeSet.Range as Range


parser : Parser ()
parser =
    Parser.chompIf match


match : Char -> Bool
match c =
    RangeSet.member c chars


chars : RangeSet Char
chars =
    RangeSet.fromList
        [ Range.range '\u{0000}' '\t' -- Cc  [10] <control-0000>..<control-0009>
        , Range.range '\u{000B}' '\u{000C}' -- Cc   [2] <control-000B>..<control-000C>
        , Range.range '\u{000E}' '\u{001F}' -- Cc  [18] <control-000E>..<control-001F>
        , Range.range '\u{007F}' '\u{009F}' -- Cc  [33] <control-007F>..<control-009F>
        , Range.point '\u{00AD}' -- Cf       SOFT HYPHEN
        , Range.point '\u{061C}' -- Cf       ARABIC LETTER MARK
        , Range.point '\u{180E}' -- Cf       MONGOLIAN VOWEL SEPARATOR
        , Range.point '\u{200B}' -- Cf       ZERO WIDTH SPACE
        , Range.range '\u{200E}' '\u{200F}' -- Cf   [2] LEFT-TO-RIGHT MARK..RIGHT-TO-LEFT MARK
        , Range.point '\u{2028}' -- Zl       LINE SEPARATOR
        , Range.point '\u{2029}' -- Zp       PARAGRAPH SEPARATOR
        , Range.range '\u{202A}' '\u{202E}' -- Cf   [5] LEFT-TO-RIGHT EMBEDDING..RIGHT-TO-LEFT OVERRIDE
        , Range.range '\u{2060}' '\u{2064}' -- Cf   [5] WORD JOINER..INVISIBLE PLUS
        , Range.point '\u{2065}' -- Cn       <reserved-2065>
        , Range.range '\u{2066}' '\u{206F}' -- Cf  [10] LEFT-TO-RIGHT ISOLATE..NOMINAL DIGIT SHAPES
        , Range.point '\u{FEFF}' -- Cf       ZERO WIDTH NO-BREAK SPACE
        , Range.range '\u{FFF0}' '\u{FFF8}' -- Cn   [9] <reserved-FFF0>..<reserved-FFF8>
        , Range.range '\u{FFF9}' '\u{FFFB}' -- Cf   [3] INTERLINEAR ANNOTATION ANCHOR..INTERLINEAR ANNOTATION TERMINATOR
        , Range.range '\u{13430}' '\u{13438}' -- Cf   [9] EGYPTIAN HIEROGLYPH VERTICAL JOINER..EGYPTIAN HIEROGLYPH END SEGMENT
        , Range.range '\u{1BCA0}' '\u{1BCA3}' -- Cf   [4] SHORTHAND FORMAT LETTER OVERLAP..SHORTHAND FORMAT UP STEP
        , Range.range '\u{1D173}' '\u{1D17A}' -- Cf   [8] MUSICAL SYMBOL BEGIN BEAM..MUSICAL SYMBOL END PHRASE
        , Range.point '\u{E0000}' -- Cn       <reserved-E0000>
        , Range.point '\u{E0001}' -- Cf       LANGUAGE TAG
        , Range.range '\u{E0002}' '\u{E001F}' -- Cn  [30] <reserved-E0002>..<reserved-E001F>
        , Range.range '\u{E0080}' '\u{E00FF}' -- Cn [128] <reserved-E0080>..<reserved-E00FF>
        , Range.range '\u{E01F0}' '\u{E0FFF}' -- Cn [3600] <reserved-E01F0>..<reserved-E0FFF>
        ]
