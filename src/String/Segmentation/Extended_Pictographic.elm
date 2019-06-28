module String.Segmentation.Extended_Pictographic exposing (chars, match, parser)

{-| Hey, this module was generated automatically. Please don't edit it.

Run `make src/String/Segmentation/Extended_Pictographic.elm` instead!

-}

import Parser exposing (Parser)
import String.Segmentation.RangeSet as RangeSet exposing (RangeSet)
import String.Segmentation.RangeSet.Range as Range


parser : Parser ()
parser =
    Parser.chompIf match


match : Char -> Bool
match c =
    RangeSet.member c chars


chars : RangeSet Char
chars =
    RangeSet.fromList
        [ Range.point '©' --  1.1  [1] (©️)       copyright
        , Range.point '®' --  1.1  [1] (®️)       registered
        , Range.point '‼' --  1.1  [1] (‼️)       double exclamation mark
        , Range.point '⁉' --  3.0  [1] (⁉️)       exclamation question mark
        , Range.point '™' --  1.1  [1] (™️)       trade mark
        , Range.point 'ℹ' --  3.0  [1] (ℹ️)       information
        , Range.range '↔' '↙' --  1.1  [6] (↔️..↙️)    left-right arrow..down-left arrow
        , Range.range '↩' '↪' --  1.1  [2] (↩️..↪️)    right arrow curving left..left arrow curving right
        , Range.range '⌚' '⌛' --  1.1  [2] (⌚..⌛)    watch..hourglass done
        , Range.point '⌨' --  1.1  [1] (⌨️)       keyboard
        , Range.point '⎈' --  3.0  [1] (⎈)       HELM SYMBOL
        , Range.point '⏏' --  4.0  [1] (⏏️)       eject button
        , Range.range '⏩' '⏳' --  6.0 [11] (⏩..⏳)    fast-forward button..hourglass not done
        , Range.range '⏸' '⏺' --  7.0  [3] (⏸️..⏺️)    pause button..record button
        , Range.point 'Ⓜ' --  1.1  [1] (Ⓜ️)       circled M
        , Range.range '▪' '▫' --  1.1  [2] (▪️..▫️)    black small square..white small square
        , Range.point '▶' --  1.1  [1] (▶️)       play button
        , Range.point '◀' --  1.1  [1] (◀️)       reverse button
        , Range.range '◻' '◾' --  3.2  [4] (◻️..◾)    white medium square..black medium-small square
        , Range.range '☀' '★' --  1.1  [6] (☀️..★)    sun..BLACK STAR
        , Range.range '☇' '☒' --  1.1 [12] (☇..☒)    LIGHTNING..BALLOT BOX WITH X
        , Range.range '☔' '☕' --  4.0  [2] (☔..☕)    umbrella with rain drops..hot beverage
        , Range.range '☖' '☗' --  3.2  [2] (☖..☗)    WHITE SHOGI PIECE..BLACK SHOGI PIECE
        , Range.point '☘' --  4.1  [1] (☘️)       shamrock
        , Range.point '☙' --  3.0  [1] (☙)       REVERSED ROTATED FLORAL HEART BULLET
        , Range.range '☚' '♯' --  1.1 [86] (☚..♯)    BLACK LEFT POINTING INDEX..MUSIC SHARP SIGN
        , Range.range '♰' '♱' --  3.0  [2] (♰..♱)    WEST SYRIAC CROSS..EAST SYRIAC CROSS
        , Range.range '♲' '♽' --  3.2 [12] (♲..♽)    UNIVERSAL RECYCLING SYMBOL..PARTIALLY-RECYCLED PAPER SYMBOL
        , Range.range '♾' '♿' --  4.1  [2] (♾️..♿)    infinity..wheelchair symbol
        , Range.range '⚀' '⚅' --  3.2  [6] (⚀..⚅)    DIE FACE-1..DIE FACE-6
        , Range.range '⚐' '⚑' --  4.0  [2] (⚐..⚑)    WHITE FLAG..BLACK FLAG
        , Range.range '⚒' '⚜' --  4.1 [11] (⚒️..⚜️)    hammer and pick..fleur-de-lis
        , Range.point '⚝' --  5.1  [1] (⚝)       OUTLINED WHITE STAR
        , Range.range '⚞' '⚟' --  5.2  [2] (⚞..⚟)    THREE LINES CONVERGING RIGHT..THREE LINES CONVERGING LEFT
        , Range.range '⚠' '⚡' --  4.0  [2] (⚠️..⚡)    warning..high voltage
        , Range.range '⚢' '⚱' --  4.1 [16] (⚢..⚱️)    DOUBLED FEMALE SIGN..funeral urn
        , Range.point '⚲' --  5.0  [1] (⚲)       NEUTER
        , Range.range '⚳' '⚼' --  5.1 [10] (⚳..⚼)    CERES..SESQUIQUADRATE
        , Range.range '⚽' '⚿' --  5.2  [3] (⚽..⚿)    soccer ball..SQUARED KEY
        , Range.range '⛀' '⛃' --  5.1  [4] (⛀..⛃)    WHITE DRAUGHTS MAN..BLACK DRAUGHTS KING
        , Range.range '⛄' '⛍' --  5.2 [10] (⛄..⛍)    snowman without snow..DISABLED CAR
        , Range.point '⛎' --  6.0  [1] (⛎)       Ophiuchus
        , Range.range '⛏' '⛡' --  5.2 [19] (⛏️..⛡)    pick..RESTRICTED LEFT ENTRY-2
        , Range.point '⛢' --  6.0  [1] (⛢)       ASTRONOMICAL SYMBOL FOR URANUS
        , Range.point '⛣' --  5.2  [1] (⛣)       HEAVY CIRCLE WITH STROKE AND TWO DOTS ABOVE
        , Range.range '⛤' '⛧' --  6.0  [4] (⛤..⛧)    PENTAGRAM..INVERTED PENTAGRAM
        , Range.range '⛨' '⛿' --  5.2 [24] (⛨..⛿)    BLACK CROSS ON SHIELD..WHITE FLAG WITH HORIZONTAL MIDDLE BLACK STRIPE
        , Range.point '✀' --  7.0  [1] (✀)       BLACK SAFETY SCISSORS
        , Range.range '✁' '✄' --  1.1  [4] (✁..✄)    UPPER BLADE SCISSORS..WHITE SCISSORS
        , Range.point '✅' --  6.0  [1] (✅)       check mark button
        , Range.range '✈' '✉' --  1.1  [2] (✈️..✉️)    airplane..envelope
        , Range.range '✊' '✋' --  6.0  [2] (✊..✋)    raised fist..raised hand
        , Range.range '✌' '✒' --  1.1  [7] (✌️..✒️)    victory hand..black nib
        , Range.point '✔' --  1.1  [1] (✔️)       check mark
        , Range.point '✖' --  1.1  [1] (✖️)       multiplication sign
        , Range.point '✝' --  1.1  [1] (✝️)       latin cross
        , Range.point '✡' --  1.1  [1] (✡️)       star of David
        , Range.point '✨' --  6.0  [1] (✨)       sparkles
        , Range.range '✳' '✴' --  1.1  [2] (✳️..✴️)    eight-spoked asterisk..eight-pointed star
        , Range.point '❄' --  1.1  [1] (❄️)       snowflake
        , Range.point '❇' --  1.1  [1] (❇️)       sparkle
        , Range.point '❌' --  6.0  [1] (❌)       cross mark
        , Range.point '❎' --  6.0  [1] (❎)       cross mark button
        , Range.range '❓' '❕' --  6.0  [3] (❓..❕)    question mark..white exclamation mark
        , Range.point '❗' --  5.2  [1] (❗)       exclamation mark
        , Range.range '❣' '❧' --  1.1  [5] (❣️..❧)    heart exclamation..ROTATED FLORAL HEART BULLET
        , Range.range '➕' '➗' --  6.0  [3] (➕..➗)    plus sign..division sign
        , Range.point '➡' --  1.1  [1] (➡️)       right arrow
        , Range.point '➰' --  6.0  [1] (➰)       curly loop
        , Range.point '➿' --  6.0  [1] (➿)       double curly loop
        , Range.range '⤴' '⤵' --  3.2  [2] (⤴️..⤵️)    right arrow curving up..right arrow curving down
        , Range.range '⬅' '⬇' --  4.0  [3] (⬅️..⬇️)    left arrow..down arrow
        , Range.range '⬛' '⬜' --  5.1  [2] (⬛..⬜)    black large square..white large square
        , Range.point '⭐' --  5.1  [1] (⭐)       star
        , Range.point '⭕' --  5.2  [1] (⭕)       hollow red circle
        , Range.point '〰' --  1.1  [1] (〰️)       wavy dash
        , Range.point '〽' --  3.2  [1] (〽️)       part alternation mark
        , Range.point '㊗' --  1.1  [1] (㊗️)       Japanese “congratulations” button
        , Range.point '㊙' --  1.1  [1] (㊙️)       Japanese “secret” button
        , Range.range '🀀' '🀫' --  5.1 [44] (🀀..🀫)    MAHJONG TILE EAST WIND..MAHJONG TILE BACK
        , Range.range '\u{1F02C}' '\u{1F02F}' --   NA  [4] (🀬..🀯)    <reserved-1F02C>..<reserved-1F02F>
        , Range.range '🀰' '🂓' --  5.1[100] (🀰..🂓)    DOMINO TILE HORIZONTAL BACK..DOMINO TILE VERTICAL-06-06
        , Range.range '\u{1F094}' '\u{1F09F}' --   NA [12] (🂔..🂟)    <reserved-1F094>..<reserved-1F09F>
        , Range.range '🂠' '🂮' --  6.0 [15] (🂠..🂮)    PLAYING CARD BACK..PLAYING CARD KING OF SPADES
        , Range.range '\u{1F0AF}' '\u{1F0B0}' --   NA  [2] (🂯..🂰)    <reserved-1F0AF>..<reserved-1F0B0>
        , Range.range '🂱' '🂾' --  6.0 [14] (🂱..🂾)    PLAYING CARD ACE OF HEARTS..PLAYING CARD KING OF HEARTS
        , Range.point '🂿' --  7.0  [1] (🂿)       PLAYING CARD RED JOKER
        , Range.point '\u{1F0C0}' --   NA  [1] (🃀)       <reserved-1F0C0>
        , Range.range '🃁' '🃏' --  6.0 [15] (🃁..🃏)    PLAYING CARD ACE OF DIAMONDS..joker
        , Range.point '\u{1F0D0}' --   NA  [1] (🃐)       <reserved-1F0D0>
        , Range.range '🃑' '🃟' --  6.0 [15] (🃑..🃟)    PLAYING CARD ACE OF CLUBS..PLAYING CARD WHITE JOKER
        , Range.range '🃠' '🃵' --  7.0 [22] (🃠..🃵)    PLAYING CARD FOOL..PLAYING CARD TRUMP-21
        , Range.range '\u{1F0F6}' '\u{1F0FF}' --   NA [10] (🃶..🃿)    <reserved-1F0F6>..<reserved-1F0FF>
        , Range.range '\u{1F10D}' '\u{1F10F}' --   NA  [3] (🄍..🄏)    <reserved-1F10D>..<reserved-1F10F>
        , Range.point '\u{1F12F}' -- 11.0  [1] (🄯)       COPYLEFT SYMBOL
        , Range.point '\u{1F16C}' -- 12.0  [1] (🅬)       RAISED MR SIGN
        , Range.range '\u{1F16D}' '\u{1F16F}' --   NA  [3] (🅭..🅯)    <reserved-1F16D>..<reserved-1F16F>
        , Range.range '🅰' '🅱' --  6.0  [2] (🅰️..🅱️)    A button (blood type)..B button (blood type)
        , Range.point '🅾' --  6.0  [1] (🅾️)       O button (blood type)
        , Range.point '🅿' --  5.2  [1] (🅿️)       P button
        , Range.point '🆎' --  6.0  [1] (🆎)       AB button (blood type)
        , Range.range '🆑' '🆚' --  6.0 [10] (🆑..🆚)    CL button..VS button
        , Range.range '\u{1F1AD}' '\u{1F1E5}' --   NA [57] (🆭..🇥)    <reserved-1F1AD>..<reserved-1F1E5>
        , Range.range '🈁' '🈂' --  6.0  [2] (🈁..🈂️)    Japanese “here” button..Japanese “service charge” button
        , Range.range '\u{1F203}' '\u{1F20F}' --   NA [13] (🈃..🈏)    <reserved-1F203>..<reserved-1F20F>
        , Range.point '🈚' --  5.2  [1] (🈚)       Japanese “free of charge” button
        , Range.point '🈯' --  5.2  [1] (🈯)       Japanese “reserved” button
        , Range.range '🈲' '🈺' --  6.0  [9] (🈲..🈺)    Japanese “prohibited” button..Japanese “open for business” button
        , Range.range '\u{1F23C}' '\u{1F23F}' --   NA  [4] (🈼..🈿)    <reserved-1F23C>..<reserved-1F23F>
        , Range.range '\u{1F249}' '\u{1F24F}' --   NA  [7] (🉉..🉏)    <reserved-1F249>..<reserved-1F24F>
        , Range.range '🉐' '🉑' --  6.0  [2] (🉐..🉑)    Japanese “bargain” button..Japanese “acceptable” button
        , Range.range '\u{1F252}' '\u{1F25F}' --   NA [14] (🉒..🉟)    <reserved-1F252>..<reserved-1F25F>
        , Range.range '\u{1F260}' '\u{1F265}' -- 10.0  [6] (🉠..🉥)    ROUNDED SYMBOL FOR FU..ROUNDED SYMBOL FOR CAI
        , Range.range '\u{1F266}' '\u{1F2FF}' --   NA[154] (🉦..🋿)    <reserved-1F266>..<reserved-1F2FF>
        , Range.range '🌀' '🌠' --  6.0 [33] (🌀..🌠)    cyclone..shooting star
        , Range.range '🌡' '🌬' --  7.0 [12] (🌡️..🌬️)    thermometer..wind face
        , Range.range '\u{1F32D}' '\u{1F32F}' --  8.0  [3] (🌭..🌯)    hot dog..burrito
        , Range.range '🌰' '🌵' --  6.0  [6] (🌰..🌵)    chestnut..cactus
        , Range.point '🌶' --  7.0  [1] (🌶️)       hot pepper
        , Range.range '🌷' '🍼' --  6.0 [70] (🌷..🍼)    tulip..baby bottle
        , Range.point '🍽' --  7.0  [1] (🍽️)       fork and knife with plate
        , Range.range '\u{1F37E}' '\u{1F37F}' --  8.0  [2] (🍾..🍿)    bottle with popping cork..popcorn
        , Range.range '🎀' '🎓' --  6.0 [20] (🎀..🎓)    ribbon..graduation cap
        , Range.range '🎔' '🎟' --  7.0 [12] (🎔..🎟️)    HEART WITH TIP ON THE LEFT..admission tickets
        , Range.range '🎠' '🏄' --  6.0 [37] (🎠..🏄)    carousel horse..person surfing
        , Range.point '🏅' --  7.0  [1] (🏅)       sports medal
        , Range.range '🏆' '🏊' --  6.0  [5] (🏆..🏊)    trophy..person swimming
        , Range.range '🏋' '🏎' --  7.0  [4] (🏋️..🏎️)    person lifting weights..racing car
        , Range.range '\u{1F3CF}' '\u{1F3D3}' --  8.0  [5] (🏏..🏓)    cricket game..ping pong
        , Range.range '🏔' '🏟' --  7.0 [12] (🏔️..🏟️)    snow-capped mountain..stadium
        , Range.range '🏠' '🏰' --  6.0 [17] (🏠..🏰)    house..castle
        , Range.range '🏱' '🏷' --  7.0  [7] (🏱..🏷️)    WHITE PENNANT..label
        , Range.range '\u{1F3F8}' '\u{1F3FA}' --  8.0  [3] (🏸..🏺)    badminton..amphora
        , Range.range '🐀' '🐾' --  6.0 [63] (🐀..🐾)    rat..paw prints
        , Range.point '🐿' --  7.0  [1] (🐿️)       chipmunk
        , Range.point '👀' --  6.0  [1] (👀)       eyes
        , Range.point '👁' --  7.0  [1] (👁️)       eye
        , Range.range '👂' '📷' --  6.0[182] (👂..📷)    ear..camera
        , Range.point '📸' --  7.0  [1] (📸)       camera with flash
        , Range.range '📹' '📼' --  6.0  [4] (📹..📼)    video camera..videocassette
        , Range.range '📽' '📾' --  7.0  [2] (📽️..📾)    film projector..PORTABLE STEREO
        , Range.point '\u{1F4FF}' --  8.0  [1] (📿)       prayer beads
        , Range.range '🔀' '🔽' --  6.0 [62] (🔀..🔽)    shuffle tracks button..downwards button
        , Range.range '🕆' '🕊' --  7.0  [5] (🕆..🕊️)    WHITE LATIN CROSS..dove
        , Range.range '\u{1F54B}' '\u{1F54F}' --  8.0  [5] (🕋..🕏)    kaaba..BOWL OF HYGIEIA
        , Range.range '🕐' '🕧' --  6.0 [24] (🕐..🕧)    one o’clock..twelve-thirty
        , Range.range '🕨' '🕹' --  7.0 [18] (🕨..🕹️)    RIGHT SPEAKER..joystick
        , Range.point '\u{1F57A}' --  9.0  [1] (🕺)       man dancing
        , Range.range '🕻' '🖣' --  7.0 [41] (🕻..🖣)    LEFT HAND TELEPHONE RECEIVER..BLACK DOWN POINTING BACKHAND INDEX
        , Range.point '\u{1F5A4}' --  9.0  [1] (🖤)       black heart
        , Range.range '🖥' '🗺' --  7.0 [86] (🖥️..🗺️)    desktop computer..world map
        , Range.range '🗻' '🗿' --  6.0  [5] (🗻..🗿)    mount fuji..moai
        , Range.point '😀' --  6.1  [1] (😀)       grinning face
        , Range.range '😁' '😐' --  6.0 [16] (😁..😐)    beaming face with smiling eyes..neutral face
        , Range.point '😑' --  6.1  [1] (😑)       expressionless face
        , Range.range '😒' '😔' --  6.0  [3] (😒..😔)    unamused face..pensive face
        , Range.point '😕' --  6.1  [1] (😕)       confused face
        , Range.point '😖' --  6.0  [1] (😖)       confounded face
        , Range.point '😗' --  6.1  [1] (😗)       kissing face
        , Range.point '😘' --  6.0  [1] (😘)       face blowing a kiss
        , Range.point '😙' --  6.1  [1] (😙)       kissing face with smiling eyes
        , Range.point '😚' --  6.0  [1] (😚)       kissing face with closed eyes
        , Range.point '😛' --  6.1  [1] (😛)       face with tongue
        , Range.range '😜' '😞' --  6.0  [3] (😜..😞)    winking face with tongue..disappointed face
        , Range.point '😟' --  6.1  [1] (😟)       worried face
        , Range.range '😠' '😥' --  6.0  [6] (😠..😥)    angry face..sad but relieved face
        , Range.range '😦' '😧' --  6.1  [2] (😦..😧)    frowning face with open mouth..anguished face
        , Range.range '😨' '😫' --  6.0  [4] (😨..😫)    fearful face..tired face
        , Range.point '😬' --  6.1  [1] (😬)       grimacing face
        , Range.point '😭' --  6.0  [1] (😭)       loudly crying face
        , Range.range '😮' '😯' --  6.1  [2] (😮..😯)    face with open mouth..hushed face
        , Range.range '😰' '😳' --  6.0  [4] (😰..😳)    anxious face with sweat..flushed face
        , Range.point '😴' --  6.1  [1] (😴)       sleeping face
        , Range.range '😵' '🙀' --  6.0 [12] (😵..🙀)    dizzy face..weary cat
        , Range.range '🙁' '🙂' --  7.0  [2] (🙁..🙂)    slightly frowning face..slightly smiling face
        , Range.range '\u{1F643}' '\u{1F644}' --  8.0  [2] (🙃..🙄)    upside-down face..face with rolling eyes
        , Range.range '🙅' '🙏' --  6.0 [11] (🙅..🙏)    person gesturing NO..folded hands
        , Range.range '🚀' '🛅' --  6.0 [70] (🚀..🛅)    rocket..left luggage
        , Range.range '🛆' '🛏' --  7.0 [10] (🛆..🛏️)    TRIANGLE WITH ROUNDED CORNERS..bed
        , Range.point '\u{1F6D0}' --  8.0  [1] (🛐)       place of worship
        , Range.range '\u{1F6D1}' '\u{1F6D2}' --  9.0  [2] (🛑..🛒)    stop sign..shopping cart
        , Range.range '\u{1F6D3}' '\u{1F6D4}' -- 10.0  [2] (🛓..🛔)    STUPA..PAGODA
        , Range.point '\u{1F6D5}' -- 12.0  [1] (🛕)       hindu temple
        , Range.range '\u{1F6D6}' '\u{1F6DF}' --   NA [10] (🛖..🛟)    <reserved-1F6D6>..<reserved-1F6DF>
        , Range.range '🛠' '🛬' --  7.0 [13] (🛠️..🛬)    hammer and wrench..airplane arrival
        , Range.range '\u{1F6ED}' '\u{1F6EF}' --   NA  [3] (🛭..🛯)    <reserved-1F6ED>..<reserved-1F6EF>
        , Range.range '🛰' '🛳' --  7.0  [4] (🛰️..🛳️)    satellite..passenger ship
        , Range.range '\u{1F6F4}' '\u{1F6F6}' --  9.0  [3] (🛴..🛶)    kick scooter..canoe
        , Range.range '\u{1F6F7}' '\u{1F6F8}' -- 10.0  [2] (🛷..🛸)    sled..flying saucer
        , Range.point '\u{1F6F9}' -- 11.0  [1] (🛹)       skateboard
        , Range.point '\u{1F6FA}' -- 12.0  [1] (🛺)       auto rickshaw
        , Range.range '\u{1F6FB}' '\u{1F6FF}' --   NA  [5] (🛻..🛿)    <reserved-1F6FB>..<reserved-1F6FF>
        , Range.range '\u{1F774}' '\u{1F77F}' --   NA [12] (🝴..🝿)    <reserved-1F774>..<reserved-1F77F>
        , Range.range '\u{1F7D5}' '\u{1F7D8}' -- 11.0  [4] (🟕..🟘)    CIRCLED TRIANGLE..NEGATIVE CIRCLED SQUARE
        , Range.range '\u{1F7D9}' '\u{1F7DF}' --   NA  [7] (🟙..🟟)    <reserved-1F7D9>..<reserved-1F7DF>
        , Range.range '\u{1F7E0}' '\u{1F7EB}' -- 12.0 [12] (🟠..🟫)    orange circle..brown square
        , Range.range '\u{1F7EC}' '\u{1F7FF}' --   NA [20] (🟬..🟿)    <reserved-1F7EC>..<reserved-1F7FF>
        , Range.range '\u{1F80C}' '\u{1F80F}' --   NA  [4] (🠌..🠏)    <reserved-1F80C>..<reserved-1F80F>
        , Range.range '\u{1F848}' '\u{1F84F}' --   NA  [8] (🡈..🡏)    <reserved-1F848>..<reserved-1F84F>
        , Range.range '\u{1F85A}' '\u{1F85F}' --   NA  [6] (🡚..🡟)    <reserved-1F85A>..<reserved-1F85F>
        , Range.range '\u{1F888}' '\u{1F88F}' --   NA  [8] (🢈..🢏)    <reserved-1F888>..<reserved-1F88F>
        , Range.range '\u{1F8AE}' '\u{1F8FF}' --   NA [82] (🢮..🣿)    <reserved-1F8AE>..<reserved-1F8FF>
        , Range.point '\u{1F90C}' --   NA  [1] (🤌)       <reserved-1F90C>
        , Range.range '\u{1F90D}' '\u{1F90F}' -- 12.0  [3] (🤍..🤏)    white heart..pinching hand
        , Range.range '\u{1F910}' '\u{1F918}' --  8.0  [9] (🤐..🤘)    zipper-mouth face..sign of the horns
        , Range.range '\u{1F919}' '\u{1F91E}' --  9.0  [6] (🤙..🤞)    call me hand..crossed fingers
        , Range.point '\u{1F91F}' -- 10.0  [1] (🤟)       love-you gesture
        , Range.range '\u{1F920}' '\u{1F927}' --  9.0  [8] (🤠..🤧)    cowboy hat face..sneezing face
        , Range.range '\u{1F928}' '\u{1F92F}' -- 10.0  [8] (🤨..🤯)    face with raised eyebrow..exploding head
        , Range.point '\u{1F930}' --  9.0  [1] (🤰)       pregnant woman
        , Range.range '\u{1F931}' '\u{1F932}' -- 10.0  [2] (🤱..🤲)    breast-feeding..palms up together
        , Range.range '\u{1F933}' '\u{1F93A}' --  9.0  [8] (🤳..🤺)    selfie..person fencing
        , Range.range '\u{1F93C}' '\u{1F93E}' --  9.0  [3] (🤼..🤾)    people wrestling..person playing handball
        , Range.point '\u{1F93F}' -- 12.0  [1] (🤿)       diving mask
        , Range.range '\u{1F940}' '\u{1F945}' --  9.0  [6] (🥀..🥅)    wilted flower..goal net
        , Range.range '\u{1F947}' '\u{1F94B}' --  9.0  [5] (🥇..🥋)    1st place medal..martial arts uniform
        , Range.point '\u{1F94C}' -- 10.0  [1] (🥌)       curling stone
        , Range.range '\u{1F94D}' '\u{1F94F}' -- 11.0  [3] (🥍..🥏)    lacrosse..flying disc
        , Range.range '\u{1F950}' '\u{1F95E}' --  9.0 [15] (🥐..🥞)    croissant..pancakes
        , Range.range '\u{1F95F}' '\u{1F96B}' -- 10.0 [13] (🥟..🥫)    dumpling..canned food
        , Range.range '\u{1F96C}' '\u{1F970}' -- 11.0  [5] (🥬..🥰)    leafy green..smiling face with hearts
        , Range.point '\u{1F971}' -- 12.0  [1] (🥱)       yawning face
        , Range.point '\u{1F972}' --   NA  [1] (🥲)       <reserved-1F972>
        , Range.range '\u{1F973}' '\u{1F976}' -- 11.0  [4] (🥳..🥶)    partying face..cold face
        , Range.range '\u{1F977}' '\u{1F979}' --   NA  [3] (🥷..🥹)    <reserved-1F977>..<reserved-1F979>
        , Range.point '\u{1F97A}' -- 11.0  [1] (🥺)       pleading face
        , Range.point '\u{1F97B}' -- 12.0  [1] (🥻)       sari
        , Range.range '\u{1F97C}' '\u{1F97F}' -- 11.0  [4] (🥼..🥿)    lab coat..flat shoe
        , Range.range '\u{1F980}' '\u{1F984}' --  8.0  [5] (🦀..🦄)    crab..unicorn
        , Range.range '\u{1F985}' '\u{1F991}' --  9.0 [13] (🦅..🦑)    eagle..squid
        , Range.range '\u{1F992}' '\u{1F997}' -- 10.0  [6] (🦒..🦗)    giraffe..cricket
        , Range.range '\u{1F998}' '\u{1F9A2}' -- 11.0 [11] (🦘..🦢)    kangaroo..swan
        , Range.range '\u{1F9A3}' '\u{1F9A4}' --   NA  [2] (🦣..🦤)    <reserved-1F9A3>..<reserved-1F9A4>
        , Range.range '\u{1F9A5}' '\u{1F9AA}' -- 12.0  [6] (🦥..🦪)    sloth..oyster
        , Range.range '\u{1F9AB}' '\u{1F9AD}' --   NA  [3] (🦫..🦭)    <reserved-1F9AB>..<reserved-1F9AD>
        , Range.range '\u{1F9AE}' '\u{1F9AF}' -- 12.0  [2] (🦮..🦯)    guide dog..probing cane
        , Range.range '\u{1F9B0}' '\u{1F9B9}' -- 11.0 [10] (🦰..🦹)    red hair..supervillain
        , Range.range '\u{1F9BA}' '\u{1F9BF}' -- 12.0  [6] (🦺..🦿)    safety vest..mechanical leg
        , Range.point '\u{1F9C0}' --  8.0  [1] (🧀)       cheese wedge
        , Range.range '\u{1F9C1}' '\u{1F9C2}' -- 11.0  [2] (🧁..🧂)    cupcake..salt
        , Range.range '\u{1F9C3}' '\u{1F9CA}' -- 12.0  [8] (🧃..🧊)    beverage box..ice cube
        , Range.range '\u{1F9CB}' '\u{1F9CC}' --   NA  [2] (🧋..🧌)    <reserved-1F9CB>..<reserved-1F9CC>
        , Range.range '\u{1F9CD}' '\u{1F9CF}' -- 12.0  [3] (🧍..🧏)    person standing..deaf person
        , Range.range '\u{1F9D0}' '\u{1F9E6}' -- 10.0 [23] (🧐..🧦)    face with monocle..socks
        , Range.range '\u{1F9E7}' '\u{1F9FF}' -- 11.0 [25] (🧧..🧿)    red envelope..nazar amulet
        , Range.range '\u{1FA00}' '\u{1FA53}' -- 12.0 [84] (🨀..🩓)    NEUTRAL CHESS KING..BLACK CHESS KNIGHT-BISHOP
        , Range.range '\u{1FA54}' '\u{1FA5F}' --   NA [12] (🩔..🩟)    <reserved-1FA54>..<reserved-1FA5F>
        , Range.range '\u{1FA60}' '\u{1FA6D}' -- 11.0 [14] (🩠..🩭)    XIANGQI RED GENERAL..XIANGQI BLACK SOLDIER
        , Range.range '\u{1FA6E}' '\u{1FA6F}' --   NA  [2] (🩮..🩯)    <reserved-1FA6E>..<reserved-1FA6F>
        , Range.range '\u{1FA70}' '\u{1FA73}' -- 12.0  [4] (🩰..🩳)    ballet shoes..shorts
        , Range.range '\u{1FA74}' '\u{1FA77}' --   NA  [4] (🩴..🩷)    <reserved-1FA74>..<reserved-1FA77>
        , Range.range '\u{1FA78}' '\u{1FA7A}' -- 12.0  [3] (🩸..🩺)    drop of blood..stethoscope
        , Range.range '\u{1FA7B}' '\u{1FA7F}' --   NA  [5] (🩻..🩿)    <reserved-1FA7B>..<reserved-1FA7F>
        , Range.range '\u{1FA80}' '\u{1FA82}' -- 12.0  [3] (🪀..🪂)    yo-yo..parachute
        , Range.range '\u{1FA83}' '\u{1FA8F}' --   NA [13] (🪃..🪏)    <reserved-1FA83>..<reserved-1FA8F>
        , Range.range '\u{1FA90}' '\u{1FA95}' -- 12.0  [6] (🪐..🪕)    ringed planet..banjo
        , Range.range '\u{1FA96}' '\u{1FFFD}' --   NA[1384] (🪖..🿽)   <reserved-1FA96>..<reserved-1FFFD>
        ]
