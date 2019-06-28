module RangeSetFuzzer exposing (fromChars)

import Fuzz exposing (Fuzzer)
import String.Segmentation.RangeSet as RangeSet exposing (RangeSet)
import String.Segmentation.RangeSet.Range as Range


fromChars : RangeSet Char -> Fuzzer String
fromChars chars =
    chars
        |> RangeSet.toList
        |> List.map
            (\range ->
                Fuzz.map
                    (String.fromList << List.singleton << Char.fromCode)
                    (Fuzz.intRange
                        (Char.toCode (Range.lowerBound range))
                        (Char.toCode (Range.upperBound range))
                    )
            )
        |> Fuzz.oneOf
