module WithoutSegmentation exposing (main)

import Html exposing (Html)


main : Html msg
main =
    "\u{1F9B8}\u{1F3FD}\u{200D}♂️"
        |> String.toList
        |> String.fromList
        |> Html.text
