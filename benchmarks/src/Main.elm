module Main exposing (main)

import Benchmark exposing (..)
import Benchmark.Runner exposing (BenchmarkProgram, program)
import String.Segmentation as Segmentation


main : BenchmarkProgram
main =
    program <|
        Benchmark.describe "unicode segmentation"
            [ benchmark "hangul"
                (\_ -> Segmentation.graphemes "당신이 키라라의 훌륭함을 잘 모르겠다면 문제는 당신에게 있다")
            ]
