module Main exposing (main)

import Benchmark exposing (..)
import Benchmark.Runner exposing (BenchmarkProgram, program)
import Parser
import String.Graphemes as Segmentation


main : BenchmarkProgram
main =
    program <|
        Benchmark.describe "unicode segmentation"
            [ Benchmark.compare "plain text"
                "characters"
                (\_ -> String.toList "123456")
                "graphemes"
                (\_ -> Segmentation.toList "123456")
            , Benchmark.compare "emoji"
                "characters"
                (\_ -> String.toList "\u{1F9B8}\u{1F3FD}\u{200D}♂️")
                "graphemes"
                (\_ -> Segmentation.toList "\u{1F9B8}\u{1F3FD}\u{200D}♂️")
            , Benchmark.compare "foldls"
                "parser"
                (\_ ->
                    Parser.run
                        (Parser.loop []
                            (\state ->
                                Parser.oneOf
                                    [ Parser.map (\_ -> Parser.Done state) Parser.end
                                    , Parser.map (\c -> Parser.Loop (c :: state)) (Parser.getChompedString (Parser.chompIf (\_ -> True)))
                                    ]
                            )
                        )
                        "1234567890"
                )
                "foldl"
                (\_ -> String.foldl (::) [] "1234567890")
            ]
