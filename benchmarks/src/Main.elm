module Main exposing (main)

import Benchmark exposing (..)
import Benchmark.Runner exposing (BenchmarkProgram, program)
import Parser
import String.Graphemes as Segmentation
import String.Graphemes.Parser as Parser


main : BenchmarkProgram
main =
    program <|
        Benchmark.describe "unicode segmentation"
            [ Benchmark.compare "plain text"
                "characters"
                (\_ -> String.toList "123456")
                "parser"
                (\_ -> Parser.foldl (::) [] "123456" |> List.reverse)
            , Benchmark.compare "emoji"
                "characters"
                (\_ -> String.toList "\u{1F9B8}\u{1F3FD}\u{200D}♂️")
                "parser"
                (\_ -> Parser.foldl (::) [] "\u{1F9B8}\u{1F3FD}\u{200D}♂️" |> List.reverse)
            ]
