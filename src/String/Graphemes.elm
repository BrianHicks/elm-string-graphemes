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

import String.Graphemes.Parser as Parser


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
foldl =
    Parser.foldl
