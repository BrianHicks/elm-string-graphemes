module String.Segmentation.Prepend exposing (chars, parser)

import Parser exposing (Parser)
import Set exposing (Set)


parser : Parser ()
parser =
    Parser.chompIf (\c -> Set.member c chars)


chars : Set Char
chars =
    [ [ 0x06DD -- Cf       ARABIC END OF AYAH
      , 0x070F -- Cf       SYRIAC ABBREVIATION MARK
      , 0x08E2 -- Cf       ARABIC DISPUTED END OF AYAH
      , 0x0D4E -- Lo       MALAYALAM LETTER DOT REPH
      , 0x000110BD -- Cf       KAITHI NUMBER SIGN
      , 0x000110CD -- Cf       KAITHI NUMBER SIGN ABOVE
      , 0x00011A3A -- Lo       ZANABAZAR SQUARE CLUSTER-INITIAL LETTER RA
      , 0x00011D46 -- Lo       MASARAM GONDI REPHA
      ]
    , List.range 0x0600 0x0605 -- Cf   [6] ARABIC NUMBER SIGN..ARABIC NUMBER MARK ABOVE
    , List.range 0x000111C2 0x000111C3 -- Lo   [2] SHARADA SIGN JIHVAMULIYA..SHARADA SIGN UPADHMANIYA
    , List.range 0x00011A84 0x00011A89 -- Lo   [6] SOYOMBO SIGN JIHVAMULIYA..SOYOMBO CLUSTER-INITIAL LETTER SA
    ]
        |> List.concat
        |> List.map Char.fromCode
        |> Set.fromList
