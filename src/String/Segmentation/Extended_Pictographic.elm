module String.Segmentation.Extended_Pictographic exposing (chars, parser)

import Parser exposing (Parser)
import Set exposing (Set)


parser : Parser ()
parser =
    Parser.chompIf (\c -> Set.member c chars)


chars : Set Char
chars =
    [ [ 0xA9 ] --  1.1  [1] (©️)       copyright
    , [ 0xAE ] --  1.1  [1] (®️)       registered
    , [ 0x203C ] --  1.1  [1] (‼️)       double exclamation mark
    , [ 0x2049 ] --  3.0  [1] (⁉️)       exclamation question mark
    , [ 0x2122 ] --  1.1  [1] (™️)       trade mark
    , [ 0x2139 ] --  3.0  [1] (ℹ️)       information
    , List.range 0x2194 0x2199 --  1.1  [6] (↔️..↙️)    left-right arrow..down-left arrow
    , List.range 0x21A9 0x21AA --  1.1  [2] (↩️..↪️)    right arrow curving left..left arrow curving right
    , List.range 0x231A 0x231B --  1.1  [2] (⌚..⌛)    watch..hourglass done
    , [ 0x2328 ] --  1.1  [1] (⌨️)       keyboard
    , [ 0x2388 ] --  3.0  [1] (⎈)       HELM SYMBOL
    , [ 0x23CF ] --  4.0  [1] (⏏️)       eject button
    , List.range 0x23E9 0x23F3 --  6.0 [11] (⏩..⏳)    fast-forward button..hourglass not done
    , List.range 0x23F8 0x23FA --  7.0  [3] (⏸️..⏺️)    pause button..record button
    , [ 0x24C2 ] --  1.1  [1] (Ⓜ️)       circled M
    , List.range 0x25AA 0x25AB --  1.1  [2] (▪️..▫️)    black small square..white small square
    , [ 0x25B6 ] --  1.1  [1] (▶️)       play button
    , [ 0x25C0 ] --  1.1  [1] (◀️)       reverse button
    , List.range 0x25FB 0x25FE --  3.2  [4] (◻️..◾)    white medium square..black medium-small square
    , List.range 0x2600 0x2605 --  1.1  [6] (☀️..★)    sun..BLACK STAR
    , List.range 0x2607 0x2612 --  1.1 [12] (☇..☒)    LIGHTNING..BALLOT BOX WITH X
    , List.range 0x2614 0x2615 --  4.0  [2] (☔..☕)    umbrella with rain drops..hot beverage
    , List.range 0x2616 0x2617 --  3.2  [2] (☖..☗)    WHITE SHOGI PIECE..BLACK SHOGI PIECE
    , [ 0x2618 ] --  4.1  [1] (☘️)       shamrock
    , [ 0x2619 ] --  3.0  [1] (☙)       REVERSED ROTATED FLORAL HEART BULLET
    , List.range 0x261A 0x266F --  1.1 [86] (☚..♯)    BLACK LEFT POINTING INDEX..MUSIC SHARP SIGN
    , List.range 0x2670 0x2671 --  3.0  [2] (♰..♱)    WEST SYRIAC CROSS..EAST SYRIAC CROSS
    , List.range 0x2672 0x267D --  3.2 [12] (♲..♽)    UNIVERSAL RECYCLING SYMBOL..PARTIALLY-RECYCLED PAPER SYMBOL
    , List.range 0x267E 0x267F --  4.1  [2] (♾️..♿)    infinity..wheelchair symbol
    , List.range 0x2680 0x2685 --  3.2  [6] (⚀..⚅)    DIE FACE-1..DIE FACE-6
    , List.range 0x2690 0x2691 --  4.0  [2] (⚐..⚑)    WHITE FLAG..BLACK FLAG
    , List.range 0x2692 0x269C --  4.1 [11] (⚒️..⚜️)    hammer and pick..fleur-de-lis
    , [ 0x269D ] --  5.1  [1] (⚝)       OUTLINED WHITE STAR
    , List.range 0x269E 0x269F --  5.2  [2] (⚞..⚟)    THREE LINES CONVERGING RIGHT..THREE LINES CONVERGING LEFT
    , List.range 0x26A0 0x26A1 --  4.0  [2] (⚠️..⚡)    warning..high voltage
    , List.range 0x26A2 0x26B1 --  4.1 [16] (⚢..⚱️)    DOUBLED FEMALE SIGN..funeral urn
    , [ 0x26B2 ] --  5.0  [1] (⚲)       NEUTER
    , List.range 0x26B3 0x26BC --  5.1 [10] (⚳..⚼)    CERES..SESQUIQUADRATE
    , List.range 0x26BD 0x26BF --  5.2  [3] (⚽..⚿)    soccer ball..SQUARED KEY
    , List.range 0x26C0 0x26C3 --  5.1  [4] (⛀..⛃)    WHITE DRAUGHTS MAN..BLACK DRAUGHTS KING
    , List.range 0x26C4 0x26CD --  5.2 [10] (⛄..⛍)    snowman without snow..DISABLED CAR
    , [ 0x26CE ] --  6.0  [1] (⛎)       Ophiuchus
    , List.range 0x26CF 0x26E1 --  5.2 [19] (⛏️..⛡)    pick..RESTRICTED LEFT ENTRY-2
    , [ 0x26E2 ] --  6.0  [1] (⛢)       ASTRONOMICAL SYMBOL FOR URANUS
    , [ 0x26E3 ] --  5.2  [1] (⛣)       HEAVY CIRCLE WITH STROKE AND TWO DOTS ABOVE
    , List.range 0x26E4 0x26E7 --  6.0  [4] (⛤..⛧)    PENTAGRAM..INVERTED PENTAGRAM
    , List.range 0x26E8 0x26FF --  5.2 [24] (⛨..⛿)    BLACK CROSS ON SHIELD..WHITE FLAG WITH HORIZONTAL MIDDLE BLACK STRIPE
    , [ 0x2700 ] --  7.0  [1] (✀)       BLACK SAFETY SCISSORS
    , List.range 0x2701 0x2704 --  1.1  [4] (✁..✄)    UPPER BLADE SCISSORS..WHITE SCISSORS
    , [ 0x2705 ] --  6.0  [1] (✅)       check mark button
    , List.range 0x2708 0x2709 --  1.1  [2] (✈️..✉️)    airplane..envelope
    , List.range 0x270A 0x270B --  6.0  [2] (✊..✋)    raised fist..raised hand
    , List.range 0x270C 0x2712 --  1.1  [7] (✌️..✒️)    victory hand..black nib
    , [ 0x2714 ] --  1.1  [1] (✔️)       check mark
    , [ 0x2716 ] --  1.1  [1] (✖️)       multiplication sign
    , [ 0x271D ] --  1.1  [1] (✝️)       latin cross
    , [ 0x2721 ] --  1.1  [1] (✡️)       star of David
    , [ 0x2728 ] --  6.0  [1] (✨)       sparkles
    , List.range 0x2733 0x2734 --  1.1  [2] (✳️..✴️)    eight-spoked asterisk..eight-pointed star
    , [ 0x2744 ] --  1.1  [1] (❄️)       snowflake
    , [ 0x2747 ] --  1.1  [1] (❇️)       sparkle
    , [ 0x274C ] --  6.0  [1] (❌)       cross mark
    , [ 0x274E ] --  6.0  [1] (❎)       cross mark button
    , List.range 0x2753 0x2755 --  6.0  [3] (❓..❕)    question mark..white exclamation mark
    , [ 0x2757 ] --  5.2  [1] (❗)       exclamation mark
    , List.range 0x2763 0x2767 --  1.1  [5] (❣️..❧)    heart exclamation..ROTATED FLORAL HEART BULLET
    , List.range 0x2795 0x2797 --  6.0  [3] (➕..➗)    plus sign..division sign
    , [ 0x27A1 ] --  1.1  [1] (➡️)       right arrow
    , [ 0x27B0 ] --  6.0  [1] (➰)       curly loop
    , [ 0x27BF ] --  6.0  [1] (➿)       double curly loop
    , List.range 0x2934 0x2935 --  3.2  [2] (⤴️..⤵️)    right arrow curving up..right arrow curving down
    , List.range 0x2B05 0x2B07 --  4.0  [3] (⬅️..⬇️)    left arrow..down arrow
    , List.range 0x2B1B 0x2B1C --  5.1  [2] (⬛..⬜)    black large square..white large square
    , [ 0x2B50 ] --  5.1  [1] (⭐)       star
    , [ 0x2B55 ] --  5.2  [1] (⭕)       hollow red circle
    , [ 0x3030 ] --  1.1  [1] (〰️)       wavy dash
    , [ 0x303D ] --  3.2  [1] (〽️)       part alternation mark
    , [ 0x3297 ] --  1.1  [1] (㊗️)       Japanese “congratulations” button
    , [ 0x3299 ] --  1.1  [1] (㊙️)       Japanese “secret” button
    , List.range 0x0001F000 0x0001F02B --  5.1 [44] (🀀..🀫)    MAHJONG TILE EAST WIND..MAHJONG TILE BACK
    , List.range 0x0001F02C 0x0001F02F --   NA  [4] (🀬..🀯)    <reserved-1F02C>..<reserved-1F02F>
    , List.range 0x0001F030 0x0001F093 --  5.1[100] (🀰..🂓)    DOMINO TILE HORIZONTAL BACK..DOMINO TILE VERTICAL-06-06
    , List.range 0x0001F094 0x0001F09F --   NA [12] (🂔..🂟)    <reserved-1F094>..<reserved-1F09F>
    , List.range 0x0001F0A0 0x0001F0AE --  6.0 [15] (🂠..🂮)    PLAYING CARD BACK..PLAYING CARD KING OF SPADES
    , List.range 0x0001F0AF 0x0001F0B0 --   NA  [2] (🂯..🂰)    <reserved-1F0AF>..<reserved-1F0B0>
    , List.range 0x0001F0B1 0x0001F0BE --  6.0 [14] (🂱..🂾)    PLAYING CARD ACE OF HEARTS..PLAYING CARD KING OF HEARTS
    , [ 0x0001F0BF ] --  7.0  [1] (🂿)       PLAYING CARD RED JOKER
    , [ 0x0001F0C0 ] --   NA  [1] (🃀)       <reserved-1F0C0>
    , List.range 0x0001F0C1 0x0001F0CF --  6.0 [15] (🃁..🃏)    PLAYING CARD ACE OF DIAMONDS..joker
    , [ 0x0001F0D0 ] --   NA  [1] (🃐)       <reserved-1F0D0>
    , List.range 0x0001F0D1 0x0001F0DF --  6.0 [15] (🃑..🃟)    PLAYING CARD ACE OF CLUBS..PLAYING CARD WHITE JOKER
    , List.range 0x0001F0E0 0x0001F0F5 --  7.0 [22] (🃠..🃵)    PLAYING CARD FOOL..PLAYING CARD TRUMP-21
    , List.range 0x0001F0F6 0x0001F0FF --   NA [10] (🃶..🃿)    <reserved-1F0F6>..<reserved-1F0FF>
    , List.range 0x0001F10D 0x0001F10F --   NA  [3] (🄍..🄏)    <reserved-1F10D>..<reserved-1F10F>
    , [ 0x0001F12F ] -- 11.0  [1] (🄯)       COPYLEFT SYMBOL
    , [ 0x0001F16C ] -- 12.0  [1] (🅬)       RAISED MR SIGN
    , List.range 0x0001F16D 0x0001F16F --   NA  [3] (🅭..🅯)    <reserved-1F16D>..<reserved-1F16F>
    , List.range 0x0001F170 0x0001F171 --  6.0  [2] (🅰️..🅱️)    A button (blood type)..B button (blood type)
    , [ 0x0001F17E ] --  6.0  [1] (🅾️)       O button (blood type)
    , [ 0x0001F17F ] --  5.2  [1] (🅿️)       P button
    , [ 0x0001F18E ] --  6.0  [1] (🆎)       AB button (blood type)
    , List.range 0x0001F191 0x0001F19A --  6.0 [10] (🆑..🆚)    CL button..VS button
    , List.range 0x0001F1AD 0x0001F1E5 --   NA [57] (🆭..🇥)    <reserved-1F1AD>..<reserved-1F1E5>
    , List.range 0x0001F201 0x0001F202 --  6.0  [2] (🈁..🈂️)    Japanese “here” button..Japanese “service charge” button
    , List.range 0x0001F203 0x0001F20F --   NA [13] (🈃..🈏)    <reserved-1F203>..<reserved-1F20F>
    , [ 0x0001F21A ] --  5.2  [1] (🈚)       Japanese “free of charge” button
    , [ 0x0001F22F ] --  5.2  [1] (🈯)       Japanese “reserved” button
    , List.range 0x0001F232 0x0001F23A --  6.0  [9] (🈲..🈺)    Japanese “prohibited” button..Japanese “open for business” button
    , List.range 0x0001F23C 0x0001F23F --   NA  [4] (🈼..🈿)    <reserved-1F23C>..<reserved-1F23F>
    , List.range 0x0001F249 0x0001F24F --   NA  [7] (🉉..🉏)    <reserved-1F249>..<reserved-1F24F>
    , List.range 0x0001F250 0x0001F251 --  6.0  [2] (🉐..🉑)    Japanese “bargain” button..Japanese “acceptable” button
    , List.range 0x0001F252 0x0001F25F --   NA [14] (🉒..🉟)    <reserved-1F252>..<reserved-1F25F>
    , List.range 0x0001F260 0x0001F265 -- 10.0  [6] (🉠..🉥)    ROUNDED SYMBOL FOR FU..ROUNDED SYMBOL FOR CAI
    , List.range 0x0001F266 0x0001F2FF --   NA[154] (🉦..🋿)    <reserved-1F266>..<reserved-1F2FF>
    , List.range 0x0001F300 0x0001F320 --  6.0 [33] (🌀..🌠)    cyclone..shooting star
    , List.range 0x0001F321 0x0001F32C --  7.0 [12] (🌡️..🌬️)    thermometer..wind face
    , List.range 0x0001F32D 0x0001F32F --  8.0  [3] (🌭..🌯)    hot dog..burrito
    , List.range 0x0001F330 0x0001F335 --  6.0  [6] (🌰..🌵)    chestnut..cactus
    , [ 0x0001F336 ] --  7.0  [1] (🌶️)       hot pepper
    , List.range 0x0001F337 0x0001F37C --  6.0 [70] (🌷..🍼)    tulip..baby bottle
    , [ 0x0001F37D ] --  7.0  [1] (🍽️)       fork and knife with plate
    , List.range 0x0001F37E 0x0001F37F --  8.0  [2] (🍾..🍿)    bottle with popping cork..popcorn
    , List.range 0x0001F380 0x0001F393 --  6.0 [20] (🎀..🎓)    ribbon..graduation cap
    , List.range 0x0001F394 0x0001F39F --  7.0 [12] (🎔..🎟️)    HEART WITH TIP ON THE LEFT..admission tickets
    , List.range 0x0001F3A0 0x0001F3C4 --  6.0 [37] (🎠..🏄)    carousel horse..person surfing
    , [ 0x0001F3C5 ] --  7.0  [1] (🏅)       sports medal
    , List.range 0x0001F3C6 0x0001F3CA --  6.0  [5] (🏆..🏊)    trophy..person swimming
    , List.range 0x0001F3CB 0x0001F3CE --  7.0  [4] (🏋️..🏎️)    person lifting weights..racing car
    , List.range 0x0001F3CF 0x0001F3D3 --  8.0  [5] (🏏..🏓)    cricket game..ping pong
    , List.range 0x0001F3D4 0x0001F3DF --  7.0 [12] (🏔️..🏟️)    snow-capped mountain..stadium
    , List.range 0x0001F3E0 0x0001F3F0 --  6.0 [17] (🏠..🏰)    house..castle
    , List.range 0x0001F3F1 0x0001F3F7 --  7.0  [7] (🏱..🏷️)    WHITE PENNANT..label
    , List.range 0x0001F3F8 0x0001F3FA --  8.0  [3] (🏸..🏺)    badminton..amphora
    , List.range 0x0001F400 0x0001F43E --  6.0 [63] (🐀..🐾)    rat..paw prints
    , [ 0x0001F43F ] --  7.0  [1] (🐿️)       chipmunk
    , [ 0x0001F440 ] --  6.0  [1] (👀)       eyes
    , [ 0x0001F441 ] --  7.0  [1] (👁️)       eye
    , List.range 0x0001F442 0x0001F4F7 --  6.0[182] (👂..📷)    ear..camera
    , [ 0x0001F4F8 ] --  7.0  [1] (📸)       camera with flash
    , List.range 0x0001F4F9 0x0001F4FC --  6.0  [4] (📹..📼)    video camera..videocassette
    , List.range 0x0001F4FD 0x0001F4FE --  7.0  [2] (📽️..📾)    film projector..PORTABLE STEREO
    , [ 0x0001F4FF ] --  8.0  [1] (📿)       prayer beads
    , List.range 0x0001F500 0x0001F53D --  6.0 [62] (🔀..🔽)    shuffle tracks button..downwards button
    , List.range 0x0001F546 0x0001F54A --  7.0  [5] (🕆..🕊️)    WHITE LATIN CROSS..dove
    , List.range 0x0001F54B 0x0001F54F --  8.0  [5] (🕋..🕏)    kaaba..BOWL OF HYGIEIA
    , List.range 0x0001F550 0x0001F567 --  6.0 [24] (🕐..🕧)    one o’clock..twelve-thirty
    , List.range 0x0001F568 0x0001F579 --  7.0 [18] (🕨..🕹️)    RIGHT SPEAKER..joystick
    , [ 0x0001F57A ] --  9.0  [1] (🕺)       man dancing
    , List.range 0x0001F57B 0x0001F5A3 --  7.0 [41] (🕻..🖣)    LEFT HAND TELEPHONE RECEIVER..BLACK DOWN POINTING BACKHAND INDEX
    , [ 0x0001F5A4 ] --  9.0  [1] (🖤)       black heart
    , List.range 0x0001F5A5 0x0001F5FA --  7.0 [86] (🖥️..🗺️)    desktop computer..world map
    , List.range 0x0001F5FB 0x0001F5FF --  6.0  [5] (🗻..🗿)    mount fuji..moai
    , [ 0x0001F600 ] --  6.1  [1] (😀)       grinning face
    , List.range 0x0001F601 0x0001F610 --  6.0 [16] (😁..😐)    beaming face with smiling eyes..neutral face
    , [ 0x0001F611 ] --  6.1  [1] (😑)       expressionless face
    , List.range 0x0001F612 0x0001F614 --  6.0  [3] (😒..😔)    unamused face..pensive face
    , [ 0x0001F615 ] --  6.1  [1] (😕)       confused face
    , [ 0x0001F616 ] --  6.0  [1] (😖)       confounded face
    , [ 0x0001F617 ] --  6.1  [1] (😗)       kissing face
    , [ 0x0001F618 ] --  6.0  [1] (😘)       face blowing a kiss
    , [ 0x0001F619 ] --  6.1  [1] (😙)       kissing face with smiling eyes
    , [ 0x0001F61A ] --  6.0  [1] (😚)       kissing face with closed eyes
    , [ 0x0001F61B ] --  6.1  [1] (😛)       face with tongue
    , List.range 0x0001F61C 0x0001F61E --  6.0  [3] (😜..😞)    winking face with tongue..disappointed face
    , [ 0x0001F61F ] --  6.1  [1] (😟)       worried face
    , List.range 0x0001F620 0x0001F625 --  6.0  [6] (😠..😥)    angry face..sad but relieved face
    , List.range 0x0001F626 0x0001F627 --  6.1  [2] (😦..😧)    frowning face with open mouth..anguished face
    , List.range 0x0001F628 0x0001F62B --  6.0  [4] (😨..😫)    fearful face..tired face
    , [ 0x0001F62C ] --  6.1  [1] (😬)       grimacing face
    , [ 0x0001F62D ] --  6.0  [1] (😭)       loudly crying face
    , List.range 0x0001F62E 0x0001F62F --  6.1  [2] (😮..😯)    face with open mouth..hushed face
    , List.range 0x0001F630 0x0001F633 --  6.0  [4] (😰..😳)    anxious face with sweat..flushed face
    , [ 0x0001F634 ] --  6.1  [1] (😴)       sleeping face
    , List.range 0x0001F635 0x0001F640 --  6.0 [12] (😵..🙀)    dizzy face..weary cat
    , List.range 0x0001F641 0x0001F642 --  7.0  [2] (🙁..🙂)    slightly frowning face..slightly smiling face
    , List.range 0x0001F643 0x0001F644 --  8.0  [2] (🙃..🙄)    upside-down face..face with rolling eyes
    , List.range 0x0001F645 0x0001F64F --  6.0 [11] (🙅..🙏)    person gesturing NO..folded hands
    , List.range 0x0001F680 0x0001F6C5 --  6.0 [70] (🚀..🛅)    rocket..left luggage
    , List.range 0x0001F6C6 0x0001F6CF --  7.0 [10] (🛆..🛏️)    TRIANGLE WITH ROUNDED CORNERS..bed
    , [ 0x0001F6D0 ] --  8.0  [1] (🛐)       place of worship
    , List.range 0x0001F6D1 0x0001F6D2 --  9.0  [2] (🛑..🛒)    stop sign..shopping cart
    , List.range 0x0001F6D3 0x0001F6D4 -- 10.0  [2] (🛓..🛔)    STUPA..PAGODA
    , [ 0x0001F6D5 ] -- 12.0  [1] (🛕)       hindu temple
    , List.range 0x0001F6D6 0x0001F6DF --   NA [10] (🛖..🛟)    <reserved-1F6D6>..<reserved-1F6DF>
    , List.range 0x0001F6E0 0x0001F6EC --  7.0 [13] (🛠️..🛬)    hammer and wrench..airplane arrival
    , List.range 0x0001F6ED 0x0001F6EF --   NA  [3] (🛭..🛯)    <reserved-1F6ED>..<reserved-1F6EF>
    , List.range 0x0001F6F0 0x0001F6F3 --  7.0  [4] (🛰️..🛳️)    satellite..passenger ship
    , List.range 0x0001F6F4 0x0001F6F6 --  9.0  [3] (🛴..🛶)    kick scooter..canoe
    , List.range 0x0001F6F7 0x0001F6F8 -- 10.0  [2] (🛷..🛸)    sled..flying saucer
    , [ 0x0001F6F9 ] -- 11.0  [1] (🛹)       skateboard
    , [ 0x0001F6FA ] -- 12.0  [1] (🛺)       auto rickshaw
    , List.range 0x0001F6FB 0x0001F6FF --   NA  [5] (🛻..🛿)    <reserved-1F6FB>..<reserved-1F6FF>
    , List.range 0x0001F774 0x0001F77F --   NA [12] (🝴..🝿)    <reserved-1F774>..<reserved-1F77F>
    , List.range 0x0001F7D5 0x0001F7D8 -- 11.0  [4] (🟕..🟘)    CIRCLED TRIANGLE..NEGATIVE CIRCLED SQUARE
    , List.range 0x0001F7D9 0x0001F7DF --   NA  [7] (🟙..🟟)    <reserved-1F7D9>..<reserved-1F7DF>
    , List.range 0x0001F7E0 0x0001F7EB -- 12.0 [12] (🟠..🟫)    orange circle..brown square
    , List.range 0x0001F7EC 0x0001F7FF --   NA [20] (🟬..🟿)    <reserved-1F7EC>..<reserved-1F7FF>
    , List.range 0x0001F80C 0x0001F80F --   NA  [4] (🠌..🠏)    <reserved-1F80C>..<reserved-1F80F>
    , List.range 0x0001F848 0x0001F84F --   NA  [8] (🡈..🡏)    <reserved-1F848>..<reserved-1F84F>
    , List.range 0x0001F85A 0x0001F85F --   NA  [6] (🡚..🡟)    <reserved-1F85A>..<reserved-1F85F>
    , List.range 0x0001F888 0x0001F88F --   NA  [8] (🢈..🢏)    <reserved-1F888>..<reserved-1F88F>
    , List.range 0x0001F8AE 0x0001F8FF --   NA [82] (🢮..🣿)    <reserved-1F8AE>..<reserved-1F8FF>
    , [ 0x0001F90C ] --   NA  [1] (🤌)       <reserved-1F90C>
    , List.range 0x0001F90D 0x0001F90F -- 12.0  [3] (🤍..🤏)    white heart..pinching hand
    , List.range 0x0001F910 0x0001F918 --  8.0  [9] (🤐..🤘)    zipper-mouth face..sign of the horns
    , List.range 0x0001F919 0x0001F91E --  9.0  [6] (🤙..🤞)    call me hand..crossed fingers
    , [ 0x0001F91F ] -- 10.0  [1] (🤟)       love-you gesture
    , List.range 0x0001F920 0x0001F927 --  9.0  [8] (🤠..🤧)    cowboy hat face..sneezing face
    , List.range 0x0001F928 0x0001F92F -- 10.0  [8] (🤨..🤯)    face with raised eyebrow..exploding head
    , [ 0x0001F930 ] --  9.0  [1] (🤰)       pregnant woman
    , List.range 0x0001F931 0x0001F932 -- 10.0  [2] (🤱..🤲)    breast-feeding..palms up together
    , List.range 0x0001F933 0x0001F93A --  9.0  [8] (🤳..🤺)    selfie..person fencing
    , List.range 0x0001F93C 0x0001F93E --  9.0  [3] (🤼..🤾)    people wrestling..person playing handball
    , [ 0x0001F93F ] -- 12.0  [1] (🤿)       diving mask
    , List.range 0x0001F940 0x0001F945 --  9.0  [6] (🥀..🥅)    wilted flower..goal net
    , List.range 0x0001F947 0x0001F94B --  9.0  [5] (🥇..🥋)    1st place medal..martial arts uniform
    , [ 0x0001F94C ] -- 10.0  [1] (🥌)       curling stone
    , List.range 0x0001F94D 0x0001F94F -- 11.0  [3] (🥍..🥏)    lacrosse..flying disc
    , List.range 0x0001F950 0x0001F95E --  9.0 [15] (🥐..🥞)    croissant..pancakes
    , List.range 0x0001F95F 0x0001F96B -- 10.0 [13] (🥟..🥫)    dumpling..canned food
    , List.range 0x0001F96C 0x0001F970 -- 11.0  [5] (🥬..🥰)    leafy green..smiling face with hearts
    , [ 0x0001F971 ] -- 12.0  [1] (🥱)       yawning face
    , [ 0x0001F972 ] --   NA  [1] (🥲)       <reserved-1F972>
    , List.range 0x0001F973 0x0001F976 -- 11.0  [4] (🥳..🥶)    partying face..cold face
    , List.range 0x0001F977 0x0001F979 --   NA  [3] (🥷..🥹)    <reserved-1F977>..<reserved-1F979>
    , [ 0x0001F97A ] -- 11.0  [1] (🥺)       pleading face
    , [ 0x0001F97B ] -- 12.0  [1] (🥻)       sari
    , List.range 0x0001F97C 0x0001F97F -- 11.0  [4] (🥼..🥿)    lab coat..flat shoe
    , List.range 0x0001F980 0x0001F984 --  8.0  [5] (🦀..🦄)    crab..unicorn
    , List.range 0x0001F985 0x0001F991 --  9.0 [13] (🦅..🦑)    eagle..squid
    , List.range 0x0001F992 0x0001F997 -- 10.0  [6] (🦒..🦗)    giraffe..cricket
    , List.range 0x0001F998 0x0001F9A2 -- 11.0 [11] (🦘..🦢)    kangaroo..swan
    , List.range 0x0001F9A3 0x0001F9A4 --   NA  [2] (🦣..🦤)    <reserved-1F9A3>..<reserved-1F9A4>
    , List.range 0x0001F9A5 0x0001F9AA -- 12.0  [6] (🦥..🦪)    sloth..oyster
    , List.range 0x0001F9AB 0x0001F9AD --   NA  [3] (🦫..🦭)    <reserved-1F9AB>..<reserved-1F9AD>
    , List.range 0x0001F9AE 0x0001F9AF -- 12.0  [2] (🦮..🦯)    guide dog..probing cane
    , List.range 0x0001F9B0 0x0001F9B9 -- 11.0 [10] (🦰..🦹)    red hair..supervillain
    , List.range 0x0001F9BA 0x0001F9BF -- 12.0  [6] (🦺..🦿)    safety vest..mechanical leg
    , [ 0x0001F9C0 ] --  8.0  [1] (🧀)       cheese wedge
    , List.range 0x0001F9C1 0x0001F9C2 -- 11.0  [2] (🧁..🧂)    cupcake..salt
    , List.range 0x0001F9C3 0x0001F9CA -- 12.0  [8] (🧃..🧊)    beverage box..ice cube
    , List.range 0x0001F9CB 0x0001F9CC --   NA  [2] (🧋..🧌)    <reserved-1F9CB>..<reserved-1F9CC>
    , List.range 0x0001F9CD 0x0001F9CF -- 12.0  [3] (🧍..🧏)    person standing..deaf person
    , List.range 0x0001F9D0 0x0001F9E6 -- 10.0 [23] (🧐..🧦)    face with monocle..socks
    , List.range 0x0001F9E7 0x0001F9FF -- 11.0 [25] (🧧..🧿)    red envelope..nazar amulet
    , List.range 0x0001FA00 0x0001FA53 -- 12.0 [84] (🨀..🩓)    NEUTRAL CHESS KING..BLACK CHESS KNIGHT-BISHOP
    , List.range 0x0001FA54 0x0001FA5F --   NA [12] (🩔..🩟)    <reserved-1FA54>..<reserved-1FA5F>
    , List.range 0x0001FA60 0x0001FA6D -- 11.0 [14] (🩠..🩭)    XIANGQI RED GENERAL..XIANGQI BLACK SOLDIER
    , List.range 0x0001FA6E 0x0001FA6F --   NA  [2] (🩮..🩯)    <reserved-1FA6E>..<reserved-1FA6F>
    , List.range 0x0001FA70 0x0001FA73 -- 12.0  [4] (🩰..🩳)    ballet shoes..shorts
    , List.range 0x0001FA74 0x0001FA77 --   NA  [4] (🩴..🩷)    <reserved-1FA74>..<reserved-1FA77>
    , List.range 0x0001FA78 0x0001FA7A -- 12.0  [3] (🩸..🩺)    drop of blood..stethoscope
    , List.range 0x0001FA7B 0x0001FA7F --   NA  [5] (🩻..🩿)    <reserved-1FA7B>..<reserved-1FA7F>
    , List.range 0x0001FA80 0x0001FA82 -- 12.0  [3] (🪀..🪂)    yo-yo..parachute
    , List.range 0x0001FA83 0x0001FA8F --   NA [13] (🪃..🪏)    <reserved-1FA83>..<reserved-1FA8F>
    , List.range 0x0001FA90 0x0001FA95 -- 12.0  [6] (🪐..🪕)    ringed planet..banjo
    , List.range 0x0001FA96 0x0001FFFD --   NA[1384] (🪖..🿽)   <reserved-1FA96>..<reserved-1FFFD>
    ]
        |> List.concat
        |> List.map Char.fromCode
        |> Set.fromList
