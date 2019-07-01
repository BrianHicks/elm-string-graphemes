module String.Graphemes.RangeSet.RangeSpec exposing (compareSpec)

import Expect
import Fuzz exposing (Fuzzer)
import String.Graphemes.RangeSet.Range as Range exposing (..)
import Test exposing (..)


compareSpec : Test
compareSpec =
    describe "compare"
        [ describe "LTs"
            [ fuzz Fuzz.int "point / range" <|
                \i ->
                    Range.compare (point (i - 1)) (range i (i + 1))
                        |> Expect.equal Range.LT
            , fuzz Fuzz.int "range / point " <|
                \i ->
                    Range.compare (range (i - 1) i) (point (i + 1))
                        |> Expect.equal Range.LT
            , fuzz Fuzz.int "range / range" <|
                \i ->
                    Range.compare (range (i - 2) (i - 1)) (range i (i + 1))
                        |> Expect.equal Range.LT
            , fuzz Fuzz.int "point / point" <|
                \i ->
                    Range.compare (point (i - 1)) (point i)
                        |> Expect.equal Range.LT
            ]
        , describe "GTs"
            [ fuzz Fuzz.int "point / range" <|
                \i ->
                    Range.compare (point (i + 1)) (range (i - 1) i)
                        |> Expect.equal Range.GT
            , fuzz Fuzz.int "range / point" <|
                \i ->
                    Range.compare (range i (i + 1)) (point (i - 1))
                        |> Expect.equal Range.GT
            , fuzz Fuzz.int "range / range" <|
                \i ->
                    Range.compare (range i (i + 1)) (range (i - 2) (i - 1))
                        |> Expect.equal Range.GT
            , fuzz Fuzz.int "point / point" <|
                \i ->
                    Range.compare (point i) (point (i - 1))
                        |> Expect.equal Range.GT
            ]
        , describe "EQs"
            [ fuzz Fuzz.int "point / range" <|
                \i ->
                    Range.compare (point i) (range i (i + 1))
                        |> Expect.notEqual Range.EQ
            , fuzz Fuzz.int "range / point" <|
                \i ->
                    Range.compare (range i (i + 1)) (point i)
                        |> Expect.notEqual Range.EQ
            , fuzz Fuzz.int "point / point" <|
                \i ->
                    Range.compare (point i) (point i)
                        |> Expect.equal Range.EQ
            , fuzz2 Fuzz.int Fuzz.int "range / range" <|
                \i j ->
                    Range.compare (range i j) (range i j)
                        |> Expect.equal Range.EQ
            ]
        , describe "overlapping"
            [ fuzz2 Fuzz.int Fuzz.int "point / point" <|
                \i j ->
                    Range.compare (point i) (point j)
                        |> Expect.notEqual Range.Overlapping
            , fuzz Fuzz.int "point / range" <|
                \i ->
                    Range.compare (point i) (range (i - 1) (i + 1))
                        |> Expect.equal Range.Overlapping
            , fuzz Fuzz.int "range / point" <|
                \i ->
                    Range.compare (range (i - 1) (i + 1)) (point i)
                        |> Expect.equal Range.Overlapping
            , fuzz Fuzz.int "range / range" <|
                \i ->
                    Range.compare (range (i - 1) i) (range i (i + 1))
                        |> Expect.equal Range.Overlapping
            ]
        ]
