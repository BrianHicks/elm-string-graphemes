module String.Graphemes.Data exposing (Class(..), parser, stringToChar)

import Parser exposing (..)
import String.Graphemes.RangeDict as RangeDict exposing (RangeDict)
import String.Graphemes.RangeDict.Range as Range


type Class
    = CR
    | LF
    | Control
    | Prepend
    | RegionalIndicator
    | L
    | V
    | T
    | LV
    | LVT
    | ExtendedPictographic
    | Extend
    | SpacingMark
    | ZWJ


parser : Class -> Parser (RangeDict Char Class)
parser value =
    loop RangeDict.empty (looper value)


looper : a -> RangeDict Char a -> Parser (Step (RangeDict Char a) (RangeDict Char a))
looper value rangeSet =
    oneOf
        [ Parser.succeed identity
            |. token "1"
            |= getChompedString (chompIf (\_ -> True))
            |> andThen
                (stringToChar
                    >> Maybe.map Range.point
                    >> Maybe.map (\point -> RangeDict.insert point value rangeSet)
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
                        |> Maybe.map (\range -> RangeDict.insert range value rangeSet)
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
