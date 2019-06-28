module WithSegmentation exposing (main)

import Html exposing (Html)
import String.Segmentation as Segmentation


main : Html msg
main =
    ""
        |> Segmentation.graphemes
        |> Result.withDefault []
        |> String.concat
        |> Html.text
