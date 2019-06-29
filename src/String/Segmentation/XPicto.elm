module String.Segmentation.XPicto exposing (parser)

import Parser exposing ((|.), Parser, Step(..), chompWhile, loop)
import String.Segmentation.Data.Extend as Extend
import String.Segmentation.Data.Extended_Pictographic as ExtendedPictographic
import String.Segmentation.Data.ZWJ as ZWJ


parser : Parser ()
parser =
    ExtendedPictographic.parser
        |. zeroOrMore
            (chompWhile Extend.match
                |. ZWJ.parser
                |. ExtendedPictographic.parser
            )


zeroOrMore : Parser () -> Parser ()
zeroOrMore p =
    loop ()
        (\_ ->
            Parser.oneOf
                [ Parser.succeed (Loop ()) |. p
                , Parser.succeed (Done ())
                ]
        )
