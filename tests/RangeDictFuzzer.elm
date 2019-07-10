module RangeDictFuzzer exposing (fromChars)

import Fuzz exposing (Fuzzer)
import String.Graphemes.RangeDict as RangeDict exposing (RangeDict)
import String.Graphemes.RangeDict.Range as Range


fromChars : RangeDict Char a -> Fuzzer String
fromChars chars =
    case ( RangeDict.lowerBound chars, RangeDict.upperBound chars ) of
        ( Just lower, Just upper ) ->
            Fuzz.intRange (Char.toCode lower) (Char.toCode upper)
                |> Fuzz.map Char.fromCode
                |> Fuzz.map
                    (\charMaybeOutOfRange ->
                        if RangeDict.member charMaybeOutOfRange chars then
                            charMaybeOutOfRange

                        else
                            case RangeDict.getClosestRange charMaybeOutOfRange chars of
                                Just range ->
                                    Range.lowerBound range

                                _ ->
                                    lower
                    )
                |> Fuzz.map String.fromChar

        _ ->
            Fuzz.invalid "the provided RangeDict did not have a lower or upper range (was it empty?)"
