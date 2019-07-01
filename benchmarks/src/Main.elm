module Main exposing (main)

import Benchmark exposing (..)
import Benchmark.Runner exposing (BenchmarkProgram, program)
import String.Graphemes as Segmentation


main : BenchmarkProgram
main =
    program <|
        Benchmark.describe "unicode segmentation"
            [ benchmark "plain text"
                (\_ -> Segmentation.graphemes "123456")
            , benchmark "emoji"
                (\_ -> Segmentation.graphemes "\u{1F9B8}\u{1F3FD}\u{200D}♂️")
            ]
