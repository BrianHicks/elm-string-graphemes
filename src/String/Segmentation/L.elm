module String.Segmentation.L exposing (chars, parser)

import Parser exposing (Parser)
import Set exposing (Set)


parser : Parser ()
parser =
    Parser.chompIf (\c -> Set.member c chars)


chars : Set Char
chars =
    (Set.fromList << List.concat)
        [ List.map Char.fromCode (List.range 0x1100 0x115F) -- Lo  [96] HANGUL CHOSEONG KIYEOK..HANGUL CHOSEONG FILLER
        , List.map Char.fromCode (List.range 0xA960 0xA97C) -- Lo  [29] HANGUL CHOSEONG TIKEUT-MIEUM..HANGUL CHOSEONG SSANGYEORINHIEUH
        ]
