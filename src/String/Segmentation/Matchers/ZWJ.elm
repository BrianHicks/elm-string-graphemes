module String.Segmentation.Matchers.ZWJ exposing (match)


match : Char -> Bool
match char =
    let
        c =
            Char.toCode char
    in
    c == 8205
