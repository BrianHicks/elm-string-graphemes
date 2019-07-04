module String.Graphemes exposing
    ( isEmpty, length, reverse, repeat, replace
    , append, concat, split, join, words, lines
    , slice, left, right, dropLeft, dropRight
    , contains, startsWith, endsWith, indexes, indices
    , toInt, fromInt
    , toFloat, fromFloat
    , fromChar, cons, uncons
    , toList, fromList
    , toUpper, toLower, pad, padLeft, padRight, trim, trimLeft, trimRight
    , map, filter, foldl, foldr, any, all
    )

{-| A built-in representation for efficient string manipulation. String literals
are enclosed in `"double quotes"`. Strings are _not_ lists of characters.


# Strings

@docs String, isEmpty, length, reverse, repeat, replace


# Building and Splitting

@docs append, concat, split, join, words, lines


# Get Substrings

@docs slice, left, right, dropLeft, dropRight


# Check for Substrings

@docs contains, startsWith, endsWith, indexes, indices


# Int Conversions

@docs toInt, fromInt


# Float Conversions

@docs toFloat, fromFloat


# Char Conversions

@docs fromChar, cons, uncons


# List Conversions

@docs toList, fromList


# Formatting

Cosmetic operations such as padding with extra characters or trimming whitespace.

@docs toUpper, toLower, pad, padLeft, padRight, trim, trimLeft, trimRight


# Higher-Order Functions

@docs map, filter, foldl, foldr, any, all

-}

import Array
import String.Graphemes.Parser as Parser



-- STRINGS


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
    toList >> List.reverse >> concat


{-| Repeat a string _n_ times.

    repeat 3 "ha" --> "hahaha"

-}
repeat : Int -> String -> String
repeat =
    String.repeat


{-| Replace all occurrences of some substring.

    replace "." "-" "Json.Decode.succeed" --> "Json-Decode-succeed"

    replace "," "/" "a,b,c,d,e" --> "a/b/c/d/e"

**Note:** If you need more advanced replacements, check out the
[`elm/parser`][parser] or [`elm/regex`][regex] package.

[parser]: /packages/elm/parser/latest
[regex]: /packages/elm/regex/latest

-}
replace : String -> String -> String -> String
replace =
    String.replace



-- BUILDING AND SPLITTING


{-| Append two strings. You can also use [the `(++)` operator](Basics#++)
to do this.

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

    split "," "cat,dog,cow" --> [ "cat", "dog", "cow" ]

    split "/" "home/evan/Desktop/" --> [ "home", "evan", "Desktop", "" ]

**Note:** this will split a string very literally—including breaking grapheme
boundaries. If this causes problems for you, please open an issue.

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


{-| Break a string into words, splitting on chunks of whitespace.

    words "How are \t you? \n Good?" --> [ "How", "are", "you?", "Good?" ]

-}
words : String -> List String
words =
    String.words


{-| Break a string into lines, splitting on newlines.

    lines "How are you?\nGood?" --> [ "How are you?", "Good?" ]

-}
lines : String -> List String
lines =
    String.lines



-- SUBSTRINGS


{-| Take a substring given a start and end index. Negative indexes
are taken starting from the _end_ of the list.

    slice 7 9 "snakes on a plane!" --> "on"

    slice 0 6 "snakes on a plane!" --> "snakes"

    slice 0 -7 "snakes on a plane!" --> "snakes on a"

    slice -6 -1 "snakes on a plane!" --> "plane"

-}
slice : Int -> Int -> String -> String
slice start end string =
    -- TODO: this is probably terribly slow. Once the conversion to graphemes is
    -- all done, it should be made faster.
    string
        |> toList
        |> Array.fromList
        |> Array.slice start end
        |> Array.toList
        |> concat


{-| Take _n_ characters from the left side of a string.

    left 2 "Mulder" --> "Mu"

-}
left : Int -> String -> String
left =
    String.left


{-| Take _n_ characters from the right side of a string.

    right 2 "Scully" --> "ly"

-}
right : Int -> String -> String
right =
    String.right


{-| Drop _n_ characters from the left side of a string.

    dropLeft 2 "The Lone Gunmen" --> "e Lone Gunmen"

-}
dropLeft : Int -> String -> String
dropLeft =
    String.dropLeft


{-| Drop _n_ characters from the right side of a string.

    dropRight 2 "Cigarette Smoking Man" --> "Cigarette Smoking M"

-}
dropRight : Int -> String -> String
dropRight =
    String.dropRight



-- DETECT SUBSTRINGS


{-| See if the second string contains the first one.

    contains "the" "theory" --> True

    contains "hat" "theory" --> False

    contains "THE" "theory" --> False

-}
contains : String -> String -> Bool
contains =
    String.contains


{-| See if the second string starts with the first one.

    startsWith "the" "theory" --> True

    startsWith "ory" "theory" --> False

-}
startsWith : String -> String -> Bool
startsWith =
    String.startsWith


{-| See if the second string ends with the first one.

    endsWith "the" "theory" --> False

    endsWith "ory" "theory" --> True

-}
endsWith : String -> String -> Bool
endsWith =
    String.endsWith


{-| Get all of the indexes for a substring in another string.

    indexes "i" "Mississippi" --> [ 1, 4, 7, 10 ]

    indexes "ss" "Mississippi" --> [ 2, 5 ]

    indexes "needle" "haystack" --> []

-}
indexes : String -> String -> List Int
indexes =
    String.indexes


{-| Alias for `indexes`.
-}
indices : String -> String -> List Int
indices =
    String.indexes



-- FORMATTING


{-| Convert a string to all upper case. Useful for case-insensitive comparisons
and VIRTUAL YELLING.

    toUpper "skinner" --> "SKINNER"

-}
toUpper : String -> String
toUpper =
    String.toUpper


{-| Convert a string to all lower case. Useful for case-insensitive comparisons.

    toLower "X-FILES" --> "x-files"

-}
toLower : String -> String
toLower =
    String.toLower


{-| Pad a string on both sides until it has a given length.

    pad 5 ' ' "1" --> "  1  "

    pad 5 ' ' "11" --> "  11 "

    pad 5 ' ' "121" --> " 121 "

-}
pad : Int -> Char -> String -> String
pad =
    String.pad


{-| Pad a string on the left until it has a given length.

    padLeft 5 '.' "1" --> "....1"

    padLeft 5 '.' "11" --> "...11"

    padLeft 5 '.' "121" --> "..121"

-}
padLeft : Int -> Char -> String -> String
padLeft =
    String.padLeft


{-| Pad a string on the right until it has a given length.

    padRight 5 '.' "1" --> "1...."

    padRight 5 '.' "11" --> "11..."

    padRight 5 '.' "121" --> "121.."

-}
padRight : Int -> Char -> String -> String
padRight =
    String.padRight


{-| Get rid of whitespace on both sides of a string.

    trim "  hats  \n" --> "hats"

-}
trim : String -> String
trim =
    String.trim


{-| Get rid of whitespace on the left of a string.

    trimLeft "  hats  \n" --> "hats  \n"

-}
trimLeft : String -> String
trimLeft =
    String.trimLeft


{-| Get rid of whitespace on the right of a string.

    trimRight "  hats  \n" --> "  hats"

-}
trimRight : String -> String
trimRight =
    String.trimRight



-- INT CONVERSIONS


{-| Try to convert a string into an int, failing on improperly formatted strings.

    String.toInt "123" --> Just 123

    String.toInt "-42" --> Just -42

    String.toInt "3.1" --> Nothing

    String.toInt "31a" --> Nothing

If you are extracting a number from some raw user input, you will typically
want to use [`Maybe.withDefault`](Maybe#withDefault) to handle bad data:

    Maybe.withDefault 0 (String.toInt "42") --> 42

    Maybe.withDefault 0 (String.toInt "ab") --> 0

-}
toInt : String -> Maybe Int
toInt =
    String.toInt


{-| Convert an `Int` to a `String`.

    String.fromInt 123 --> "123"

    String.fromInt -42 --> "-42"

Check out [`Debug.toString`](Debug#toString) to convert _any_ value to a string
for debugging purposes.

-}
fromInt : Int -> String
fromInt =
    String.fromInt



-- FLOAT CONVERSIONS


{-| Try to convert a string into a float, failing on improperly formatted strings.
-}
toFloat : String -> Maybe Float
toFloat =
    String.toFloat


{-| Convert a `Float` to a `String`.

    String.fromFloat 123 --> "123"

    String.fromFloat -42 --> "-42"

    String.fromFloat 3.9 --> "3.9"

Check out [`Debug.toString`](Debug#toString) to convert _any_ value to a string
for debugging purposes.

-}
fromFloat : Float -> String
fromFloat =
    String.fromFloat



-- LIST CONVERSIONS


{-| Convert a string to a list of characters.

    toList "abc" --> [ "a", "b", "c" ]

    toList "🙈🙉🙊" --> [ "🙈", "🙉", "🙊" ]

-}
toList : String -> List String
toList =
    foldr (::) []


{-| Convert a list of graphemes into a String. Can be useful if you
want to create a string primarily by consing, perhaps for decoding
something.

    fromList [ "a", "b", "c" ] --> "abc"

    fromList [ "🙈", "🙉", "🙊" ] --> "🙈🙉🙊"

-}
fromList : List String -> String
fromList =
    concat



-- CHAR CONVERSIONS


{-| Create a string from a given character.

    fromChar 'a' --> "a"

-}
fromChar : Char -> String
fromChar =
    String.fromChar


{-| Add a character to the beginning of a string.

    cons 'T' "he truth is out there" --> "The truth is out there"

-}
cons : Char -> String -> String
cons =
    String.cons


{-| Split a non-empty string into its head and tail. This lets you
pattern match on strings exactly as you would with lists.

    uncons "abc" --> Just ( 'a', "bc" )

    uncons "" --> Nothing

-}
uncons : String -> Maybe ( Char, String )
uncons =
    String.uncons



-- HIGHER-ORDER FUNCTIONS


{-| Transform every grapheme in a string
-}
map : (String -> String) -> String -> String
map mapper string =
    string
        |> foldr (\grapheme acc -> mapper grapheme :: acc) []
        |> String.concat


{-| Keep only the graphemes that pass the test.

    filter (String.all Char.isDigit) "R2-D2" --> "22"

-}
filter : (String -> Bool) -> String -> String
filter test string =
    string
        |> foldr
            (\grapheme acc ->
                if test grapheme then
                    grapheme :: acc

                else
                    acc
            )
            []
        |> String.concat


{-| Reduce a string from the left.

    foldl (++) "" "time" --> "emit"

-}
foldl : (String -> b -> b) -> b -> String -> b
foldl =
    Parser.foldl


{-| Reduce a string from the right.

    foldr (++) "" "time" --> "time"

-}
foldr : (String -> b -> b) -> b -> String -> b
foldr fn state string =
    string
        |> foldl (::) []
        |> List.foldl fn state


{-| Determine whether _any_ graphemes pass the test.

    any (String.all Char.isDigit) "90210" --> True

    any (String.all Char.isDigit) "R2-D2" --> True

    any (String.all Char.isDigit) "heart" --> False

-}
any : (String -> Bool) -> String -> Bool
any test string =
    foldl (\grapheme acc -> acc || test grapheme) False string


{-| Determine whether _all_ graphemes pass the test.

    all (String.all Char.isDigit) "90210" --> True

    all (String.all Char.isDigit) "R2-D2" --> False

    all (String.all Char.isDigit) "heart" --> False

-}
all : (String -> Bool) -> String -> Bool
all test string =
    foldl (\grapheme acc -> acc && test grapheme) True string
