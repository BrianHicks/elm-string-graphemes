module String.Segmentation exposing (graphemes)

import Parser exposing ((|.), (|=), Parser, Step(..), backtrackable, loop)
import String.Segmentation.CR as CR
import String.Segmentation.Control as Control
import String.Segmentation.LF as LF
import String.Segmentation.Prepend as Prepend


graphemes : String -> Result (List Parser.DeadEnd) (List String)
graphemes input =
    Parser.run (loop [] graphemesLoop) input


graphemesLoop : List String -> Parser (Step (List String) (List String))
graphemesLoop current =
    Parser.oneOf
        [ sequences
            |> List.map (grapheme current)
            |> Parser.oneOf
        , Parser.map (\_ -> Done (List.reverse current)) Parser.end
        ]


grapheme : List String -> Parser a -> Parser (Step (List String) (List String))
grapheme rest parser =
    parser
        |> Parser.getChompedString
        |> Parser.map (\new -> Loop (new :: rest))


sequences : List (Parser ())
sequences =
    [ backtrackable CR.parser |. LF.parser
    , CR.parser
    , LF.parser
    , Control.parser
    , Prepend.parser
    ]
