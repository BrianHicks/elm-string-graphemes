module WithoutSegmentation exposing (main)

import Html exposing (Html)


main : Html msg
main =
    ""
        |> String.toList
        |> String.fromList
        |> Html.text
