module String.Graphemes.Data exposing (Class(..), parser)

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


type ParserState
    = Error String
    | Empty
    | One
    | Two (Maybe Char)


parser : Class -> String -> Result String (RangeDict Char Class)
parser value source =
    case String.foldl (handleChar value) ( Empty, RangeDict.empty ) source of
        ( Empty, out ) ->
            Ok out

        ( Error err, _ ) ->
            Err err

        ( One, _ ) ->
            Err "ended with an empty One"

        ( Two _, _ ) ->
            Err "ended with an empty Two"


handleChar : Class -> Char -> ( ParserState, RangeDict Char Class ) -> ( ParserState, RangeDict Char Class )
handleChar value char ( parserState, rangeDict ) =
    case ( parserState, char ) of
        ( Error _, _ ) ->
            ( parserState, rangeDict )

        ( Empty, '1' ) ->
            ( One, rangeDict )

        ( Empty, '2' ) ->
            ( Two Nothing, rangeDict )

        ( Empty, _ ) ->
            ( Error "expected to see a parsing directive like '1' or '2'", rangeDict )

        ( One, _ ) ->
            ( Empty, RangeDict.insert (Range.point char) value rangeDict )

        ( Two Nothing, _ ) ->
            ( Two (Just char), rangeDict )

        ( Two (Just low), _ ) ->
            ( Empty, RangeDict.insert (Range.range low char) value rangeDict )
