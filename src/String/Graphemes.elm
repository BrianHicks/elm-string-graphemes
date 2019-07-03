module String.Graphemes exposing
    ( isEmpty, length, reverse, repeat, replace
    , append, concat, split, join
    , toList
    )

{-| The goal of this API is to recreate `elm/core`'s `String` module as
faithfully as possible, but to operate on grapheme boundaries instead of bytes
or characters. This can smooth out some edge cases when processing user-entered
text: emoji, for example, will not be split awkwardly. Basically, if you're
dealing with text that the user sees, work at the grapheme level. See the
package README for more information on motivation.

@docs isEmpty, length, reverse, repeat, replace


# Building and Splitting

@docs append, concat, split, join


# List Conversions

@docs toList

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

    length "🇨🇦" --> 1

-}
length : String -> Int
length =
    foldl (\_ len -> len + 1) 0


{-| Reverse a string.

    reverse "stressed" --> "desserts"

    reverse "🇨🇦🇲🇽" --> "🇲🇽🇨🇦"

-}
reverse : String -> String
reverse =
    foldl (::) [] >> String.join ""


{-| Repeat a string n times.

    repeat 3 "ha" --> "hahaha"

-}
repeat : Int -> String -> String
repeat =
    String.repeat


{-| Replace all occurrences of some substring.

    replace "." "-" "Json.Decode.succeed" --> "Json-Decode-succeed"

    replace "," "/" "a,b,c,d,e" --> "a/b/c/d/e"

**Note:** If you need more advanced replacements, check out the
[elm/parser](https://package.elm-lang.org/packages/elm/parser/latest) or
[elm/regex](https://package.elm-lang.org/packages/elm/regex/latest) package.

**Second note:** you might expect us to do something special with graphemes
here. Nope! This transformation is extremely literal. If you have a use case
where that causes problems, please open an issue.

-}
replace : String -> String -> String -> String
replace =
    String.replace


{-| Append two strings. You can also use [the `(++)`
operator](https://package.elm-lang.org/packages/elm/core/latest/Basics#++) to do
this.

    append "butter" "fly" --> "butterfly"

-}
append : String -> String -> String
append =
    String.append


{-| Concatenate many strings into one.

    concat [ "never", "the", "less" ] --> "nevertheless"

-}
concat : List String -> String
concat =
    String.concat


{-| Split a string using a given separator.

    split "," "cat,dog,cow" --> ["cat","dog","cow"]

    split "/" "home/evan/Desktop/" --> ["home","evan","Desktop", ""]

-}
split : String -> String -> List String
split =
    String.split


{-| Put many strings together with a given separator.

    join "a" [ "H", "w", "ii", "n" ] --> "Hawaiian"

    join " " [ "cat", "dog", "cow" ] --> "cat dog cow"

    join "/" [ "home", "evan", "Desktop" ] --> "home/evan/Desktop"

-}
join : String -> List String -> String
join =
    String.join


{-| Convert a string to a list of characters.

    toList "abc" --> ["a","b","c"]

    toList "🙈🙉🙊" --> ["🙈","🙉","🙊"]

**Note:** this is different from `String`! Graphemes can be more than one
character wide, so we have to return `String`s here instead of `Char`s.

-}
toList : String -> List String
toList =
    foldl (::) [] >> List.reverse


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
foldl : (String -> a -> a) -> a -> String -> a
foldl fn initial input =
    case Parser.run (loop initial (graphemesLoop fn)) input of
        Ok output ->
            output

        Err _ ->
            initial



-- INTERNALS


graphemesLoop : (String -> a -> a) -> a -> Parser (Step a a)
graphemesLoop fn current =
    Parser.oneOf
        [ sequence
            |> Parser.getChompedString
            |> Parser.map (\new -> Loop (fn new current))
        , Parser.map (\_ -> Done current) Parser.end
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
