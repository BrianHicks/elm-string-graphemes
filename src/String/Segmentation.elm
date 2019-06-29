module String.Segmentation exposing (graphemes)

import Parser exposing ((|.), (|=), Parser, Step(..), backtrackable, loop)
import String.Segmentation.Data.CR as CR
import String.Segmentation.Data.Control as Control
import String.Segmentation.Data.LF as LF
import String.Segmentation.Data.Prepend as Prepend
import String.Segmentation.Hangul as Hangul


{-| Break a string into graphemes (the characters you percieve, as opposed to
the bytes used to store the string or the codepoints used to make the
character.)

This will preserve things like accents, Hangul syllables, and emoji with skin
tone.

This uses the [Unicode TR29
algorithm](http://www.unicode.org/reports/tr29/#Table_Combining_Char_Sequences_and_Grapheme_Clusters). There's
also a [more visual description of the
algorithm](https://www.unicode.org/Public/12.1.0/ucd/auxiliary/GraphemeBreakTest.html)
if you're interested in learning more.

-}
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
    , Hangul.parser

    -- if we don't match any of these, we don't have a special case and can
    -- ignore the character
    , Parser.chompIf (\_ -> True)
    ]
