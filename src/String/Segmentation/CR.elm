module String.Segmentation.CR exposing (match)


match : Char -> Bool
match char =
    let
        c =
            Char.toCode char
    in
    c == 13
