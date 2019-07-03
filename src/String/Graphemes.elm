module String.Graphemes exposing
    ( isEmpty, length
    , graphemes, toList
    )

{-| The goal of this API is to recreate `elm/core`'s `String` module as
faithfully as possible, but to operate on grapheme boundaries instead of bytes
or characters. This can smooth out some edge cases when processing user-entered
text: emoji, for example, will not be split awkwardly. Basically, if you're
dealing with text that the user sees, work at the grapheme level. See the
package README for more information on motivation.

@docs isEmpty, length

-}

import Parser exposing (..)
import String.Graphemes.Data as Data exposing (Class(..))
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
import String.Graphemes.RangeDict as RangeDict exposing (RangeDict)


{-| Determine if a string is empty.

    isEmpty "" --> True

    isEmpty "the world" --> False

-}
isEmpty : String -> Bool
isEmpty =
    String.isEmpty


{-| Get the length of a string.

    length "innumerable" --> 11

    length "" --> 0

-}
length : String -> Int
length =
    -- TODO: foldl
    graphemes >> List.length


{-| TODO: docs
-}
toList : String -> List String
toList =
    graphemes


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
graphemes : String -> List String
graphemes input =
    case Parser.run (loop [] graphemesLoop) input of
        Ok output ->
            output

        Err _ ->
            [ input ]



-- INTERNALS


graphemesLoop : List String -> Parser (Step (List String) (List String))
graphemesLoop current =
    Parser.oneOf
        [ grapheme current sequence
        , Parser.map (\_ -> Done (List.reverse current)) Parser.end
        ]


grapheme : List String -> Parser a -> Parser (Step (List String) (List String))
grapheme rest parser =
    parser
        |> Parser.getChompedString
        |> Parser.map (\new -> Loop (new :: rest))


classes : RangeDict Char Data.Class
classes =
    List.foldl
        RangeDict.union
        RangeDict.empty
        [ CR.chars
        , LF.chars
        , Control.chars
        , Extend.chars
        , RegionalIndicator.chars
        , Prepend.chars
        , SpacingMark.chars
        , L.chars
        , V.chars
        , T.chars
        , LV.chars
        , LVT.chars
        , ExtendedPictographic.chars
        , ZWJ.chars
        ]


sequence : Parser ()
sequence =
    -- [ cr
    -- , lf
    -- , Control.parser
    -- , extend
    -- , regionalIndicator
    -- , prepend
    -- , spacingMark
    -- , l
    -- , v
    -- , t
    -- , lv
    -- , lvt
    -- , extendedPictographic
    -- , zwj
    -- , other
    -- ]
    Parser.andThen
        (\charString ->
            case
                charString
                    |> Data.stringToChar
                    |> Maybe.andThen (\char -> RangeDict.get char classes)
            of
                Just CR ->
                    -- only non-breaking CR sequence is CR/LF
                    oneOfOrBreak [ LF.parser ]

                Just LF ->
                    -- we break after LF characters no matter what, and we've
                    -- already chomped it, so we don't need to do anything here!
                    Parser.succeed ()

                Just Control ->
                    -- control characters break no matter what, and we've
                    -- already chomped it, so we don't need to do anything here!
                    Parser.succeed ()

                Just Extend ->
                    extendFollowing

                Just RegionalIndicator ->
                    regionalIndicatorFollowing

                Just Prepend ->
                    prependFollowing

                Just SpacingMark ->
                    spacingMarkFollowing

                Just L ->
                    lFollowing

                Just V ->
                    vFollowing

                Just T ->
                    tFollowing

                Just LV ->
                    lvFollowing

                Just LVT ->
                    lvtFollowing

                Just ExtendedPictographic ->
                    extendedPictographicFollowing

                Just ZWJ ->
                    zwjFollowing

                Nothing ->
                    oneOfOrBreak [ extendSpacingMarkZWJ ]
        )
        (Parser.getChompedString (Parser.chompIf (\_ -> True)))


extend : Parser ()
extend =
    Extend.parser |. extendFollowing


extendFollowing : Parser ()
extendFollowing =
    oneOfOrBreak [ extendSpacingMarkZWJ ]


regionalIndicator : Parser ()
regionalIndicator =
    RegionalIndicator.parser |. regionalIndicatorFollowing


regionalIndicatorFollowing : Parser ()
regionalIndicatorFollowing =
    oneOfOrBreak
        [ RegionalIndicator.parser
            |. oneOfOrBreak [ zwj ]
        , extendSpacingMarkZWJ
        ]


prepend : Parser ()
prepend =
    Prepend.parser |. prependFollowing


prependFollowing : Parser ()
prependFollowing =
    oneOfOrBreak
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
    SpacingMark.parser |. spacingMarkFollowing


spacingMarkFollowing : Parser ()
spacingMarkFollowing =
    oneOfOrBreak [ extendSpacingMarkZWJ ]


l : Parser ()
l =
    L.parser |. lFollowing


lFollowing : Parser ()
lFollowing =
    oneOfOrBreak
        [ lazy (\_ -> l)
        , v
        , lv
        , lvt
        , extendSpacingMarkZWJ
        ]


v : Parser ()
v =
    V.parser |. vFollowing


vFollowing : Parser ()
vFollowing =
    oneOfOrBreak
        [ lazy (\_ -> v)
        , t
        , extendSpacingMarkZWJ
        ]


t : Parser ()
t =
    T.parser |. tFollowing


tFollowing : Parser ()
tFollowing =
    oneOfOrBreak
        [ lazy (\_ -> t)
        , extendSpacingMarkZWJ
        ]


lv : Parser ()
lv =
    LV.parser |. lvFollowing


lvFollowing : Parser ()
lvFollowing =
    oneOfOrBreak
        [ v
        , t
        , extendSpacingMarkZWJ
        ]


lvt : Parser ()
lvt =
    LVT.parser |. lvtFollowing


lvtFollowing : Parser ()
lvtFollowing =
    oneOfOrBreak
        [ t
        , extendSpacingMarkZWJ
        ]


extendedPictographic : Parser ()
extendedPictographic =
    ExtendedPictographic.parser |. extendedPictographicFollowing


extendedPictographicFollowing : Parser ()
extendedPictographicFollowing =
    oneOfOrBreak
        [ zeroOrMore Extend.parser
            |. ZWJ.parser
            |. lazy (\_ -> extendedPictographic)
            |> backtrackable
        , extendSpacingMarkZWJ
        ]


zwj : Parser ()
zwj =
    ZWJ.parser |. zwjFollowing


zwjFollowing : Parser ()
zwjFollowing =
    oneOfOrBreak [ extendSpacingMarkZWJ ]


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
