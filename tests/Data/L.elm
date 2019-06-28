module Data.L exposing (chars)


chars : List Char
chars =
    List.concat
        [ List.map Char.fromCode (List.range 0x1100 0x115F) -- Lo  [96] HANGUL CHOSEONG KIYEOK..HANGUL CHOSEONG FILLER
        , List.map Char.fromCode (List.range 0xA960 0xA97C) -- Lo  [29] HANGUL CHOSEONG TIKEUT-MIEUM..HANGUL CHOSEONG SSANGYEORINHIEUH
        ]
