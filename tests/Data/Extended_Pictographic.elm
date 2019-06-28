module Data.Extended_Pictographic exposing (chars)


chars : List Char
chars =
    List.concat
        [ [ '©' ] --  1.1  [1] (©️)       copyright
        , [ '®' ] --  1.1  [1] (®️)       registered
        , [ '‼' ] --  1.1  [1] (‼️)       double exclamation mark
        , [ '⁉' ] --  3.0  [1] (⁉️)       exclamation question mark
        , [ '™' ] --  1.1  [1] (™️)       trade mark
        , [ 'ℹ' ] --  3.0  [1] (ℹ️)       information
        , List.map Char.fromCode (List.range 0x2194 0x2199) --  1.1  [6] (↔️..↙️)    left-right arrow..down-left arrow
        , List.map Char.fromCode (List.range 0x21A9 0x21AA) --  1.1  [2] (↩️..↪️)    right arrow curving left..left arrow curving right
        , List.map Char.fromCode (List.range 0x231A 0x231B) --  1.1  [2] (⌚..⌛)    watch..hourglass done
        , [ '⌨' ] --  1.1  [1] (⌨️)       keyboard
        , [ '⎈' ] --  3.0  [1] (⎈)       HELM SYMBOL
        , [ '⏏' ] --  4.0  [1] (⏏️)       eject button
        , List.map Char.fromCode (List.range 0x23E9 0x23F3) --  6.0 [11] (⏩..⏳)    fast-forward button..hourglass not done
        , List.map Char.fromCode (List.range 0x23F8 0x23FA) --  7.0  [3] (⏸️..⏺️)    pause button..record button
        , [ 'Ⓜ' ] --  1.1  [1] (Ⓜ️)       circled M
        , List.map Char.fromCode (List.range 0x25AA 0x25AB) --  1.1  [2] (▪️..▫️)    black small square..white small square
        , [ '▶' ] --  1.1  [1] (▶️)       play button
        , [ '◀' ] --  1.1  [1] (◀️)       reverse button
        , List.map Char.fromCode (List.range 0x25FB 0x25FE) --  3.2  [4] (◻️..◾)    white medium square..black medium-small square
        , List.map Char.fromCode (List.range 0x2600 0x2605) --  1.1  [6] (☀️..★)    sun..BLACK STAR
        , List.map Char.fromCode (List.range 0x2607 0x2612) --  1.1 [12] (☇..☒)    LIGHTNING..BALLOT BOX WITH X
        , List.map Char.fromCode (List.range 0x2614 0x2615) --  4.0  [2] (☔..☕)    umbrella with rain drops..hot beverage
        , List.map Char.fromCode (List.range 0x2616 0x2617) --  3.2  [2] (☖..☗)    WHITE SHOGI PIECE..BLACK SHOGI PIECE
        , [ '☘' ] --  4.1  [1] (☘️)       shamrock
        , [ '☙' ] --  3.0  [1] (☙)       REVERSED ROTATED FLORAL HEART BULLET
        , List.map Char.fromCode (List.range 0x261A 0x266F) --  1.1 [86] (☚..♯)    BLACK LEFT POINTING INDEX..MUSIC SHARP SIGN
        , List.map Char.fromCode (List.range 0x2670 0x2671) --  3.0  [2] (♰..♱)    WEST SYRIAC CROSS..EAST SYRIAC CROSS
        , List.map Char.fromCode (List.range 0x2672 0x267D) --  3.2 [12] (♲..♽)    UNIVERSAL RECYCLING SYMBOL..PARTIALLY-RECYCLED PAPER SYMBOL
        , List.map Char.fromCode (List.range 0x267E 0x267F) --  4.1  [2] (♾️..♿)    infinity..wheelchair symbol
        , List.map Char.fromCode (List.range 0x2680 0x2685) --  3.2  [6] (⚀..⚅)    DIE FACE-1..DIE FACE-6
        , List.map Char.fromCode (List.range 0x2690 0x2691) --  4.0  [2] (⚐..⚑)    WHITE FLAG..BLACK FLAG
        , List.map Char.fromCode (List.range 0x2692 0x269C) --  4.1 [11] (⚒️..⚜️)    hammer and pick..fleur-de-lis
        , [ '⚝' ] --  5.1  [1] (⚝)       OUTLINED WHITE STAR
        , List.map Char.fromCode (List.range 0x269E 0x269F) --  5.2  [2] (⚞..⚟)    THREE LINES CONVERGING RIGHT..THREE LINES CONVERGING LEFT
        , List.map Char.fromCode (List.range 0x26A0 0x26A1) --  4.0  [2] (⚠️..⚡)    warning..high voltage
        , List.map Char.fromCode (List.range 0x26A2 0x26B1) --  4.1 [16] (⚢..⚱️)    DOUBLED FEMALE SIGN..funeral urn
        , [ '⚲' ] --  5.0  [1] (⚲)       NEUTER
        , List.map Char.fromCode (List.range 0x26B3 0x26BC) --  5.1 [10] (⚳..⚼)    CERES..SESQUIQUADRATE
        , List.map Char.fromCode (List.range 0x26BD 0x26BF) --  5.2  [3] (⚽..⚿)    soccer ball..SQUARED KEY
        , List.map Char.fromCode (List.range 0x26C0 0x26C3) --  5.1  [4] (⛀..⛃)    WHITE DRAUGHTS MAN..BLACK DRAUGHTS KING
        , List.map Char.fromCode (List.range 0x26C4 0x26CD) --  5.2 [10] (⛄..⛍)    snowman without snow..DISABLED CAR
        , [ '⛎' ] --  6.0  [1] (⛎)       Ophiuchus
        , List.map Char.fromCode (List.range 0x26CF 0x26E1) --  5.2 [19] (⛏️..⛡)    pick..RESTRICTED LEFT ENTRY-2
        , [ '⛢' ] --  6.0  [1] (⛢)       ASTRONOMICAL SYMBOL FOR URANUS
        , [ '⛣' ] --  5.2  [1] (⛣)       HEAVY CIRCLE WITH STROKE AND TWO DOTS ABOVE
        , List.map Char.fromCode (List.range 0x26E4 0x26E7) --  6.0  [4] (⛤..⛧)    PENTAGRAM..INVERTED PENTAGRAM
        , List.map Char.fromCode (List.range 0x26E8 0x26FF) --  5.2 [24] (⛨..⛿)    BLACK CROSS ON SHIELD..WHITE FLAG WITH HORIZONTAL MIDDLE BLACK STRIPE
        , [ '✀' ] --  7.0  [1] (✀)       BLACK SAFETY SCISSORS
        , List.map Char.fromCode (List.range 0x2701 0x2704) --  1.1  [4] (✁..✄)    UPPER BLADE SCISSORS..WHITE SCISSORS
        , [ '✅' ] --  6.0  [1] (✅)       check mark button
        , List.map Char.fromCode (List.range 0x2708 0x2709) --  1.1  [2] (✈️..✉️)    airplane..envelope
        , List.map Char.fromCode (List.range 0x270A 0x270B) --  6.0  [2] (✊..✋)    raised fist..raised hand
        , List.map Char.fromCode (List.range 0x270C 0x2712) --  1.1  [7] (✌️..✒️)    victory hand..black nib
        , [ '✔' ] --  1.1  [1] (✔️)       check mark
        , [ '✖' ] --  1.1  [1] (✖️)       multiplication sign
        , [ '✝' ] --  1.1  [1] (✝️)       latin cross
        , [ '✡' ] --  1.1  [1] (✡️)       star of David
        , [ '✨' ] --  6.0  [1] (✨)       sparkles
        , List.map Char.fromCode (List.range 0x2733 0x2734) --  1.1  [2] (✳️..✴️)    eight-spoked asterisk..eight-pointed star
        , [ '❄' ] --  1.1  [1] (❄️)       snowflake
        , [ '❇' ] --  1.1  [1] (❇️)       sparkle
        , [ '❌' ] --  6.0  [1] (❌)       cross mark
        , [ '❎' ] --  6.0  [1] (❎)       cross mark button
        , List.map Char.fromCode (List.range 0x2753 0x2755) --  6.0  [3] (❓..❕)    question mark..white exclamation mark
        , [ '❗' ] --  5.2  [1] (❗)       exclamation mark
        , List.map Char.fromCode (List.range 0x2763 0x2767) --  1.1  [5] (❣️..❧)    heart exclamation..ROTATED FLORAL HEART BULLET
        , List.map Char.fromCode (List.range 0x2795 0x2797) --  6.0  [3] (➕..➗)    plus sign..division sign
        , [ '➡' ] --  1.1  [1] (➡️)       right arrow
        , [ '➰' ] --  6.0  [1] (➰)       curly loop
        , [ '➿' ] --  6.0  [1] (➿)       double curly loop
        , List.map Char.fromCode (List.range 0x2934 0x2935) --  3.2  [2] (⤴️..⤵️)    right arrow curving up..right arrow curving down
        , List.map Char.fromCode (List.range 0x2B05 0x2B07) --  4.0  [3] (⬅️..⬇️)    left arrow..down arrow
        , List.map Char.fromCode (List.range 0x2B1B 0x2B1C) --  5.1  [2] (⬛..⬜)    black large square..white large square
        , [ '⭐' ] --  5.1  [1] (⭐)       star
        , [ '⭕' ] --  5.2  [1] (⭕)       hollow red circle
        , [ '〰' ] --  1.1  [1] (〰️)       wavy dash
        , [ '〽' ] --  3.2  [1] (〽️)       part alternation mark
        , [ '㊗' ] --  1.1  [1] (㊗️)       Japanese “congratulations” button
        , [ '㊙' ] --  1.1  [1] (㊙️)       Japanese “secret” button
        , List.map Char.fromCode (List.range 0x0001F000 0x0001F02B) --  5.1 [44] (🀀..🀫)    MAHJONG TILE EAST WIND..MAHJONG TILE BACK
        , List.map Char.fromCode (List.range 0x0001F02C 0x0001F02F) --   NA  [4] (🀬..🀯)    <reserved-1F02C>..<reserved-1F02F>
        , List.map Char.fromCode (List.range 0x0001F030 0x0001F093) --  5.1[100] (🀰..🂓)    DOMINO TILE HORIZONTAL BACK..DOMINO TILE VERTICAL-06-06
        , List.map Char.fromCode (List.range 0x0001F094 0x0001F09F) --   NA [12] (🂔..🂟)    <reserved-1F094>..<reserved-1F09F>
        , List.map Char.fromCode (List.range 0x0001F0A0 0x0001F0AE) --  6.0 [15] (🂠..🂮)    PLAYING CARD BACK..PLAYING CARD KING OF SPADES
        , List.map Char.fromCode (List.range 0x0001F0AF 0x0001F0B0) --   NA  [2] (🂯..🂰)    <reserved-1F0AF>..<reserved-1F0B0>
        , List.map Char.fromCode (List.range 0x0001F0B1 0x0001F0BE) --  6.0 [14] (🂱..🂾)    PLAYING CARD ACE OF HEARTS..PLAYING CARD KING OF HEARTS
        , [ '🂿' ] --  7.0  [1] (🂿)       PLAYING CARD RED JOKER
        , [ '\u{1F0C0}' ] --   NA  [1] (🃀)       <reserved-1F0C0>
        , List.map Char.fromCode (List.range 0x0001F0C1 0x0001F0CF) --  6.0 [15] (🃁..🃏)    PLAYING CARD ACE OF DIAMONDS..joker
        , [ '\u{1F0D0}' ] --   NA  [1] (🃐)       <reserved-1F0D0>
        , List.map Char.fromCode (List.range 0x0001F0D1 0x0001F0DF) --  6.0 [15] (🃑..🃟)    PLAYING CARD ACE OF CLUBS..PLAYING CARD WHITE JOKER
        , List.map Char.fromCode (List.range 0x0001F0E0 0x0001F0F5) --  7.0 [22] (🃠..🃵)    PLAYING CARD FOOL..PLAYING CARD TRUMP-21
        , List.map Char.fromCode (List.range 0x0001F0F6 0x0001F0FF) --   NA [10] (🃶..🃿)    <reserved-1F0F6>..<reserved-1F0FF>
        , List.map Char.fromCode (List.range 0x0001F10D 0x0001F10F) --   NA  [3] (🄍..🄏)    <reserved-1F10D>..<reserved-1F10F>
        , [ '\u{1F12F}' ] -- 11.0  [1] (🄯)       COPYLEFT SYMBOL
        , [ '\u{1F16C}' ] -- 12.0  [1] (🅬)       RAISED MR SIGN
        , List.map Char.fromCode (List.range 0x0001F16D 0x0001F16F) --   NA  [3] (🅭..🅯)    <reserved-1F16D>..<reserved-1F16F>
        , List.map Char.fromCode (List.range 0x0001F170 0x0001F171) --  6.0  [2] (🅰️..🅱️)    A button (blood type)..B button (blood type)
        , [ '🅾' ] --  6.0  [1] (🅾️)       O button (blood type)
        , [ '🅿' ] --  5.2  [1] (🅿️)       P button
        , [ '🆎' ] --  6.0  [1] (🆎)       AB button (blood type)
        , List.map Char.fromCode (List.range 0x0001F191 0x0001F19A) --  6.0 [10] (🆑..🆚)    CL button..VS button
        , List.map Char.fromCode (List.range 0x0001F1AD 0x0001F1E5) --   NA [57] (🆭..🇥)    <reserved-1F1AD>..<reserved-1F1E5>
        , List.map Char.fromCode (List.range 0x0001F201 0x0001F202) --  6.0  [2] (🈁..🈂️)    Japanese “here” button..Japanese “service charge” button
        , List.map Char.fromCode (List.range 0x0001F203 0x0001F20F) --   NA [13] (🈃..🈏)    <reserved-1F203>..<reserved-1F20F>
        , [ '🈚' ] --  5.2  [1] (🈚)       Japanese “free of charge” button
        , [ '🈯' ] --  5.2  [1] (🈯)       Japanese “reserved” button
        , List.map Char.fromCode (List.range 0x0001F232 0x0001F23A) --  6.0  [9] (🈲..🈺)    Japanese “prohibited” button..Japanese “open for business” button
        , List.map Char.fromCode (List.range 0x0001F23C 0x0001F23F) --   NA  [4] (🈼..🈿)    <reserved-1F23C>..<reserved-1F23F>
        , List.map Char.fromCode (List.range 0x0001F249 0x0001F24F) --   NA  [7] (🉉..🉏)    <reserved-1F249>..<reserved-1F24F>
        , List.map Char.fromCode (List.range 0x0001F250 0x0001F251) --  6.0  [2] (🉐..🉑)    Japanese “bargain” button..Japanese “acceptable” button
        , List.map Char.fromCode (List.range 0x0001F252 0x0001F25F) --   NA [14] (🉒..🉟)    <reserved-1F252>..<reserved-1F25F>
        , List.map Char.fromCode (List.range 0x0001F260 0x0001F265) -- 10.0  [6] (🉠..🉥)    ROUNDED SYMBOL FOR FU..ROUNDED SYMBOL FOR CAI
        , List.map Char.fromCode (List.range 0x0001F266 0x0001F2FF) --   NA[154] (🉦..🋿)    <reserved-1F266>..<reserved-1F2FF>
        , List.map Char.fromCode (List.range 0x0001F300 0x0001F320) --  6.0 [33] (🌀..🌠)    cyclone..shooting star
        , List.map Char.fromCode (List.range 0x0001F321 0x0001F32C) --  7.0 [12] (🌡️..🌬️)    thermometer..wind face
        , List.map Char.fromCode (List.range 0x0001F32D 0x0001F32F) --  8.0  [3] (🌭..🌯)    hot dog..burrito
        , List.map Char.fromCode (List.range 0x0001F330 0x0001F335) --  6.0  [6] (🌰..🌵)    chestnut..cactus
        , [ '🌶' ] --  7.0  [1] (🌶️)       hot pepper
        , List.map Char.fromCode (List.range 0x0001F337 0x0001F37C) --  6.0 [70] (🌷..🍼)    tulip..baby bottle
        , [ '🍽' ] --  7.0  [1] (🍽️)       fork and knife with plate
        , List.map Char.fromCode (List.range 0x0001F37E 0x0001F37F) --  8.0  [2] (🍾..🍿)    bottle with popping cork..popcorn
        , List.map Char.fromCode (List.range 0x0001F380 0x0001F393) --  6.0 [20] (🎀..🎓)    ribbon..graduation cap
        , List.map Char.fromCode (List.range 0x0001F394 0x0001F39F) --  7.0 [12] (🎔..🎟️)    HEART WITH TIP ON THE LEFT..admission tickets
        , List.map Char.fromCode (List.range 0x0001F3A0 0x0001F3C4) --  6.0 [37] (🎠..🏄)    carousel horse..person surfing
        , [ '🏅' ] --  7.0  [1] (🏅)       sports medal
        , List.map Char.fromCode (List.range 0x0001F3C6 0x0001F3CA) --  6.0  [5] (🏆..🏊)    trophy..person swimming
        , List.map Char.fromCode (List.range 0x0001F3CB 0x0001F3CE) --  7.0  [4] (🏋️..🏎️)    person lifting weights..racing car
        , List.map Char.fromCode (List.range 0x0001F3CF 0x0001F3D3) --  8.0  [5] (🏏..🏓)    cricket game..ping pong
        , List.map Char.fromCode (List.range 0x0001F3D4 0x0001F3DF) --  7.0 [12] (🏔️..🏟️)    snow-capped mountain..stadium
        , List.map Char.fromCode (List.range 0x0001F3E0 0x0001F3F0) --  6.0 [17] (🏠..🏰)    house..castle
        , List.map Char.fromCode (List.range 0x0001F3F1 0x0001F3F7) --  7.0  [7] (🏱..🏷️)    WHITE PENNANT..label
        , List.map Char.fromCode (List.range 0x0001F3F8 0x0001F3FA) --  8.0  [3] (🏸..🏺)    badminton..amphora
        , List.map Char.fromCode (List.range 0x0001F400 0x0001F43E) --  6.0 [63] (🐀..🐾)    rat..paw prints
        , [ '🐿' ] --  7.0  [1] (🐿️)       chipmunk
        , [ '👀' ] --  6.0  [1] (👀)       eyes
        , [ '👁' ] --  7.0  [1] (👁️)       eye
        , List.map Char.fromCode (List.range 0x0001F442 0x0001F4F7) --  6.0[182] (👂..📷)    ear..camera
        , [ '📸' ] --  7.0  [1] (📸)       camera with flash
        , List.map Char.fromCode (List.range 0x0001F4F9 0x0001F4FC) --  6.0  [4] (📹..📼)    video camera..videocassette
        , List.map Char.fromCode (List.range 0x0001F4FD 0x0001F4FE) --  7.0  [2] (📽️..📾)    film projector..PORTABLE STEREO
        , [ '\u{1F4FF}' ] --  8.0  [1] (📿)       prayer beads
        , List.map Char.fromCode (List.range 0x0001F500 0x0001F53D) --  6.0 [62] (🔀..🔽)    shuffle tracks button..downwards button
        , List.map Char.fromCode (List.range 0x0001F546 0x0001F54A) --  7.0  [5] (🕆..🕊️)    WHITE LATIN CROSS..dove
        , List.map Char.fromCode (List.range 0x0001F54B 0x0001F54F) --  8.0  [5] (🕋..🕏)    kaaba..BOWL OF HYGIEIA
        , List.map Char.fromCode (List.range 0x0001F550 0x0001F567) --  6.0 [24] (🕐..🕧)    one o’clock..twelve-thirty
        , List.map Char.fromCode (List.range 0x0001F568 0x0001F579) --  7.0 [18] (🕨..🕹️)    RIGHT SPEAKER..joystick
        , [ '\u{1F57A}' ] --  9.0  [1] (🕺)       man dancing
        , List.map Char.fromCode (List.range 0x0001F57B 0x0001F5A3) --  7.0 [41] (🕻..🖣)    LEFT HAND TELEPHONE RECEIVER..BLACK DOWN POINTING BACKHAND INDEX
        , [ '\u{1F5A4}' ] --  9.0  [1] (🖤)       black heart
        , List.map Char.fromCode (List.range 0x0001F5A5 0x0001F5FA) --  7.0 [86] (🖥️..🗺️)    desktop computer..world map
        , List.map Char.fromCode (List.range 0x0001F5FB 0x0001F5FF) --  6.0  [5] (🗻..🗿)    mount fuji..moai
        , [ '😀' ] --  6.1  [1] (😀)       grinning face
        , List.map Char.fromCode (List.range 0x0001F601 0x0001F610) --  6.0 [16] (😁..😐)    beaming face with smiling eyes..neutral face
        , [ '😑' ] --  6.1  [1] (😑)       expressionless face
        , List.map Char.fromCode (List.range 0x0001F612 0x0001F614) --  6.0  [3] (😒..😔)    unamused face..pensive face
        , [ '😕' ] --  6.1  [1] (😕)       confused face
        , [ '😖' ] --  6.0  [1] (😖)       confounded face
        , [ '😗' ] --  6.1  [1] (😗)       kissing face
        , [ '😘' ] --  6.0  [1] (😘)       face blowing a kiss
        , [ '😙' ] --  6.1  [1] (😙)       kissing face with smiling eyes
        , [ '😚' ] --  6.0  [1] (😚)       kissing face with closed eyes
        , [ '😛' ] --  6.1  [1] (😛)       face with tongue
        , List.map Char.fromCode (List.range 0x0001F61C 0x0001F61E) --  6.0  [3] (😜..😞)    winking face with tongue..disappointed face
        , [ '😟' ] --  6.1  [1] (😟)       worried face
        , List.map Char.fromCode (List.range 0x0001F620 0x0001F625) --  6.0  [6] (😠..😥)    angry face..sad but relieved face
        , List.map Char.fromCode (List.range 0x0001F626 0x0001F627) --  6.1  [2] (😦..😧)    frowning face with open mouth..anguished face
        , List.map Char.fromCode (List.range 0x0001F628 0x0001F62B) --  6.0  [4] (😨..😫)    fearful face..tired face
        , [ '😬' ] --  6.1  [1] (😬)       grimacing face
        , [ '😭' ] --  6.0  [1] (😭)       loudly crying face
        , List.map Char.fromCode (List.range 0x0001F62E 0x0001F62F) --  6.1  [2] (😮..😯)    face with open mouth..hushed face
        , List.map Char.fromCode (List.range 0x0001F630 0x0001F633) --  6.0  [4] (😰..😳)    anxious face with sweat..flushed face
        , [ '😴' ] --  6.1  [1] (😴)       sleeping face
        , List.map Char.fromCode (List.range 0x0001F635 0x0001F640) --  6.0 [12] (😵..🙀)    dizzy face..weary cat
        , List.map Char.fromCode (List.range 0x0001F641 0x0001F642) --  7.0  [2] (🙁..🙂)    slightly frowning face..slightly smiling face
        , List.map Char.fromCode (List.range 0x0001F643 0x0001F644) --  8.0  [2] (🙃..🙄)    upside-down face..face with rolling eyes
        , List.map Char.fromCode (List.range 0x0001F645 0x0001F64F) --  6.0 [11] (🙅..🙏)    person gesturing NO..folded hands
        , List.map Char.fromCode (List.range 0x0001F680 0x0001F6C5) --  6.0 [70] (🚀..🛅)    rocket..left luggage
        , List.map Char.fromCode (List.range 0x0001F6C6 0x0001F6CF) --  7.0 [10] (🛆..🛏️)    TRIANGLE WITH ROUNDED CORNERS..bed
        , [ '\u{1F6D0}' ] --  8.0  [1] (🛐)       place of worship
        , List.map Char.fromCode (List.range 0x0001F6D1 0x0001F6D2) --  9.0  [2] (🛑..🛒)    stop sign..shopping cart
        , List.map Char.fromCode (List.range 0x0001F6D3 0x0001F6D4) -- 10.0  [2] (🛓..🛔)    STUPA..PAGODA
        , [ '\u{1F6D5}' ] -- 12.0  [1] (🛕)       hindu temple
        , List.map Char.fromCode (List.range 0x0001F6D6 0x0001F6DF) --   NA [10] (🛖..🛟)    <reserved-1F6D6>..<reserved-1F6DF>
        , List.map Char.fromCode (List.range 0x0001F6E0 0x0001F6EC) --  7.0 [13] (🛠️..🛬)    hammer and wrench..airplane arrival
        , List.map Char.fromCode (List.range 0x0001F6ED 0x0001F6EF) --   NA  [3] (🛭..🛯)    <reserved-1F6ED>..<reserved-1F6EF>
        , List.map Char.fromCode (List.range 0x0001F6F0 0x0001F6F3) --  7.0  [4] (🛰️..🛳️)    satellite..passenger ship
        , List.map Char.fromCode (List.range 0x0001F6F4 0x0001F6F6) --  9.0  [3] (🛴..🛶)    kick scooter..canoe
        , List.map Char.fromCode (List.range 0x0001F6F7 0x0001F6F8) -- 10.0  [2] (🛷..🛸)    sled..flying saucer
        , [ '\u{1F6F9}' ] -- 11.0  [1] (🛹)       skateboard
        , [ '\u{1F6FA}' ] -- 12.0  [1] (🛺)       auto rickshaw
        , List.map Char.fromCode (List.range 0x0001F6FB 0x0001F6FF) --   NA  [5] (🛻..🛿)    <reserved-1F6FB>..<reserved-1F6FF>
        , List.map Char.fromCode (List.range 0x0001F774 0x0001F77F) --   NA [12] (🝴..🝿)    <reserved-1F774>..<reserved-1F77F>
        , List.map Char.fromCode (List.range 0x0001F7D5 0x0001F7D8) -- 11.0  [4] (🟕..🟘)    CIRCLED TRIANGLE..NEGATIVE CIRCLED SQUARE
        , List.map Char.fromCode (List.range 0x0001F7D9 0x0001F7DF) --   NA  [7] (🟙..🟟)    <reserved-1F7D9>..<reserved-1F7DF>
        , List.map Char.fromCode (List.range 0x0001F7E0 0x0001F7EB) -- 12.0 [12] (🟠..🟫)    orange circle..brown square
        , List.map Char.fromCode (List.range 0x0001F7EC 0x0001F7FF) --   NA [20] (🟬..🟿)    <reserved-1F7EC>..<reserved-1F7FF>
        , List.map Char.fromCode (List.range 0x0001F80C 0x0001F80F) --   NA  [4] (🠌..🠏)    <reserved-1F80C>..<reserved-1F80F>
        , List.map Char.fromCode (List.range 0x0001F848 0x0001F84F) --   NA  [8] (🡈..🡏)    <reserved-1F848>..<reserved-1F84F>
        , List.map Char.fromCode (List.range 0x0001F85A 0x0001F85F) --   NA  [6] (🡚..🡟)    <reserved-1F85A>..<reserved-1F85F>
        , List.map Char.fromCode (List.range 0x0001F888 0x0001F88F) --   NA  [8] (🢈..🢏)    <reserved-1F888>..<reserved-1F88F>
        , List.map Char.fromCode (List.range 0x0001F8AE 0x0001F8FF) --   NA [82] (🢮..🣿)    <reserved-1F8AE>..<reserved-1F8FF>
        , [ '\u{1F90C}' ] --   NA  [1] (🤌)       <reserved-1F90C>
        , List.map Char.fromCode (List.range 0x0001F90D 0x0001F90F) -- 12.0  [3] (🤍..🤏)    white heart..pinching hand
        , List.map Char.fromCode (List.range 0x0001F910 0x0001F918) --  8.0  [9] (🤐..🤘)    zipper-mouth face..sign of the horns
        , List.map Char.fromCode (List.range 0x0001F919 0x0001F91E) --  9.0  [6] (🤙..🤞)    call me hand..crossed fingers
        , [ '\u{1F91F}' ] -- 10.0  [1] (🤟)       love-you gesture
        , List.map Char.fromCode (List.range 0x0001F920 0x0001F927) --  9.0  [8] (🤠..🤧)    cowboy hat face..sneezing face
        , List.map Char.fromCode (List.range 0x0001F928 0x0001F92F) -- 10.0  [8] (🤨..🤯)    face with raised eyebrow..exploding head
        , [ '\u{1F930}' ] --  9.0  [1] (🤰)       pregnant woman
        , List.map Char.fromCode (List.range 0x0001F931 0x0001F932) -- 10.0  [2] (🤱..🤲)    breast-feeding..palms up together
        , List.map Char.fromCode (List.range 0x0001F933 0x0001F93A) --  9.0  [8] (🤳..🤺)    selfie..person fencing
        , List.map Char.fromCode (List.range 0x0001F93C 0x0001F93E) --  9.0  [3] (🤼..🤾)    people wrestling..person playing handball
        , [ '\u{1F93F}' ] -- 12.0  [1] (🤿)       diving mask
        , List.map Char.fromCode (List.range 0x0001F940 0x0001F945) --  9.0  [6] (🥀..🥅)    wilted flower..goal net
        , List.map Char.fromCode (List.range 0x0001F947 0x0001F94B) --  9.0  [5] (🥇..🥋)    1st place medal..martial arts uniform
        , [ '\u{1F94C}' ] -- 10.0  [1] (🥌)       curling stone
        , List.map Char.fromCode (List.range 0x0001F94D 0x0001F94F) -- 11.0  [3] (🥍..🥏)    lacrosse..flying disc
        , List.map Char.fromCode (List.range 0x0001F950 0x0001F95E) --  9.0 [15] (🥐..🥞)    croissant..pancakes
        , List.map Char.fromCode (List.range 0x0001F95F 0x0001F96B) -- 10.0 [13] (🥟..🥫)    dumpling..canned food
        , List.map Char.fromCode (List.range 0x0001F96C 0x0001F970) -- 11.0  [5] (🥬..🥰)    leafy green..smiling face with hearts
        , [ '\u{1F971}' ] -- 12.0  [1] (🥱)       yawning face
        , [ '\u{1F972}' ] --   NA  [1] (🥲)       <reserved-1F972>
        , List.map Char.fromCode (List.range 0x0001F973 0x0001F976) -- 11.0  [4] (🥳..🥶)    partying face..cold face
        , List.map Char.fromCode (List.range 0x0001F977 0x0001F979) --   NA  [3] (🥷..🥹)    <reserved-1F977>..<reserved-1F979>
        , [ '\u{1F97A}' ] -- 11.0  [1] (🥺)       pleading face
        , [ '\u{1F97B}' ] -- 12.0  [1] (🥻)       sari
        , List.map Char.fromCode (List.range 0x0001F97C 0x0001F97F) -- 11.0  [4] (🥼..🥿)    lab coat..flat shoe
        , List.map Char.fromCode (List.range 0x0001F980 0x0001F984) --  8.0  [5] (🦀..🦄)    crab..unicorn
        , List.map Char.fromCode (List.range 0x0001F985 0x0001F991) --  9.0 [13] (🦅..🦑)    eagle..squid
        , List.map Char.fromCode (List.range 0x0001F992 0x0001F997) -- 10.0  [6] (🦒..🦗)    giraffe..cricket
        , List.map Char.fromCode (List.range 0x0001F998 0x0001F9A2) -- 11.0 [11] (🦘..🦢)    kangaroo..swan
        , List.map Char.fromCode (List.range 0x0001F9A3 0x0001F9A4) --   NA  [2] (🦣..🦤)    <reserved-1F9A3>..<reserved-1F9A4>
        , List.map Char.fromCode (List.range 0x0001F9A5 0x0001F9AA) -- 12.0  [6] (🦥..🦪)    sloth..oyster
        , List.map Char.fromCode (List.range 0x0001F9AB 0x0001F9AD) --   NA  [3] (🦫..🦭)    <reserved-1F9AB>..<reserved-1F9AD>
        , List.map Char.fromCode (List.range 0x0001F9AE 0x0001F9AF) -- 12.0  [2] (🦮..🦯)    guide dog..probing cane
        , List.map Char.fromCode (List.range 0x0001F9B0 0x0001F9B9) -- 11.0 [10] (🦰..🦹)    red hair..supervillain
        , List.map Char.fromCode (List.range 0x0001F9BA 0x0001F9BF) -- 12.0  [6] (🦺..🦿)    safety vest..mechanical leg
        , [ '\u{1F9C0}' ] --  8.0  [1] (🧀)       cheese wedge
        , List.map Char.fromCode (List.range 0x0001F9C1 0x0001F9C2) -- 11.0  [2] (🧁..🧂)    cupcake..salt
        , List.map Char.fromCode (List.range 0x0001F9C3 0x0001F9CA) -- 12.0  [8] (🧃..🧊)    beverage box..ice cube
        , List.map Char.fromCode (List.range 0x0001F9CB 0x0001F9CC) --   NA  [2] (🧋..🧌)    <reserved-1F9CB>..<reserved-1F9CC>
        , List.map Char.fromCode (List.range 0x0001F9CD 0x0001F9CF) -- 12.0  [3] (🧍..🧏)    person standing..deaf person
        , List.map Char.fromCode (List.range 0x0001F9D0 0x0001F9E6) -- 10.0 [23] (🧐..🧦)    face with monocle..socks
        , List.map Char.fromCode (List.range 0x0001F9E7 0x0001F9FF) -- 11.0 [25] (🧧..🧿)    red envelope..nazar amulet
        , List.map Char.fromCode (List.range 0x0001FA00 0x0001FA53) -- 12.0 [84] (🨀..🩓)    NEUTRAL CHESS KING..BLACK CHESS KNIGHT-BISHOP
        , List.map Char.fromCode (List.range 0x0001FA54 0x0001FA5F) --   NA [12] (🩔..🩟)    <reserved-1FA54>..<reserved-1FA5F>
        , List.map Char.fromCode (List.range 0x0001FA60 0x0001FA6D) -- 11.0 [14] (🩠..🩭)    XIANGQI RED GENERAL..XIANGQI BLACK SOLDIER
        , List.map Char.fromCode (List.range 0x0001FA6E 0x0001FA6F) --   NA  [2] (🩮..🩯)    <reserved-1FA6E>..<reserved-1FA6F>
        , List.map Char.fromCode (List.range 0x0001FA70 0x0001FA73) -- 12.0  [4] (🩰..🩳)    ballet shoes..shorts
        , List.map Char.fromCode (List.range 0x0001FA74 0x0001FA77) --   NA  [4] (🩴..🩷)    <reserved-1FA74>..<reserved-1FA77>
        , List.map Char.fromCode (List.range 0x0001FA78 0x0001FA7A) -- 12.0  [3] (🩸..🩺)    drop of blood..stethoscope
        , List.map Char.fromCode (List.range 0x0001FA7B 0x0001FA7F) --   NA  [5] (🩻..🩿)    <reserved-1FA7B>..<reserved-1FA7F>
        , List.map Char.fromCode (List.range 0x0001FA80 0x0001FA82) -- 12.0  [3] (🪀..🪂)    yo-yo..parachute
        , List.map Char.fromCode (List.range 0x0001FA83 0x0001FA8F) --   NA [13] (🪃..🪏)    <reserved-1FA83>..<reserved-1FA8F>
        , List.map Char.fromCode (List.range 0x0001FA90 0x0001FA95) -- 12.0  [6] (🪐..🪕)    ringed planet..banjo
        , List.map Char.fromCode (List.range 0x0001FA96 0x0001FFFD) --   NA[1384] (🪖..🿽)   <reserved-1FA96>..<reserved-1FFFD>
        ]
