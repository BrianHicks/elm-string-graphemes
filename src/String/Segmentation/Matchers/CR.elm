module String.Segmentation.Matchers.CR exposing (match)


match : Char -> Bool
match char =
    let
        c =
            Char.toCode char
    in
    c == 13
