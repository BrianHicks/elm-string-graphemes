module String.Graphemes.Data.Extended_Pictographic exposing (chars, match, parser)

{-| Hey, this module was generated automatically. Please don't edit it.

Run `make src/String/Graphemes/Data/Extended_Pictographic.elm` instead!

-}

import Parser exposing (Parser)
import String.Graphemes.RangeSet as RangeSet exposing (RangeSet)
import String.Graphemes.RangeSet.Range as Range exposing (Range)


parser : Parser ()
parser =
    Parser.chompIf match


match : Char -> Bool
match c =
    RangeSet.member c chars


chars : RangeSet Char
chars =
    RangeSet.fromList (points ++ ranges)


points : List (Range Char)
points =
    List.map Range.point
        [ '©' --  1.1  [1] (©️)       copyright
        , '®' --  1.1  [1] (®️)       registered
        , '‼' --  1.1  [1] (‼️)       double exclamation mark
        , '⁉' --  3.0  [1] (⁉️)       exclamation question mark
        , '™' --  1.1  [1] (™️)       trade mark
        , 'ℹ' --  3.0  [1] (ℹ️)       information
        , '⌨' --  1.1  [1] (⌨️)       keyboard
        , '⎈' --  3.0  [1] (⎈)       HELM SYMBOL
        , '⏏' --  4.0  [1] (⏏️)       eject button
        , 'Ⓜ' --  1.1  [1] (Ⓜ️)       circled M
        , '▶' --  1.1  [1] (▶️)       play button
        , '◀' --  1.1  [1] (◀️)       reverse button
        , '☘' --  4.1  [1] (☘️)       shamrock
        , '☙' --  3.0  [1] (☙)       REVERSED ROTATED FLORAL HEART BULLET
        , '⚝' --  5.1  [1] (⚝)       OUTLINED WHITE STAR
        , '⚲' --  5.0  [1] (⚲)       NEUTER
        , '⛎' --  6.0  [1] (⛎)       Ophiuchus
        , '⛢' --  6.0  [1] (⛢)       ASTRONOMICAL SYMBOL FOR URANUS
        , '⛣' --  5.2  [1] (⛣)       HEAVY CIRCLE WITH STROKE AND TWO DOTS ABOVE
        , '✀' --  7.0  [1] (✀)       BLACK SAFETY SCISSORS
        , '✅' --  6.0  [1] (✅)       check mark button
        , '✔' --  1.1  [1] (✔️)       check mark
        , '✖' --  1.1  [1] (✖️)       multiplication sign
        , '✝' --  1.1  [1] (✝️)       latin cross
        , '✡' --  1.1  [1] (✡️)       star of David
        , '✨' --  6.0  [1] (✨)       sparkles
        , '❄' --  1.1  [1] (❄️)       snowflake
        , '❇' --  1.1  [1] (❇️)       sparkle
        , '❌' --  6.0  [1] (❌)       cross mark
        , '❎' --  6.0  [1] (❎)       cross mark button
        , '❗' --  5.2  [1] (❗)       exclamation mark
        , '➡' --  1.1  [1] (➡️)       right arrow
        , '➰' --  6.0  [1] (➰)       curly loop
        , '➿' --  6.0  [1] (➿)       double curly loop
        , '⭐' --  5.1  [1] (⭐)       star
        , '⭕' --  5.2  [1] (⭕)       hollow red circle
        , '〰' --  1.1  [1] (〰️)       wavy dash
        , '〽' --  3.2  [1] (〽️)       part alternation mark
        , '㊗' --  1.1  [1] (㊗️)       Japanese “congratulations” button
        , '㊙' --  1.1  [1] (㊙️)       Japanese “secret” button
        , '🂿' --  7.0  [1] (🂿)       PLAYING CARD RED JOKER
        , '\u{1F0C0}' --   NA  [1] (🃀)       <reserved-1F0C0>
        , '\u{1F0D0}' --   NA  [1] (🃐)       <reserved-1F0D0>
        , '\u{1F12F}' -- 11.0  [1] (🄯)       COPYLEFT SYMBOL
        , '\u{1F16C}' -- 12.0  [1] (🅬)       RAISED MR SIGN
        , '🅾' --  6.0  [1] (🅾️)       O button (blood type)
        , '🅿' --  5.2  [1] (🅿️)       P button
        , '🆎' --  6.0  [1] (🆎)       AB button (blood type)
        , '🈚' --  5.2  [1] (🈚)       Japanese “free of charge” button
        , '🈯' --  5.2  [1] (🈯)       Japanese “reserved” button
        , '🌶' --  7.0  [1] (🌶️)       hot pepper
        , '🍽' --  7.0  [1] (🍽️)       fork and knife with plate
        , '🏅' --  7.0  [1] (🏅)       sports medal
        , '🐿' --  7.0  [1] (🐿️)       chipmunk
        , '👀' --  6.0  [1] (👀)       eyes
        , '👁' --  7.0  [1] (👁️)       eye
        , '📸' --  7.0  [1] (📸)       camera with flash
        , '\u{1F4FF}' --  8.0  [1] (📿)       prayer beads
        , '\u{1F57A}' --  9.0  [1] (🕺)       man dancing
        , '\u{1F5A4}' --  9.0  [1] (🖤)       black heart
        , '😀' --  6.1  [1] (😀)       grinning face
        , '😑' --  6.1  [1] (😑)       expressionless face
        , '😕' --  6.1  [1] (😕)       confused face
        , '😖' --  6.0  [1] (😖)       confounded face
        , '😗' --  6.1  [1] (😗)       kissing face
        , '😘' --  6.0  [1] (😘)       face blowing a kiss
        , '😙' --  6.1  [1] (😙)       kissing face with smiling eyes
        , '😚' --  6.0  [1] (😚)       kissing face with closed eyes
        , '😛' --  6.1  [1] (😛)       face with tongue
        , '😟' --  6.1  [1] (😟)       worried face
        , '😬' --  6.1  [1] (😬)       grimacing face
        , '😭' --  6.0  [1] (😭)       loudly crying face
        , '😴' --  6.1  [1] (😴)       sleeping face
        , '\u{1F6D0}' --  8.0  [1] (🛐)       place of worship
        , '\u{1F6D5}' -- 12.0  [1] (🛕)       hindu temple
        , '\u{1F6F9}' -- 11.0  [1] (🛹)       skateboard
        , '\u{1F6FA}' -- 12.0  [1] (🛺)       auto rickshaw
        , '\u{1F90C}' --   NA  [1] (🤌)       <reserved-1F90C>
        , '\u{1F91F}' -- 10.0  [1] (🤟)       love-you gesture
        , '\u{1F930}' --  9.0  [1] (🤰)       pregnant woman
        , '\u{1F93F}' -- 12.0  [1] (🤿)       diving mask
        , '\u{1F94C}' -- 10.0  [1] (🥌)       curling stone
        , '\u{1F971}' -- 12.0  [1] (🥱)       yawning face
        , '\u{1F972}' --   NA  [1] (🥲)       <reserved-1F972>
        , '\u{1F97A}' -- 11.0  [1] (🥺)       pleading face
        , '\u{1F97B}' -- 12.0  [1] (🥻)       sari
        , '\u{1F9C0}' --  8.0  [1] (🧀)       cheese wedge
        ]


ranges : List (Range Char)
ranges =
    List.map (\( low, high ) -> Range.range low high)
        [ ( '↔', '↙' ) --  1.1  [6] (↔️..↙️)    left-right arrow..down-left arrow
        , ( '↩', '↪' ) --  1.1  [2] (↩️..↪️)    right arrow curving left..left arrow curving right
        , ( '⌚', '⌛' ) --  1.1  [2] (⌚..⌛)    watch..hourglass done
        , ( '⏩', '⏳' ) --  6.0 [11] (⏩..⏳)    fast-forward button..hourglass not done
        , ( '⏸', '⏺' ) --  7.0  [3] (⏸️..⏺️)    pause button..record button
        , ( '▪', '▫' ) --  1.1  [2] (▪️..▫️)    black small square..white small square
        , ( '◻', '◾' ) --  3.2  [4] (◻️..◾)    white medium square..black medium-small square
        , ( '☀', '★' ) --  1.1  [6] (☀️..★)    sun..BLACK STAR
        , ( '☇', '☒' ) --  1.1 [12] (☇..☒)    LIGHTNING..BALLOT BOX WITH X
        , ( '☔', '☕' ) --  4.0  [2] (☔..☕)    umbrella with rain drops..hot beverage
        , ( '☖', '☗' ) --  3.2  [2] (☖..☗)    WHITE SHOGI PIECE..BLACK SHOGI PIECE
        , ( '☚', '♯' ) --  1.1 [86] (☚..♯)    BLACK LEFT POINTING INDEX..MUSIC SHARP SIGN
        , ( '♰', '♱' ) --  3.0  [2] (♰..♱)    WEST SYRIAC CROSS..EAST SYRIAC CROSS
        , ( '♲', '♽' ) --  3.2 [12] (♲..♽)    UNIVERSAL RECYCLING SYMBOL..PARTIALLY-RECYCLED PAPER SYMBOL
        , ( '♾', '♿' ) --  4.1  [2] (♾️..♿)    infinity..wheelchair symbol
        , ( '⚀', '⚅' ) --  3.2  [6] (⚀..⚅)    DIE FACE-1..DIE FACE-6
        , ( '⚐', '⚑' ) --  4.0  [2] (⚐..⚑)    WHITE FLAG..BLACK FLAG
        , ( '⚒', '⚜' ) --  4.1 [11] (⚒️..⚜️)    hammer and pick..fleur-de-lis
        , ( '⚞', '⚟' ) --  5.2  [2] (⚞..⚟)    THREE LINES CONVERGING RIGHT..THREE LINES CONVERGING LEFT
        , ( '⚠', '⚡' ) --  4.0  [2] (⚠️..⚡)    warning..high voltage
        , ( '⚢', '⚱' ) --  4.1 [16] (⚢..⚱️)    DOUBLED FEMALE SIGN..funeral urn
        , ( '⚳', '⚼' ) --  5.1 [10] (⚳..⚼)    CERES..SESQUIQUADRATE
        , ( '⚽', '⚿' ) --  5.2  [3] (⚽..⚿)    soccer ball..SQUARED KEY
        , ( '⛀', '⛃' ) --  5.1  [4] (⛀..⛃)    WHITE DRAUGHTS MAN..BLACK DRAUGHTS KING
        , ( '⛄', '⛍' ) --  5.2 [10] (⛄..⛍)    snowman without snow..DISABLED CAR
        , ( '⛏', '⛡' ) --  5.2 [19] (⛏️..⛡)    pick..RESTRICTED LEFT ENTRY-2
        , ( '⛤', '⛧' ) --  6.0  [4] (⛤..⛧)    PENTAGRAM..INVERTED PENTAGRAM
        , ( '⛨', '⛿' ) --  5.2 [24] (⛨..⛿)    BLACK CROSS ON SHIELD..WHITE FLAG WITH HORIZONTAL MIDDLE BLACK STRIPE
        , ( '✁', '✄' ) --  1.1  [4] (✁..✄)    UPPER BLADE SCISSORS..WHITE SCISSORS
        , ( '✈', '✉' ) --  1.1  [2] (✈️..✉️)    airplane..envelope
        , ( '✊', '✋' ) --  6.0  [2] (✊..✋)    raised fist..raised hand
        , ( '✌', '✒' ) --  1.1  [7] (✌️..✒️)    victory hand..black nib
        , ( '✳', '✴' ) --  1.1  [2] (✳️..✴️)    eight-spoked asterisk..eight-pointed star
        , ( '❓', '❕' ) --  6.0  [3] (❓..❕)    question mark..white exclamation mark
        , ( '❣', '❧' ) --  1.1  [5] (❣️..❧)    heart exclamation..ROTATED FLORAL HEART BULLET
        , ( '➕', '➗' ) --  6.0  [3] (➕..➗)    plus sign..division sign
        , ( '⤴', '⤵' ) --  3.2  [2] (⤴️..⤵️)    right arrow curving up..right arrow curving down
        , ( '⬅', '⬇' ) --  4.0  [3] (⬅️..⬇️)    left arrow..down arrow
        , ( '⬛', '⬜' ) --  5.1  [2] (⬛..⬜)    black large square..white large square
        , ( '🀀', '🀫' ) --  5.1 [44] (🀀..🀫)    MAHJONG TILE EAST WIND..MAHJONG TILE BACK
        , ( '\u{1F02C}', '\u{1F02F}' ) --   NA  [4] (🀬..🀯)    <reserved-1F02C>..<reserved-1F02F>
        , ( '🀰', '🂓' ) --  5.1[100] (🀰..🂓)    DOMINO TILE HORIZONTAL BACK..DOMINO TILE VERTICAL-06-06
        , ( '\u{1F094}', '\u{1F09F}' ) --   NA [12] (🂔..🂟)    <reserved-1F094>..<reserved-1F09F>
        , ( '🂠', '🂮' ) --  6.0 [15] (🂠..🂮)    PLAYING CARD BACK..PLAYING CARD KING OF SPADES
        , ( '\u{1F0AF}', '\u{1F0B0}' ) --   NA  [2] (🂯..🂰)    <reserved-1F0AF>..<reserved-1F0B0>
        , ( '🂱', '🂾' ) --  6.0 [14] (🂱..🂾)    PLAYING CARD ACE OF HEARTS..PLAYING CARD KING OF HEARTS
        , ( '🃁', '🃏' ) --  6.0 [15] (🃁..🃏)    PLAYING CARD ACE OF DIAMONDS..joker
        , ( '🃑', '🃟' ) --  6.0 [15] (🃑..🃟)    PLAYING CARD ACE OF CLUBS..PLAYING CARD WHITE JOKER
        , ( '🃠', '🃵' ) --  7.0 [22] (🃠..🃵)    PLAYING CARD FOOL..PLAYING CARD TRUMP-21
        , ( '\u{1F0F6}', '\u{1F0FF}' ) --   NA [10] (🃶..🃿)    <reserved-1F0F6>..<reserved-1F0FF>
        , ( '\u{1F10D}', '\u{1F10F}' ) --   NA  [3] (🄍..🄏)    <reserved-1F10D>..<reserved-1F10F>
        , ( '\u{1F16D}', '\u{1F16F}' ) --   NA  [3] (🅭..🅯)    <reserved-1F16D>..<reserved-1F16F>
        , ( '🅰', '🅱' ) --  6.0  [2] (🅰️..🅱️)    A button (blood type)..B button (blood type)
        , ( '🆑', '🆚' ) --  6.0 [10] (🆑..🆚)    CL button..VS button
        , ( '\u{1F1AD}', '\u{1F1E5}' ) --   NA [57] (🆭..🇥)    <reserved-1F1AD>..<reserved-1F1E5>
        , ( '🈁', '🈂' ) --  6.0  [2] (🈁..🈂️)    Japanese “here” button..Japanese “service charge” button
        , ( '\u{1F203}', '\u{1F20F}' ) --   NA [13] (🈃..🈏)    <reserved-1F203>..<reserved-1F20F>
        , ( '🈲', '🈺' ) --  6.0  [9] (🈲..🈺)    Japanese “prohibited” button..Japanese “open for business” button
        , ( '\u{1F23C}', '\u{1F23F}' ) --   NA  [4] (🈼..🈿)    <reserved-1F23C>..<reserved-1F23F>
        , ( '\u{1F249}', '\u{1F24F}' ) --   NA  [7] (🉉..🉏)    <reserved-1F249>..<reserved-1F24F>
        , ( '🉐', '🉑' ) --  6.0  [2] (🉐..🉑)    Japanese “bargain” button..Japanese “acceptable” button
        , ( '\u{1F252}', '\u{1F25F}' ) --   NA [14] (🉒..🉟)    <reserved-1F252>..<reserved-1F25F>
        , ( '\u{1F260}', '\u{1F265}' ) -- 10.0  [6] (🉠..🉥)    ROUNDED SYMBOL FOR FU..ROUNDED SYMBOL FOR CAI
        , ( '\u{1F266}', '\u{1F2FF}' ) --   NA[154] (🉦..🋿)    <reserved-1F266>..<reserved-1F2FF>
        , ( '🌀', '🌠' ) --  6.0 [33] (🌀..🌠)    cyclone..shooting star
        , ( '🌡', '🌬' ) --  7.0 [12] (🌡️..🌬️)    thermometer..wind face
        , ( '\u{1F32D}', '\u{1F32F}' ) --  8.0  [3] (🌭..🌯)    hot dog..burrito
        , ( '🌰', '🌵' ) --  6.0  [6] (🌰..🌵)    chestnut..cactus
        , ( '🌷', '🍼' ) --  6.0 [70] (🌷..🍼)    tulip..baby bottle
        , ( '\u{1F37E}', '\u{1F37F}' ) --  8.0  [2] (🍾..🍿)    bottle with popping cork..popcorn
        , ( '🎀', '🎓' ) --  6.0 [20] (🎀..🎓)    ribbon..graduation cap
        , ( '🎔', '🎟' ) --  7.0 [12] (🎔..🎟️)    HEART WITH TIP ON THE LEFT..admission tickets
        , ( '🎠', '🏄' ) --  6.0 [37] (🎠..🏄)    carousel horse..person surfing
        , ( '🏆', '🏊' ) --  6.0  [5] (🏆..🏊)    trophy..person swimming
        , ( '🏋', '🏎' ) --  7.0  [4] (🏋️..🏎️)    person lifting weights..racing car
        , ( '\u{1F3CF}', '\u{1F3D3}' ) --  8.0  [5] (🏏..🏓)    cricket game..ping pong
        , ( '🏔', '🏟' ) --  7.0 [12] (🏔️..🏟️)    snow-capped mountain..stadium
        , ( '🏠', '🏰' ) --  6.0 [17] (🏠..🏰)    house..castle
        , ( '🏱', '🏷' ) --  7.0  [7] (🏱..🏷️)    WHITE PENNANT..label
        , ( '\u{1F3F8}', '\u{1F3FA}' ) --  8.0  [3] (🏸..🏺)    badminton..amphora
        , ( '🐀', '🐾' ) --  6.0 [63] (🐀..🐾)    rat..paw prints
        , ( '👂', '📷' ) --  6.0[182] (👂..📷)    ear..camera
        , ( '📹', '📼' ) --  6.0  [4] (📹..📼)    video camera..videocassette
        , ( '📽', '📾' ) --  7.0  [2] (📽️..📾)    film projector..PORTABLE STEREO
        , ( '🔀', '🔽' ) --  6.0 [62] (🔀..🔽)    shuffle tracks button..downwards button
        , ( '🕆', '🕊' ) --  7.0  [5] (🕆..🕊️)    WHITE LATIN CROSS..dove
        , ( '\u{1F54B}', '\u{1F54F}' ) --  8.0  [5] (🕋..🕏)    kaaba..BOWL OF HYGIEIA
        , ( '🕐', '🕧' ) --  6.0 [24] (🕐..🕧)    one o’clock..twelve-thirty
        , ( '🕨', '🕹' ) --  7.0 [18] (🕨..🕹️)    RIGHT SPEAKER..joystick
        , ( '🕻', '🖣' ) --  7.0 [41] (🕻..🖣)    LEFT HAND TELEPHONE RECEIVER..BLACK DOWN POINTING BACKHAND INDEX
        , ( '🖥', '🗺' ) --  7.0 [86] (🖥️..🗺️)    desktop computer..world map
        , ( '🗻', '🗿' ) --  6.0  [5] (🗻..🗿)    mount fuji..moai
        , ( '😁', '😐' ) --  6.0 [16] (😁..😐)    beaming face with smiling eyes..neutral face
        , ( '😒', '😔' ) --  6.0  [3] (😒..😔)    unamused face..pensive face
        , ( '😜', '😞' ) --  6.0  [3] (😜..😞)    winking face with tongue..disappointed face
        , ( '😠', '😥' ) --  6.0  [6] (😠..😥)    angry face..sad but relieved face
        , ( '😦', '😧' ) --  6.1  [2] (😦..😧)    frowning face with open mouth..anguished face
        , ( '😨', '😫' ) --  6.0  [4] (😨..😫)    fearful face..tired face
        , ( '😮', '😯' ) --  6.1  [2] (😮..😯)    face with open mouth..hushed face
        , ( '😰', '😳' ) --  6.0  [4] (😰..😳)    anxious face with sweat..flushed face
        , ( '😵', '🙀' ) --  6.0 [12] (😵..🙀)    dizzy face..weary cat
        , ( '🙁', '🙂' ) --  7.0  [2] (🙁..🙂)    slightly frowning face..slightly smiling face
        , ( '\u{1F643}', '\u{1F644}' ) --  8.0  [2] (🙃..🙄)    upside-down face..face with rolling eyes
        , ( '🙅', '🙏' ) --  6.0 [11] (🙅..🙏)    person gesturing NO..folded hands
        , ( '🚀', '🛅' ) --  6.0 [70] (🚀..🛅)    rocket..left luggage
        , ( '🛆', '🛏' ) --  7.0 [10] (🛆..🛏️)    TRIANGLE WITH ROUNDED CORNERS..bed
        , ( '\u{1F6D1}', '\u{1F6D2}' ) --  9.0  [2] (🛑..🛒)    stop sign..shopping cart
        , ( '\u{1F6D3}', '\u{1F6D4}' ) -- 10.0  [2] (🛓..🛔)    STUPA..PAGODA
        , ( '\u{1F6D6}', '\u{1F6DF}' ) --   NA [10] (🛖..🛟)    <reserved-1F6D6>..<reserved-1F6DF>
        , ( '🛠', '🛬' ) --  7.0 [13] (🛠️..🛬)    hammer and wrench..airplane arrival
        , ( '\u{1F6ED}', '\u{1F6EF}' ) --   NA  [3] (🛭..🛯)    <reserved-1F6ED>..<reserved-1F6EF>
        , ( '🛰', '🛳' ) --  7.0  [4] (🛰️..🛳️)    satellite..passenger ship
        , ( '\u{1F6F4}', '\u{1F6F6}' ) --  9.0  [3] (🛴..🛶)    kick scooter..canoe
        , ( '\u{1F6F7}', '\u{1F6F8}' ) -- 10.0  [2] (🛷..🛸)    sled..flying saucer
        , ( '\u{1F6FB}', '\u{1F6FF}' ) --   NA  [5] (🛻..🛿)    <reserved-1F6FB>..<reserved-1F6FF>
        , ( '\u{1F774}', '\u{1F77F}' ) --   NA [12] (🝴..🝿)    <reserved-1F774>..<reserved-1F77F>
        , ( '\u{1F7D5}', '\u{1F7D8}' ) -- 11.0  [4] (🟕..🟘)    CIRCLED TRIANGLE..NEGATIVE CIRCLED SQUARE
        , ( '\u{1F7D9}', '\u{1F7DF}' ) --   NA  [7] (🟙..🟟)    <reserved-1F7D9>..<reserved-1F7DF>
        , ( '\u{1F7E0}', '\u{1F7EB}' ) -- 12.0 [12] (🟠..🟫)    orange circle..brown square
        , ( '\u{1F7EC}', '\u{1F7FF}' ) --   NA [20] (🟬..🟿)    <reserved-1F7EC>..<reserved-1F7FF>
        , ( '\u{1F80C}', '\u{1F80F}' ) --   NA  [4] (🠌..🠏)    <reserved-1F80C>..<reserved-1F80F>
        , ( '\u{1F848}', '\u{1F84F}' ) --   NA  [8] (🡈..🡏)    <reserved-1F848>..<reserved-1F84F>
        , ( '\u{1F85A}', '\u{1F85F}' ) --   NA  [6] (🡚..🡟)    <reserved-1F85A>..<reserved-1F85F>
        , ( '\u{1F888}', '\u{1F88F}' ) --   NA  [8] (🢈..🢏)    <reserved-1F888>..<reserved-1F88F>
        , ( '\u{1F8AE}', '\u{1F8FF}' ) --   NA [82] (🢮..🣿)    <reserved-1F8AE>..<reserved-1F8FF>
        , ( '\u{1F90D}', '\u{1F90F}' ) -- 12.0  [3] (🤍..🤏)    white heart..pinching hand
        , ( '\u{1F910}', '\u{1F918}' ) --  8.0  [9] (🤐..🤘)    zipper-mouth face..sign of the horns
        , ( '\u{1F919}', '\u{1F91E}' ) --  9.0  [6] (🤙..🤞)    call me hand..crossed fingers
        , ( '\u{1F920}', '\u{1F927}' ) --  9.0  [8] (🤠..🤧)    cowboy hat face..sneezing face
        , ( '\u{1F928}', '\u{1F92F}' ) -- 10.0  [8] (🤨..🤯)    face with raised eyebrow..exploding head
        , ( '\u{1F931}', '\u{1F932}' ) -- 10.0  [2] (🤱..🤲)    breast-feeding..palms up together
        , ( '\u{1F933}', '\u{1F93A}' ) --  9.0  [8] (🤳..🤺)    selfie..person fencing
        , ( '\u{1F93C}', '\u{1F93E}' ) --  9.0  [3] (🤼..🤾)    people wrestling..person playing handball
        , ( '\u{1F940}', '\u{1F945}' ) --  9.0  [6] (🥀..🥅)    wilted flower..goal net
        , ( '\u{1F947}', '\u{1F94B}' ) --  9.0  [5] (🥇..🥋)    1st place medal..martial arts uniform
        , ( '\u{1F94D}', '\u{1F94F}' ) -- 11.0  [3] (🥍..🥏)    lacrosse..flying disc
        , ( '\u{1F950}', '\u{1F95E}' ) --  9.0 [15] (🥐..🥞)    croissant..pancakes
        , ( '\u{1F95F}', '\u{1F96B}' ) -- 10.0 [13] (🥟..🥫)    dumpling..canned food
        , ( '\u{1F96C}', '\u{1F970}' ) -- 11.0  [5] (🥬..🥰)    leafy green..smiling face with hearts
        , ( '\u{1F973}', '\u{1F976}' ) -- 11.0  [4] (🥳..🥶)    partying face..cold face
        , ( '\u{1F977}', '\u{1F979}' ) --   NA  [3] (🥷..🥹)    <reserved-1F977>..<reserved-1F979>
        , ( '\u{1F97C}', '\u{1F97F}' ) -- 11.0  [4] (🥼..🥿)    lab coat..flat shoe
        , ( '\u{1F980}', '\u{1F984}' ) --  8.0  [5] (🦀..🦄)    crab..unicorn
        , ( '\u{1F985}', '\u{1F991}' ) --  9.0 [13] (🦅..🦑)    eagle..squid
        , ( '\u{1F992}', '\u{1F997}' ) -- 10.0  [6] (🦒..🦗)    giraffe..cricket
        , ( '\u{1F998}', '\u{1F9A2}' ) -- 11.0 [11] (🦘..🦢)    kangaroo..swan
        , ( '\u{1F9A3}', '\u{1F9A4}' ) --   NA  [2] (🦣..🦤)    <reserved-1F9A3>..<reserved-1F9A4>
        , ( '\u{1F9A5}', '\u{1F9AA}' ) -- 12.0  [6] (🦥..🦪)    sloth..oyster
        , ( '\u{1F9AB}', '\u{1F9AD}' ) --   NA  [3] (🦫..🦭)    <reserved-1F9AB>..<reserved-1F9AD>
        , ( '\u{1F9AE}', '\u{1F9AF}' ) -- 12.0  [2] (🦮..🦯)    guide dog..probing cane
        , ( '\u{1F9B0}', '\u{1F9B9}' ) -- 11.0 [10] (🦰..🦹)    red hair..supervillain
        , ( '\u{1F9BA}', '\u{1F9BF}' ) -- 12.0  [6] (🦺..🦿)    safety vest..mechanical leg
        , ( '\u{1F9C1}', '\u{1F9C2}' ) -- 11.0  [2] (🧁..🧂)    cupcake..salt
        , ( '\u{1F9C3}', '\u{1F9CA}' ) -- 12.0  [8] (🧃..🧊)    beverage box..ice cube
        , ( '\u{1F9CB}', '\u{1F9CC}' ) --   NA  [2] (🧋..🧌)    <reserved-1F9CB>..<reserved-1F9CC>
        , ( '\u{1F9CD}', '\u{1F9CF}' ) -- 12.0  [3] (🧍..🧏)    person standing..deaf person
        , ( '\u{1F9D0}', '\u{1F9E6}' ) -- 10.0 [23] (🧐..🧦)    face with monocle..socks
        , ( '\u{1F9E7}', '\u{1F9FF}' ) -- 11.0 [25] (🧧..🧿)    red envelope..nazar amulet
        , ( '\u{1FA00}', '\u{1FA53}' ) -- 12.0 [84] (🨀..🩓)    NEUTRAL CHESS KING..BLACK CHESS KNIGHT-BISHOP
        , ( '\u{1FA54}', '\u{1FA5F}' ) --   NA [12] (🩔..🩟)    <reserved-1FA54>..<reserved-1FA5F>
        , ( '\u{1FA60}', '\u{1FA6D}' ) -- 11.0 [14] (🩠..🩭)    XIANGQI RED GENERAL..XIANGQI BLACK SOLDIER
        , ( '\u{1FA6E}', '\u{1FA6F}' ) --   NA  [2] (🩮..🩯)    <reserved-1FA6E>..<reserved-1FA6F>
        , ( '\u{1FA70}', '\u{1FA73}' ) -- 12.0  [4] (🩰..🩳)    ballet shoes..shorts
        , ( '\u{1FA74}', '\u{1FA77}' ) --   NA  [4] (🩴..🩷)    <reserved-1FA74>..<reserved-1FA77>
        , ( '\u{1FA78}', '\u{1FA7A}' ) -- 12.0  [3] (🩸..🩺)    drop of blood..stethoscope
        , ( '\u{1FA7B}', '\u{1FA7F}' ) --   NA  [5] (🩻..🩿)    <reserved-1FA7B>..<reserved-1FA7F>
        , ( '\u{1FA80}', '\u{1FA82}' ) -- 12.0  [3] (🪀..🪂)    yo-yo..parachute
        , ( '\u{1FA83}', '\u{1FA8F}' ) --   NA [13] (🪃..🪏)    <reserved-1FA83>..<reserved-1FA8F>
        , ( '\u{1FA90}', '\u{1FA95}' ) -- 12.0  [6] (🪐..🪕)    ringed planet..banjo
        , ( '\u{1FA96}', '\u{1FFFD}' ) --   NA[1384] (🪖..🿽)   <reserved-1FA96>..<reserved-1FFFD>
        ]
