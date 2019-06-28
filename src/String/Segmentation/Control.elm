module String.Segmentation.Control exposing (match, parser)

import Parser exposing (Parser)


parser : Parser ()
parser =
    Parser.chompIf match


match : Char -> Bool
match char =
    let
        c =
            Char.toCode char
    in
    (c >= 0x00 && c <= 0x09)
        || (c >= 0x0B && c <= 0x0C)
        || (c >= 0x0E && c <= 0x1F)
        || (c >= 0x7F && c <= 0x9F)
        || (c == 0xAD)
        || (c == 0x061C)
        || (c == 0x180E)
        || (c == 0x200B)
        || (c >= 0x200E && c <= 0x200F)
        || (c == 0x2028)
        || (c == 0x2029)
        || (c >= 0x202A && c <= 0x202E)
        || (c >= 0x2060 && c <= 0x2064)
        || (c == 0x2065)
        || (c >= 0x2066 && c <= 0x206F)
        || (c == 0xFEFF)
        || (c >= 0xFFF0 && c <= 0xFFF8)
        || (c >= 0xFFF9 && c <= 0xFFFB)
        || (c >= 0x00013430 && c <= 0x00013438)
        || (c >= 0x0001BCA0 && c <= 0x0001BCA3)
        || (c >= 0x0001D173 && c <= 0x0001D17A)
        || (c == 0x000E0000)
        || (c == 0x000E0001)
        || (c >= 0x000E0002 && c <= 0x000E001F)
        || (c >= 0x000E0080 && c <= 0x000E00FF)
        || (c >= 0x000E01F0 && c <= 0x000E0FFF)
