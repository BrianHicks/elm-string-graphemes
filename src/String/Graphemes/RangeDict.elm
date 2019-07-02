module String.Graphemes.RangeDict exposing (RangeDict, empty, fromList, get, insert, member, toList, union)

import String.Graphemes.RangeDict.Range as Range exposing (Range)


{-| Longer-term, this may make sense to release as a separate package.
-}
type RangeDict comparable value
    = Branch Int (Range comparable) value (RangeDict comparable value) (RangeDict comparable value)
    | Empty


empty : RangeDict comparable value
empty =
    Empty


branch : Range comparable -> value -> RangeDict comparable value -> RangeDict comparable value -> RangeDict comparable value
branch range value lt gt =
    Branch (max (height lt) (height gt) + 1) range value lt gt


fromList : List ( Range comparable, value ) -> RangeDict comparable value
fromList =
    List.foldl (\( range, value ) -> insert range value) Empty


toList : RangeDict comparable value -> List ( Range comparable, value )
toList rangeDict =
    case rangeDict of
        Empty ->
            []

        Branch _ here value lt gt ->
            toList lt ++ (( here, value ) :: toList gt)


{-| combine two RangeDicts. The first value's ranges take precedence.
-}
union : RangeDict comparable value -> RangeDict comparable value -> RangeDict comparable value
union a b =
    List.foldl (\( range_, value ) -> insert range_ value) b (toList a)


insert : Range comparable -> value -> RangeDict comparable value -> RangeDict comparable value
insert range value set =
    -- TODO: removing overlaps (but it doesn't matter a lot for our use case)
    case set of
        Empty ->
            branch range value Empty Empty

        Branch height_ here hereValue lt gt ->
            case Range.compare here range of
                Range.LT ->
                    branch here hereValue (insert range value lt) gt |> balance

                Range.GT ->
                    branch here hereValue lt (insert range value gt) |> balance

                Range.EQ ->
                    set

                Range.Overlapping ->
                    let
                        combined =
                            Range.combine range here
                    in
                    -- TODO: this is no longer good enough now that this is a
                    -- key/value store. We need to be very precise about the
                    -- parts of the range we're storing.
                    branch combined value lt gt


get : comparable -> RangeDict comparable value -> Maybe value
get what rangeDict =
    getHelp (Range.point what) rangeDict


getHelp : Range comparable -> RangeDict comparable value -> Maybe value
getHelp range rangeDict =
    case rangeDict of
        Empty ->
            Nothing

        Branch height_ here value lt gt ->
            case Range.compare range here of
                Range.LT ->
                    getHelp range gt

                Range.GT ->
                    getHelp range lt

                Range.EQ ->
                    Just value

                Range.Overlapping ->
                    Just value


member : comparable -> RangeDict comparable value -> Bool
member what rangeDict =
    case get what rangeDict of
        Nothing ->
            False

        Just _ ->
            True


balance : RangeDict comparable value -> RangeDict comparable value
balance rangeDict =
    case rangeDict of
        Empty ->
            rangeDict

        Branch _ here value lt gt ->
            if heightDiff rangeDict == -2 && heightDiff lt == 1 then
                -- left leaning branch with right-leaning left subtree.
                branch here value (rotateLeft lt) gt |> rotateRight

            else if heightDiff rangeDict < -1 then
                rotateRight rangeDict

            else if heightDiff rangeDict == 2 && heightDiff gt == -1 then
                -- right leaning branch with left-leaning right subtree.
                branch here value lt (rotateRight gt) |> rotateLeft

            else if heightDiff rangeDict > 1 then
                rotateLeft rangeDict

            else
                rangeDict


height : RangeDict comparable value -> Int
height rangeDict =
    case rangeDict of
        Empty ->
            0

        Branch height_ _ _ _ _ ->
            height_


heightDiff : RangeDict comparable value -> Int
heightDiff rangeDict =
    case rangeDict of
        Empty ->
            0

        Branch _ _ _ lt gt ->
            height gt - height lt


rotateLeft : RangeDict comparable value -> RangeDict comparable value
rotateLeft rangeDict =
    case rangeDict of
        Branch _ head value lessThans (Branch _ subHead subValue betweens greaterThans) ->
            branch subHead subValue (branch head value lessThans betweens) greaterThans

        _ ->
            rangeDict


rotateRight : RangeDict comparable value -> RangeDict comparable value
rotateRight rangeDict =
    case rangeDict of
        Branch _ head value (Branch _ subHead subValue lessThans betweens) greaterThans ->
            branch subHead subValue lessThans (branch head value betweens greaterThans)

        _ ->
            rangeDict
