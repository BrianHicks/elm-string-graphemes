module String.Segmentation.Prepend exposing (chars, parser)

import Parser exposing (Parser)
import String.Segmentation.RangeSet as RangeSet exposing (RangeSet)
import String.Segmentation.RangeSet.Range as Range


parser : Parser ()
parser =
    Parser.chompIf (\c -> RangeSet.member c chars)


chars : RangeSet Char
chars =
    RangeSet.fromList
        [ Range.range '\u{0600}' '\u{0605}' -- Cf   [6] ARABIC NUMBER SIGN..ARABIC NUMBER MARK ABOVE
        , Range.point '\u{06DD}' -- Cf       ARABIC END OF AYAH
        , Range.point '\u{070F}' -- Cf       SYRIAC ABBREVIATION MARK
        , Range.point '\u{08E2}' -- Cf       ARABIC DISPUTED END OF AYAH
        , Range.point 'ൎ' -- Lo       MALAYALAM LETTER DOT REPH
        , Range.point '\u{110BD}' -- Cf       KAITHI NUMBER SIGN
        , Range.point '\u{110CD}' -- Cf       KAITHI NUMBER SIGN ABOVE
        , Range.range '𑇂' '𑇃' -- Lo   [2] SHARADA SIGN JIHVAMULIYA..SHARADA SIGN UPADHMANIYA
        , Range.point '\u{11A3A}' -- Lo       ZANABAZAR SQUARE CLUSTER-INITIAL LETTER RA
        , Range.range '\u{11A84}' '\u{11A89}' -- Lo   [6] SOYOMBO SIGN JIHVAMULIYA..SOYOMBO CLUSTER-INITIAL LETTER SA
        , Range.point '\u{11D46}' -- Lo       MASARAM GONDI REPHA
        ]
