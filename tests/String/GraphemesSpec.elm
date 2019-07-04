module String.GraphemesSpec exposing (compatibilitySpec)

import Expect
import Fuzz exposing (Fuzzer, int, list, string)
import String.Graphemes as Graphemes
import Test exposing (..)


compatibilitySpec : Test
compatibilitySpec =
    describe "compatibility with elm/core String"
        [ fuzz simpleString "isEmpty" <|
            \s ->
                Expect.equal
                    (String.isEmpty s)
                    (Graphemes.isEmpty s)
        , fuzz simpleString "length" <|
            \s ->
                Expect.equal
                    (String.length s)
                    (Graphemes.length s)
        , fuzz simpleString "reverse" <|
            \s ->
                Expect.equal
                    (String.reverse s)
                    (Graphemes.reverse s)
        , fuzz2 (Fuzz.intRange -100 100) simpleString "repeat" <|
            \i s ->
                Expect.equal
                    (String.repeat i s)
                    (Graphemes.repeat i s)
        , fuzz3 simpleString simpleString simpleString "replace" <|
            \from to source ->
                Expect.equal
                    (String.replace from to source)
                    (Graphemes.replace from to source)
        , fuzz2 simpleString simpleString "append" <|
            \a b ->
                Expect.equal
                    (String.append a b)
                    (Graphemes.append a b)
        , fuzz (list simpleString) "concat" <|
            \strings ->
                Expect.equal
                    (String.concat strings)
                    (Graphemes.concat strings)
        , fuzz2 simpleString simpleString "split" <|
            \a b ->
                Expect.equal
                    (String.split a b)
                    (Graphemes.split a b)
        , fuzz2 simpleString (list simpleString) "join" <|
            \joiner strings ->
                Expect.equal
                    (String.join joiner strings)
                    (Graphemes.join joiner strings)
        , fuzz (Fuzz.map String.concat (list simpleString)) "words" <|
            \strings ->
                Expect.equal
                    (String.words strings)
                    (Graphemes.words strings)
        , fuzz (Fuzz.map (String.join "\n") (list simpleString)) "lines" <|
            \strings ->
                Expect.equal
                    (String.lines strings)
                    (Graphemes.lines strings)
        , fuzz3 int int simpleString "slice" <|
            \a b string ->
                Expect.equal
                    (String.slice a b string)
                    (Graphemes.slice a b string)
        , fuzz2 int simpleString "left" <|
            \offset string ->
                Expect.equal
                    (String.left offset string)
                    (Graphemes.left offset string)
        , fuzz2 int simpleString "right" <|
            \offset string ->
                Expect.equal
                    (String.right offset string)
                    (Graphemes.right offset string)

        -- , todo "dropLeft"
        -- , todo "dropRight"
        -- , todo "contains"
        -- , todo "startsWith"
        -- , todo "endsWith"
        -- , todo "indexes"
        -- , todo "indices"
        -- , todo "toUpper"
        -- , todo "toLower"
        -- , todo "padLeft"
        -- , todo "padRight"
        -- , todo "trim"
        -- , todo "trimLeft"
        -- , todo "trimRight"
        -- , todo "toInt"
        -- , todo "fromInt"
        -- , todo "toFloat"
        -- , todo "fromFloat"
        -- , todo "toList"
        -- , todo "fromList"
        -- , todo "fromChar"
        -- , todo "cons"
        -- , todo "uncons"
        -- , todo "map"
        -- , todo "filter"
        -- , todo "foldl"
        -- , todo "foldr"
        -- , todo "any"
        -- , todo "all"
        ]


simpleString : Fuzzer String
simpleString =
    Fuzz.intRange (Char.toCode 'A') (Char.toCode 'Z')
        |> Fuzz.map (Char.fromCode >> String.fromChar)
