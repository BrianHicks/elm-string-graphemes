module String.Segmentation.Control exposing (chars, parser)

import Parser exposing (Parser)
import Set exposing (Set)


parser : Parser ()
parser =
    Parser.chompIf (\c -> Set.member c chars)


chars : Set Char
chars =
    [ [ 0xAD -- Cf       SOFT HYPHEN
      , 0x061C -- Cf       ARABIC LETTER MARK
      , 0x180E -- Cf       MONGOLIAN VOWEL SEPARATOR
      , 0x200B -- Cf       ZERO WIDTH SPACE
      , 0x2028 -- Zl       LINE SEPARATOR
      , 0x2029 -- Zp       PARAGRAPH SEPARATOR
      , 0x2065 -- Cn       <reserved-2065>
      , 0xFEFF -- Cf       ZERO WIDTH NO-BREAK SPACE
      , 0x000E0000 -- Cn       <reserved-E0000>
      , 0x000E0001 -- Cf       LANGUAGE TAG
      ]
    , List.range 0x00 0x09 -- Cc  [10] <control-0000>..<control-0009>
    , List.range 0x0B 0x0C -- Cc   [2] <control-000B>..<control-000C>
    , List.range 0x0E 0x1F -- Cc  [18] <control-000E>..<control-001F>
    , List.range 0x7F 0x9F -- Cc  [33] <control-007F>..<control-009F>
    , List.range 0x200E 0x200F -- Cf   [2] LEFT-TO-RIGHT MARK..RIGHT-TO-LEFT MARK
    , List.range 0x202A 0x202E -- Cf   [5] LEFT-TO-RIGHT EMBEDDING..RIGHT-TO-LEFT OVERRIDE
    , List.range 0x2060 0x2064 -- Cf   [5] WORD JOINER..INVISIBLE PLUS
    , List.range 0x2066 0x206F -- Cf  [10] LEFT-TO-RIGHT ISOLATE..NOMINAL DIGIT SHAPES
    , List.range 0xFFF0 0xFFF8 -- Cn   [9] <reserved-FFF0>..<reserved-FFF8>
    , List.range 0xFFF9 0xFFFB -- Cf   [3] INTERLINEAR ANNOTATION ANCHOR..INTERLINEAR ANNOTATION TERMINATOR
    , List.range 0x00013430 0x00013438 -- Cf   [9] EGYPTIAN HIEROGLYPH VERTICAL JOINER..EGYPTIAN HIEROGLYPH END SEGMENT
    , List.range 0x0001BCA0 0x0001BCA3 -- Cf   [4] SHORTHAND FORMAT LETTER OVERLAP..SHORTHAND FORMAT UP STEP
    , List.range 0x0001D173 0x0001D17A -- Cf   [8] MUSICAL SYMBOL BEGIN BEAM..MUSICAL SYMBOL END PHRASE
    , List.range 0x000E0002 0x000E001F -- Cn  [30] <reserved-E0002>..<reserved-E001F>
    , List.range 0x000E0080 0x000E00FF -- Cn [128] <reserved-E0080>..<reserved-E00FF>
    , List.range 0x000E01F0 0x000E0FFF -- Cn [3600] <reserved-E01F0>..<reserved-E0FFF>
    ]
        |> List.concat
        |> List.map Char.fromCode
        |> Set.fromList
