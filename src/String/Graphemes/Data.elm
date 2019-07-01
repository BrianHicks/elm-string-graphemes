module String.Graphemes.Data exposing (parser)

import Parser exposing (..)
import String.Graphemes.RangeSet as RangeSet exposing (RangeSet)
import String.Graphemes.RangeSet.Range as Range


parser : Parser (RangeSet Char)
parser =
    loop RangeSet.empty looper


looper : RangeSet Char -> Parser (Step (RangeSet Char) (RangeSet Char))
looper rangeSet =
    oneOf
        [ Parser.succeed identity
            |. token "1"
            |= getChompedString (chompIf (\_ -> True))
            |> andThen
                (stringToChar
                    >> Maybe.map Range.point
                    >> Maybe.map (\point -> RangeSet.insert point rangeSet)
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
                        |> Maybe.map (\range -> RangeSet.insert range rangeSet)
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
