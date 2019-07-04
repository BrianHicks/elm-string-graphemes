module Main exposing (main)

import Benchmark exposing (..)
import Benchmark.Runner exposing (BenchmarkProgram, program)
import String.Graphemes as Graphemes


main : BenchmarkProgram
main =
    program <|
        Benchmark.describe "unicode segmentation"
            [ Benchmark.compare "plain text"
                "characters"
                (\_ -> String.toList "123456")
                "graphemes"
                (\_ -> Graphemes.toList "123456")
            , Benchmark.compare "emoji"
                "characters"
                (\_ -> String.toList "\u{1F9B8}\u{1F3FD}\u{200D}♂️")
                "graphemes"
                (\_ -> Graphemes.toList "\u{1F9B8}\u{1F3FD}\u{200D}♂️")
            ]
