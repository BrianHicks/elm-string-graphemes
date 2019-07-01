module String.Graphemes.Data.Prepend exposing (chars, match, parser)

{-| Hey, this module was generated automatically. Please don't edit it.

Run `make src/String/Graphemes/Data/Prepend.elm` instead!

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
        [ '\u{06DD}' -- Cf       ARABIC END OF AYAH
        , '\u{070F}' -- Cf       SYRIAC ABBREVIATION MARK
        , '\u{08E2}' -- Cf       ARABIC DISPUTED END OF AYAH
        , 'ൎ' -- Lo       MALAYALAM LETTER DOT REPH
        , '\u{110BD}' -- Cf       KAITHI NUMBER SIGN
        , '\u{110CD}' -- Cf       KAITHI NUMBER SIGN ABOVE
        , '\u{11A3A}' -- Lo       ZANABAZAR SQUARE CLUSTER-INITIAL LETTER RA
        , '\u{11D46}' -- Lo       MASARAM GONDI REPHA
        ]


ranges : List (Range Char)
ranges =
    List.map (\( low, high ) -> Range.range low high)
        [ ( '\u{0600}', '\u{0605}' ) -- Cf   [6] ARABIC NUMBER SIGN..ARABIC NUMBER MARK ABOVE
        , ( '𑇂', '𑇃' ) -- Lo   [2] SHARADA SIGN JIHVAMULIYA..SHARADA SIGN UPADHMANIYA
        , ( '\u{11A84}', '\u{11A89}' ) -- Lo   [6] SOYOMBO SIGN JIHVAMULIYA..SOYOMBO CLUSTER-INITIAL LETTER SA
        ]
