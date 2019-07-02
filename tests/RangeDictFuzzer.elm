module RangeDictFuzzer exposing (fromChars)

import Fuzz exposing (Fuzzer)
import String.Graphemes.RangeDict as RangeDict exposing (RangeDict)
import String.Graphemes.RangeDict.Range as Range


fromChars : RangeDict Char -> Fuzzer String
fromChars chars =
    chars
        |> RangeDict.toList
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
