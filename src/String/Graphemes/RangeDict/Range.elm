module String.Graphemes.RangeDict.Range exposing (Order(..), Range, combine, compare, lowerBound, point, range, upperBound)


type Range comparable
    = Point comparable
    | Range comparable comparable


point : comparable -> Range comparable
point =
    Point


range : comparable -> comparable -> Range comparable
range a b =
    if a == b then
        Point a

    else
        Range (min a b) (max a b)


lowerBound : Range comparable -> comparable
lowerBound range_ =
    case range_ of
        Point x ->
            x

        Range low _ ->
            low


upperBound : Range comparable -> comparable
upperBound range_ =
    case range_ of
        Point x ->
            x

        Range _ high ->
            high


type Order
    = EQ
    | GT
    | LT
    | Overlapping


compare : Range comparable -> Range comparable -> Order
compare a b =
    case ( a, b ) of
        ( Point x, Point y ) ->
            if x > y then
                GT

            else if x < y then
                LT

            else
                EQ

        ( Point x, Range low high ) ->
            if x < low then
                LT

            else if x > high then
                GT

            else
                Overlapping

        ( Range low high, Point x ) ->
            if x < low then
                GT

            else if x > high then
                LT

            else
                Overlapping

        ( Range low1 high1, Range low2 high2 ) ->
            if high1 < low2 then
                LT

            else if low1 > high2 then
                GT

            else if low1 == low2 && high1 == high2 then
                EQ

            else
                Overlapping


combine : Range comparable -> Range comparable -> Range comparable
combine a b =
    case ( a, b ) of
        ( Point x, Point y ) ->
            range x y

        ( Point x, Range low high ) ->
            Range (min x low) (max x high)

        ( Range low high, Point x ) ->
            Range (min x low) (max x high)

        ( Range low1 high1, Range low2 high2 ) ->
            Range (min low1 low2) (max high1 high2)
