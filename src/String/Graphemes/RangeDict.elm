module String.Graphemes.RangeDict exposing (RangeDict, empty, fromList, insert, member, toList)

import String.Graphemes.RangeDict.Range as Range exposing (Range)


{-| Longer-term, this may make sense to release as a separate package.
-}
type RangeDict comparable
    = Branch Int (Range comparable) (RangeDict comparable) (RangeDict comparable)
    | Empty


empty : RangeDict comparable
empty =
    Empty


branch : Range comparable -> RangeDict comparable -> RangeDict comparable -> RangeDict comparable
branch range lt gt =
    Branch (max (height lt) (height gt) + 1) range lt gt


fromList : List (Range comparable) -> RangeDict comparable
fromList =
    List.foldl insert Empty


toList : RangeDict comparable -> List (Range comparable)
toList rangeDict =
    case rangeDict of
        Empty ->
            []

        Branch _ here lt gt ->
            toList lt ++ (here :: toList gt)


insert : Range comparable -> RangeDict comparable -> RangeDict comparable
insert range set =
    -- TODO: removing overlaps (but it doesn't matter a lot for our use case)
    case set of
        Empty ->
            branch range Empty Empty

        Branch height_ here lt gt ->
            case Range.compare here range of
                Range.LT ->
                    branch here (insert range lt) gt |> balance

                Range.GT ->
                    branch here lt (insert range gt) |> balance

                Range.EQ ->
                    set

                Range.Overlapping ->
                    let
                        combined =
                            Range.combine range here
                    in
                    branch combined lt gt


member : comparable -> RangeDict comparable -> Bool
member what rangeDict =
    memberHelp (Range.point what) rangeDict


memberHelp : Range comparable -> RangeDict comparable -> Bool
memberHelp range rangeDict =
    case rangeDict of
        Empty ->
            False

        Branch height_ here lt gt ->
            case Range.compare range here of
                Range.LT ->
                    memberHelp range gt

                Range.GT ->
                    memberHelp range lt

                Range.EQ ->
                    True

                Range.Overlapping ->
                    True


balance : RangeDict comparable -> RangeDict comparable
balance rangeDict =
    case rangeDict of
        Empty ->
            rangeDict

        Branch _ here lt gt ->
            if heightDiff rangeDict == -2 && heightDiff lt == 1 then
                -- left leaning branch with right-leaning left subtree.
                branch here (rotateLeft lt) gt |> rotateRight

            else if heightDiff rangeDict < -1 then
                rotateRight rangeDict

            else if heightDiff rangeDict == 2 && heightDiff gt == -1 then
                -- right leaning branch with left-leaning right subtree.
                branch here lt (rotateRight gt) |> rotateLeft

            else if heightDiff rangeDict > 1 then
                rotateLeft rangeDict

            else
                rangeDict


height : RangeDict comparable -> Int
height rangeDict =
    case rangeDict of
        Empty ->
            0

        Branch height_ _ _ _ ->
            height_


heightDiff : RangeDict comparable -> Int
heightDiff rangeDict =
    case rangeDict of
        Empty ->
            0

        Branch _ _ lt gt ->
            height gt - height lt


rotateLeft : RangeDict comparable -> RangeDict comparable
rotateLeft rangeDict =
    case rangeDict of
        Branch _ head lessThans (Branch _ subHead betweens greaterThans) ->
            branch subHead (branch head lessThans betweens) greaterThans

        _ ->
            rangeDict


rotateRight : RangeDict comparable -> RangeDict comparable
rotateRight rangeDict =
    case rangeDict of
        Branch _ head (Branch _ subHead lessThans betweens) greaterThans ->
            branch subHead lessThans (branch head betweens greaterThans)

        _ ->
            rangeDict
