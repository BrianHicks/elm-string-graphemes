module String.Segmentation.Matchers.L exposing (match)


match : Char -> Bool
match char =
    let
        c =
            Char.toCode char
    in
    (c >= 4352 && c <= 4447)
        || (c >= 43360 && c <= 43388)
