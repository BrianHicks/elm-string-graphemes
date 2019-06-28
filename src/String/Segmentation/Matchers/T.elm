module String.Segmentation.Matchers.T exposing (match)


match : Char -> Bool
match char =
    let
        c =
            Char.toCode char
    in
    (c >= 4520 && c <= 4607)
        || (c >= 55243 && c <= 55291)
