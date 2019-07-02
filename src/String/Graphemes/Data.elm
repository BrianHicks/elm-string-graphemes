module String.Graphemes.Data exposing (parser)

import Parser exposing (..)
import String.Graphemes.RangeDict as RangeDict exposing (RangeDict)
import String.Graphemes.RangeDict.Range as Range


parser : Parser (RangeDict Char)
parser =
    loop RangeDict.empty looper


looper : RangeDict Char -> Parser (Step (RangeDict Char) (RangeDict Char))
looper rangeSet =
    oneOf
        [ Parser.succeed identity
            |. token "1"
            |= getChompedString (chompIf (\_ -> True))
            |> andThen
                (stringToChar
                    >> Maybe.map Range.point
                    >> Maybe.map (\point -> RangeDict.insert point rangeSet)
                    >> Maybe.map Loop
                    >> Maybe.map Parser.succeed
                    >> Maybe.withDefault (Parser.problem "got a nothing for a point parser")
                )
        , Parser.succeed Tuple.pair
            |. token "2"
            |= getChompedString (chompIf (\_ -> True))
            |= getChompedString (chompIf (\_ -> True))
            |> andThen
                (\( low, high ) ->
                    Maybe.map2 Range.range
                        (stringToChar low)
                        (stringToChar high)
                        |> Maybe.map (\range -> RangeDict.insert range rangeSet)
                        |> Maybe.map Loop
                        |> Maybe.map Parser.succeed
                        |> Maybe.withDefault (Parser.problem "get a nothing for a pair parser")
                )
        , Parser.succeed (Done rangeSet)
            |. end
        ]


stringToChar : String -> Maybe Char
stringToChar string =
    case String.toList string of
        [ c ] ->
            Just c

        _ ->
            Nothing
