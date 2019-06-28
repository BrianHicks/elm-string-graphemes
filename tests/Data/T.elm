module Data.T exposing (chars)


chars : List Char
chars =
    List.concat
        [ List.map Char.fromCode (List.range 0x11A8 0x11FF) -- Lo  [88] HANGUL JONGSEONG KIYEOK..HANGUL JONGSEONG SSANGNIEUN
        , List.map Char.fromCode (List.range 0xD7CB 0xD7FB) -- Lo  [49] HANGUL JONGSEONG NIEUN-RIEUL..HANGUL JONGSEONG PHIEUPH-THIEUTH
        ]
