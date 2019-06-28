module String.Segmentation.Regional_Indicator exposing (match)


match : Char -> Bool
match char =
    let
        c =
            Char.toCode char
    in
    c >= 127462 && c <= 127487
