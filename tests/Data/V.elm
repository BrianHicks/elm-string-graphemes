module Data.V exposing (chars)


chars : List Char
chars =
    List.concat
        [ List.map Char.fromCode (List.range 0x1160 0x11A7) -- Lo  [72] HANGUL JUNGSEONG FILLER..HANGUL JUNGSEONG O-YAE
        , List.map Char.fromCode (List.range 0xD7B0 0xD7C6) -- Lo  [23] HANGUL JUNGSEONG O-YEO..HANGUL JUNGSEONG ARAEA-E
        ]
