module WithoutSegmentation exposing (main)

import Html exposing (Html)
import Parser exposing (Parser)


main : Html msg
main =
    "\u{1F9B8}\u{1F3FD}\u{200D}♂️"
        |> Parser.run parser
        |> Result.withDefault ""
        |> Html.text


{-| we include a little parser in here to measure the cost of this library
specifically instead of this + elm/parser (which many projects already have)
-}
parser : Parser String
parser =
    Parser.loop ()
        (\_ ->
            Parser.oneOf
                [ Parser.map (\_ -> Parser.Loop ())
                    (Parser.chompWhile (\_ -> True))
                , Parser.map (\_ -> Parser.Done ())
                    Parser.end
                ]
        )
        |> Parser.getChompedString
