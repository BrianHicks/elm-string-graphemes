module String.Graphemes.RangeSet exposing (RangeSet, empty, fromList, insert, member, toList)

import String.Graphemes.RangeSet.Range as Range exposing (Range)


{-| Longer-term, this may make sense to release as a separate package.
-}
type RangeSet comparable
    = Branch Int (Range comparable) (RangeSet comparable) (RangeSet comparable)
    | Empty


empty : RangeSet comparable
empty =
    Empty


branch : Range comparable -> RangeSet comparable -> RangeSet comparable -> RangeSet comparable
branch range lt gt =
    Branch (max (height lt) (height gt) + 1) range lt gt


fromList : List (Range comparable) -> RangeSet comparable
fromList =
    List.foldl insert Empty


toList : RangeSet comparable -> List (Range comparable)
toList rangeSet =
    case rangeSet of
        Empty ->
            []

        Branch _ here lt gt ->
            toList lt ++ (here :: toList gt)


insert : Range comparable -> RangeSet comparable -> RangeSet comparable
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


member : comparable -> RangeSet comparable -> Bool
member what rangeSet =
    memberHelp (Range.point what) rangeSet


memberHelp : Range comparable -> RangeSet comparable -> Bool
memberHelp range rangeSet =
    case rangeSet of
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


balance : RangeSet comparable -> RangeSet comparable
balance rangeSet =
    case rangeSet of
        Empty ->
            rangeSet

        Branch _ here lt gt ->
            if heightDiff rangeSet == -2 && heightDiff lt == 1 then
                -- left leaning branch with right-leaning left subtree.
                branch here (rotateLeft lt) gt |> rotateRight

            else if heightDiff rangeSet < -1 then
                rotateRight rangeSet

            else if heightDiff rangeSet == 2 && heightDiff gt == -1 then
                -- right leaning branch with left-leaning right subtree.
                branch here lt (rotateRight gt) |> rotateLeft

            else if heightDiff rangeSet > 1 then
                rotateLeft rangeSet

            else
                rangeSet


height : RangeSet comparable -> Int
height rangeSet =
    case rangeSet of
        Empty ->
            0

        Branch height_ _ _ _ ->
            height_


heightDiff : RangeSet comparable -> Int
heightDiff rangeSet =
    case rangeSet of
        Empty ->
            0

        Branch _ _ lt gt ->
            height gt - height lt


rotateLeft : RangeSet comparable -> RangeSet comparable
rotateLeft rangeSet =
    case rangeSet of
        Branch _ head lessThans (Branch _ subHead betweens greaterThans) ->
            branch subHead (branch head lessThans betweens) greaterThans

        _ ->
            rangeSet


rotateRight : RangeSet comparable -> RangeSet comparable
rotateRight rangeSet =
    case rangeSet of
        Branch _ head (Branch _ subHead lessThans betweens) greaterThans ->
            branch subHead lessThans (branch head betweens greaterThans)

        _ ->
            rangeSet
