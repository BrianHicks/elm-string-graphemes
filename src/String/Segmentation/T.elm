module String.Segmentation.T exposing (chars, parser)

import Parser exposing (Parser)
import Set exposing (Set)


parser : Parser ()
parser =
    Parser.chompIf (\c -> Set.member c chars)


chars : Set Char
chars =
    (Set.fromList << List.concat)
        [ List.map Char.fromCode (List.range 0x11A8 0x11FF) -- Lo  [88] HANGUL JONGSEONG KIYEOK..HANGUL JONGSEONG SSANGNIEUN
        , List.map Char.fromCode (List.range 0xD7CB 0xD7FB) -- Lo  [49] HANGUL JONGSEONG NIEUN-RIEUL..HANGUL JONGSEONG PHIEUPH-THIEUTH
        ]
