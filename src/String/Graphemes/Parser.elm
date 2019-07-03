module String.Graphemes.Parser exposing (foldl)

import String.Graphemes.Data as Data exposing (Class(..))
import String.Graphemes.Data.CR as CR
import String.Graphemes.Data.Control as Control
import String.Graphemes.Data.Extend as Extend
import String.Graphemes.Data.Extended_Pictographic as ExtendedPictographic
import String.Graphemes.Data.L as L
import String.Graphemes.Data.LF as LF
import String.Graphemes.Data.LV as LV
import String.Graphemes.Data.LVT as LVT
import String.Graphemes.Data.Prepend as Prepend
import String.Graphemes.Data.Regional_Indicator as RegionalIndicator
import String.Graphemes.Data.SpacingMark as SpacingMark
import String.Graphemes.Data.T as T
import String.Graphemes.Data.V as V
import String.Graphemes.Data.ZWJ as ZWJ
import String.Graphemes.RangeDict as RangeDict exposing (RangeDict)


foldl : (String -> a -> a) -> a -> String -> a
foldl fn initial string =
    let
        ( trailing, penultimateState ) =
            String.foldl (step fn) ( [], initial ) string
    in
    case trailing of
        [] ->
            penultimateState

        _ ->
            fn (String.fromList (List.reverse trailing)) penultimateState


step : (String -> a -> a) -> Char -> ( List Char, a ) -> ( List Char, a )
step fn char ( chars, state ) =
    case chars of
        [] ->
            ( [ char ], state )

        last :: rest ->
            if shouldBreakBefore last rest char then
                ( [ char ], fn (String.fromList (List.reverse chars)) state )

            else
                ( char :: chars, state )


shouldBreakBefore : Char -> List Char -> Char -> Bool
shouldBreakBefore lastChar restChars nextChar =
    case
        ( RangeDict.get lastChar classes
        , RangeDict.get nextChar classes
        )
    of
        -- CR only extends for CRLF
        ( Just CR, Just LF ) ->
            False

        ( Just CR, _ ) ->
            True

        -- LF always breaks
        ( Just LF, _ ) ->
            True

        -- Control always breaks
        ( Just Control, _ ) ->
            True

        -- regional indicators form sequences of exactly two
        ( Just RegionalIndicator, Just RegionalIndicator ) ->
            not (List.isEmpty restChars)

        -- prepend only breaks for CR, LF, and Control
        ( Just Prepend, Just CR ) ->
            True

        ( Just Prepend, Just LF ) ->
            True

        ( Just Prepend, Just Control ) ->
            True

        ( Just Prepend, _ ) ->
            False

        -- Hangul L
        ( Just L, Just L ) ->
            False

        ( Just L, Just V ) ->
            False

        ( Just L, Just LV ) ->
            False

        ( Just L, Just LVT ) ->
            False

        -- Hangul V
        ( Just V, Just V ) ->
            False

        ( Just V, Just T ) ->
            False

        -- Hangul T
        ( Just T, Just T ) ->
            False

        -- Hangul LV
        ( Just LV, Just V ) ->
            False

        ( Just LV, Just T ) ->
            False

        -- Hangul LVT
        ( Just LVT, Just T ) ->
            False

        -- Emoji modification sequences
        ( Just ZWJ, Just ExtendedPictographic ) ->
            restChars
                |> List.map (\c -> RangeDict.get c classes)
                |> shouldBreakForRule11

        -- other than special cases handled above, everything breaks on ZWJ,
        -- SpacingMark, and Extend
        ( _, Just ZWJ ) ->
            False

        ( _, Just SpacingMark ) ->
            False

        ( _, Just Extend ) ->
            False

        _ ->
            True


{-| Rule 11 looks like this: `ExtPict Extend* ZWJ ExtPict`

We already handle the terminal ZWJ and ExtPict above, so we just need to deal
with the list of Extend and the initial ExtPict.

-}
shouldBreakForRule11 : List (Maybe Class) -> Bool
shouldBreakForRule11 classes_ =
    case classes_ of
        (Just Extend) :: rest ->
            shouldBreakForRule11 rest

        [ Just ExtendedPictographic ] ->
            False

        _ ->
            True


classes : RangeDict Char Data.Class
classes =
    List.foldl
        RangeDict.union
        RangeDict.empty
        [ CR.chars
        , LF.chars
        , Control.chars
        , Extend.chars
        , RegionalIndicator.chars
        , Prepend.chars
        , SpacingMark.chars
        , L.chars
        , V.chars
        , T.chars
        , LV.chars
        , LVT.chars
        , ExtendedPictographic.chars
        , ZWJ.chars
        ]
