module WithSegmentation exposing (main)

import Html exposing (Html)
import String.Graphemes as Graphemes


main : Html msg
main =
    "\u{1F9B8}\u{1F3FD}\u{200D}♂️"
        |> Graphemes.toList
        |> String.concat
        |> Html.text
