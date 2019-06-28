module String.Segmentation.RangeSet exposing (RangeSet, fromList, insert, member, toList)

import String.Segmentation.RangeSet.Range as Range exposing (Range)


{-| Longer-term, this may make sense to release as a separate package.
-}
type RangeSet comparable
    = Branch (Range comparable) (RangeSet comparable) (RangeSet comparable)
    | Empty


fromList : List (Range comparable) -> RangeSet comparable
fromList =
    List.foldl insert Empty


toList : RangeSet comparable -> List (Range comparable)
toList rangeSet =
    case rangeSet of
        Empty ->
            []

        Branch here lt gt ->
            toList lt ++ (here :: toList gt)


insert : Range comparable -> RangeSet comparable -> RangeSet comparable
insert range set =
    -- TODO: balancing
    -- TODO: removing overlaps (but it doesn't matter a lot for our use case)
    case set of
        Empty ->
            Branch range Empty Empty

        Branch here lt gt ->
            case Range.compare here range of
                Range.LT ->
                    Branch here (insert range lt) gt

                Range.GT ->
                    Branch here lt (insert range gt)

                Range.EQ ->
                    Branch here lt gt

                Range.Overlapping ->
                    let
                        combined =
                            Range.combine range here
                    in
                    Branch combined lt gt


member : comparable -> RangeSet comparable -> Bool
member what rangeSet =
    memberHelp (Range.point what) rangeSet


memberHelp : Range comparable -> RangeSet comparable -> Bool
memberHelp range rangeSet =
    case rangeSet of
        Empty ->
            False

        Branch here lt gt ->
            case Range.compare range here of
                Range.LT ->
                    memberHelp range gt

                Range.GT ->
                    memberHelp range lt

                Range.EQ ->
                    True

                Range.Overlapping ->
                    True
