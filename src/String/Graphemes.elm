module String.Graphemes exposing (graphemes)

import Parser exposing (..)
import String.Graphemes.Data.CR as CR
import String.Graphemes.Data.Control as Control
import String.Graphemes.Data.Extend as Extend
import String.Graphemes.Data.Extended_Pictographic as ExtendedPictographic
import String.Graphemes.Data.L as L
import String.Graphemes.Data.LF as LF
import String.Graphemes.Data.LV as LV
import String.Graphemes.Data.LVT as LVT
import String.Graphemes.Data.Prepend as Prepend
import String.Graphemes.Data.Regional_Indicator as RegionalIndicator
import String.Graphemes.Data.SpacingMark as SpacingMark
import String.Graphemes.Data.T as T
import String.Graphemes.Data.V as V
import String.Graphemes.Data.ZWJ as ZWJ


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
    [ cr
    , lf
    , Control.parser
    , extend
    , regionalIndicator
    , prepend
    , spacingMark
    , l
    , v
    , t
    , lv
    , lvt
    , extendedPictographic
    , zwj
    , other
    ]


cr : Parser ()
cr =
    CR.parser |. oneOfOrBreak [ lf ]


lf : Parser ()
lf =
    -- no further rules!
    LF.parser


extend : Parser ()
extend =
    Extend.parser |. oneOfOrBreak [ extendSpacingMarkZWJ ]


regionalIndicator : Parser ()
regionalIndicator =
    RegionalIndicator.parser
        |. oneOfOrBreak
            [ RegionalIndicator.parser
                |. oneOfOrBreak [ zwj ]
            , extendSpacingMarkZWJ
            ]


prepend : Parser ()
prepend =
    Prepend.parser
        |. oneOfOrBreak
            [ regionalIndicator
            , lazy (\_ -> prepend)
            , l
            , v
            , t
            , lv
            , lvt
            , extendedPictographic
            , extendSpacingMarkZWJ
            , chompIf (\c -> not (CR.match c || LF.match c || Control.match c))
            ]


spacingMark : Parser ()
spacingMark =
    SpacingMark.parser |. oneOfOrBreak [ extendSpacingMarkZWJ ]


l : Parser ()
l =
    L.parser
        |. oneOfOrBreak
            [ lazy (\_ -> l)
            , v
            , lv
            , lvt
            , extendSpacingMarkZWJ
            ]


v : Parser ()
v =
    V.parser
        |. oneOfOrBreak
            [ lazy (\_ -> v)
            , t
            , extendSpacingMarkZWJ
            ]


t : Parser ()
t =
    T.parser
        |. oneOfOrBreak
            [ lazy (\_ -> t)
            , extendSpacingMarkZWJ
            ]


lv : Parser ()
lv =
    LV.parser
        |. oneOfOrBreak
            [ v
            , t
            , extendSpacingMarkZWJ
            ]


lvt : Parser ()
lvt =
    LVT.parser
        |. oneOfOrBreak
            [ t
            , extendSpacingMarkZWJ
            ]


extendedPictographic : Parser ()
extendedPictographic =
    ExtendedPictographic.parser
        |. oneOfOrBreak
            [ zeroOrMore Extend.parser
                |. ZWJ.parser
                |. lazy (\_ -> extendedPictographic)
                |> backtrackable
            , extendSpacingMarkZWJ
            ]


zwj : Parser ()
zwj =
    ZWJ.parser |. oneOfOrBreak [ extendSpacingMarkZWJ ]


other : Parser ()
other =
    Parser.chompIf (\_ -> True)
        |. oneOfOrBreak
            [ extend
            , spacingMark
            , zwj
            ]


extendSpacingMarkZWJ : Parser ()
extendSpacingMarkZWJ =
    oneOf
        [ lazy (\_ -> extend)
        , lazy (\_ -> spacingMark)
        , lazy (\_ -> zwj)
        ]


oneOfOrBreak : List (Parser ()) -> Parser ()
oneOfOrBreak rules =
    oneOf (rules ++ [ Parser.succeed () ])


zeroOrMore : Parser () -> Parser ()
zeroOrMore parser =
    loop ()
        (\_ ->
            oneOf
                [ Parser.map (\_ -> Loop ()) parser
                , Parser.succeed (Done ())
                ]
        )
