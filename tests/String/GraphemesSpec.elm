module String.GraphemesSpec exposing (compatibilitySpec)

import Expect
import Fuzz exposing (list, string)
import String.Graphemes as Graphemes
import Test exposing (..)


compatibilitySpec : Test
compatibilitySpec =
    -- TODO: some of these may be slightly flakey if the fuzzer ever manages to
    -- create a valid multi-byte sequence. Probably should test for that
    -- explicitly or guard against it.
    describe "compatibility with elm/core String"
        [ fuzz string "isEmpty" <|
            \s ->
                Expect.equal
                    (String.isEmpty s)
                    (Graphemes.isEmpty s)
        , fuzz string "length" <|
            \s ->
                Expect.equal
                    (String.length s)
                    (Graphemes.length s)
        , fuzz string "reverse" <|
            \s ->
                Expect.equal
                    (String.reverse s)
                    (Graphemes.reverse s)
        , fuzz2 (Fuzz.intRange -100 100) string "repeat" <|
            \i s ->
                Expect.equal
                    (String.repeat i s)
                    (Graphemes.repeat i s)
        , fuzz3 string string string "replace" <|
            \from to source ->
                Expect.equal
                    (String.replace from to source)
                    (Graphemes.replace from to source)
        , fuzz2 string string "append" <|
            \a b ->
                Expect.equal
                    (String.append a b)
                    (Graphemes.append a b)
        , fuzz (list string) "concat" <|
            \strings ->
                Expect.equal
                    (String.concat strings)
                    (Graphemes.concat strings)
        , fuzz2 string string "split" <|
            \a b ->
                Expect.equal
                    (String.split a b)
                    (Graphemes.split a b)
        , fuzz2 string (list string) "join" <|
            \joiner strings ->
                Expect.equal
                    (String.join joiner strings)
                    (Graphemes.join joiner strings)
        ]
