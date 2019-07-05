module String.GraphemesSpec exposing (spec)

import Array
import Expect
import Fuzz exposing (Fuzzer, float, int, list, string)
import String.Graphemes as Graphemes
import Test exposing (..)


spec : Test
spec =
    describe "String.Graphemes"
        [ describe "compatibility with elm/core String"
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
            , fuzz2 int simpleString "dropLeft" <|
                \offset string ->
                    Expect.equal
                        (String.dropLeft offset string)
                        (Graphemes.dropLeft offset string)
            , fuzz2 int simpleString "dropRight" <|
                \offset string ->
                    Expect.equal
                        (String.dropRight offset string)
                        (Graphemes.dropRight offset string)
            , fuzz2 simpleString simpleString "contains" <|
                \a b ->
                    Expect.equal
                        (String.contains a b)
                        (Graphemes.contains a b)
            , fuzz2 simpleString simpleString "startsWith" <|
                \a b ->
                    Expect.equal
                        (String.startsWith a b)
                        (Graphemes.startsWith a b)
            , fuzz2 simpleString simpleString "endsWith" <|
                \a b ->
                    Expect.equal
                        (String.endsWith a b)
                        (Graphemes.endsWith a b)
            , fuzz2 simpleString simpleString "indexes" <|
                \a b ->
                    Expect.equal
                        (String.indexes a b)
                        (Graphemes.indexes a b)
            , fuzz2 simpleString simpleString "indices" <|
                \a b ->
                    Expect.equal
                        (String.indices a b)
                        (Graphemes.indices a b)
            , fuzz simpleString "toUpper" <|
                \string ->
                    Expect.equal
                        (String.toUpper string)
                        (Graphemes.toUpper string)
            , fuzz simpleString "toLower" <|
                \string ->
                    Expect.equal
                        (String.toLower string)
                        (Graphemes.toLower string)
            , fuzz3 (Fuzz.intRange 0 1000) simpleChar simpleString "pad" <|
                \howMuch what string ->
                    Expect.equal
                        (String.pad howMuch what string)
                        (Graphemes.pad howMuch what string)
            , fuzz3 (Fuzz.intRange 0 1000) simpleChar simpleString "padLeft" <|
                \howMuch what string ->
                    Expect.equal
                        (String.padLeft howMuch what string)
                        (Graphemes.padLeft howMuch what string)
            , fuzz3 (Fuzz.intRange 0 1000) simpleChar simpleString "padRight" <|
                \howMuch what string ->
                    Expect.equal
                        (String.padRight howMuch what string)
                        (Graphemes.padRight howMuch what string)
            , fuzz simpleString "trim" <|
                \string ->
                    Expect.equal
                        (String.trim string)
                        (Graphemes.trim string)
            , fuzz simpleString "trimLeft" <|
                \string ->
                    Expect.equal
                        (String.trimLeft string)
                        (Graphemes.trimLeft string)
            , fuzz simpleString "trimRight" <|
                \string ->
                    Expect.equal
                        (String.trimRight string)
                        (Graphemes.trimRight string)
            , fuzz simpleString "toInt" <|
                \string ->
                    Expect.equal
                        (String.toInt string)
                        (Graphemes.toInt string)
            , fuzz int "fromInt" <|
                \i ->
                    Expect.equal
                        (String.fromInt i)
                        (Graphemes.fromInt i)
            , fuzz simpleString "toFloat" <|
                \string ->
                    Expect.equal
                        (String.toFloat string)
                        (Graphemes.toFloat string)
            , fuzz float "fromFloat" <|
                \i ->
                    Expect.equal
                        (String.fromFloat i)
                        (Graphemes.fromFloat i)
            , fuzz string "toList" <|
                \string ->
                    Expect.equal
                        (String.toList string |> List.map String.fromChar)
                        (Graphemes.toList string)
            , fuzz (list simpleChar) "fromList" <|
                \chars ->
                    Expect.equal
                        (String.fromList chars)
                        (chars |> List.map String.fromChar |> Graphemes.fromList)
            , fuzz simpleChar "fromChar" <|
                \char ->
                    Expect.equal
                        (String.fromChar char)
                        (Graphemes.fromChar char)
            , fuzz2 simpleChar simpleString "cons" <|
                \char string ->
                    Expect.equal
                        (String.cons char string)
                        (Graphemes.cons char string)
            , fuzz simpleString "uncons" <|
                \string ->
                    Expect.equal
                        (String.uncons string)
                        (Graphemes.uncons string)
            , fuzz simpleString "map" <|
                \string ->
                    Expect.equal
                        (String.map (always 'a') string)
                        (Graphemes.map (always "a") string)
            , fuzz simpleString "filter" <|
                \string ->
                    Expect.equal
                        (String.filter ((/=) '!') string)
                        (Graphemes.filter ((/=) "!") string)
            , fuzz simpleString "foldl" <|
                \string ->
                    Expect.equal
                        (String.foldl String.cons "" string)
                        (Graphemes.foldl (++) "" string)
            , fuzz simpleString "foldr" <|
                \string ->
                    Expect.equal
                        (String.foldr String.cons "" string)
                        (Graphemes.foldr (++) "" string)
            , fuzz simpleString "any" <|
                \string ->
                    Expect.equal
                        (String.any Char.isDigit string)
                        (Graphemes.any (String.any Char.isDigit) string)
            , fuzz simpleString "all" <|
                \string ->
                    Expect.equal
                        (String.all Char.isDigit string)
                        (Graphemes.all (String.all Char.isDigit) string)
            ]
        , fuzz graphemesFuzzer "length produces the graphemes length" <|
            \graphemes ->
                graphemes
                    |> String.concat
                    |> Graphemes.length
                    |> Expect.equal (List.length graphemes)
        , fuzz graphemesFuzzer "reverse respects graphemes" <|
            \graphemes ->
                graphemes
                    |> String.concat
                    |> Graphemes.reverse
                    |> Expect.equal (String.concat (List.reverse graphemes))
        , describe "slice" <|
            let
                flags =
                    "🇨🇦🇺🇸🇲🇽"
            in
            [ test "selecting a part from the front" <|
                \_ ->
                    flags
                        |> Graphemes.slice 0 2
                        |> Expect.equal "🇨🇦🇺🇸"
            , test "selecting a part from the back" <|
                \_ ->
                    flags
                        |> Graphemes.slice -2 3
                        |> Expect.equal "🇺🇸🇲🇽"
            , test "selecting a part in the middle" <|
                \_ ->
                    flags
                        |> Graphemes.slice 1 2
                        |> Expect.equal "🇺🇸"
            ]
        , fuzz2 int graphemesFuzzer "left" <|
            \n graphemes ->
                graphemes
                    |> String.concat
                    |> Graphemes.left n
                    |> Expect.equal (String.concat (List.take n graphemes))
        , fuzz2 int graphemesFuzzer "right" <|
            \n graphemes ->
                graphemes
                    |> String.concat
                    |> Graphemes.right n
                    |> Expect.equal (String.concat (List.drop (List.length graphemes - n) graphemes))
        , fuzz2 int graphemesFuzzer "dropLeft" <|
            \n graphemes ->
                graphemes
                    |> String.concat
                    |> Graphemes.dropLeft n
                    |> Expect.equal (String.concat (List.drop n graphemes))
        , fuzz2 int graphemesFuzzer "dropRight" <|
            \n graphemes ->
                graphemes
                    |> String.concat
                    |> Graphemes.dropRight n
                    |> Expect.equal (String.concat (List.take (List.length graphemes - n) graphemes))
        ]


simpleChar : Fuzzer Char
simpleChar =
    Fuzz.intRange (Char.toCode '!') (Char.toCode 'Z')
        |> Fuzz.map Char.fromCode


simpleString : Fuzzer String
simpleString =
    Fuzz.map String.fromList (list simpleChar)


flag : Fuzzer String
flag =
    let
        regionalIndicator =
            Fuzz.intRange (Char.toCode '🇦') (Char.toCode '🇿')
                |> Fuzz.map Char.fromCode
                |> Fuzz.map String.fromChar
    in
    Fuzz.map2 (++) regionalIndicator regionalIndicator


graphemesFuzzer : Fuzzer (List String)
graphemesFuzzer =
    list
        (Fuzz.oneOf
            [ flag
            , Fuzz.map String.fromChar simpleChar
            ]
        )
