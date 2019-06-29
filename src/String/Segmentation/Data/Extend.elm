module String.Segmentation.Data.Extend exposing (chars, match, parser)

{-| Hey, this module was generated automatically. Please don't edit it.

Run `make src/String/Segmentation/Data/Extend.elm` instead!

-}

import Parser exposing (Parser)
import String.Segmentation.RangeSet as RangeSet exposing (RangeSet)
import String.Segmentation.RangeSet.Range as Range exposing (Range)


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
        [ 'ֿ' -- Mn       HEBREW POINT RAFE
        , 'ׇ' -- Mn       HEBREW POINT QAMATS QATAN
        , 'ٰ' -- Mn       ARABIC LETTER SUPERSCRIPT ALEF
        , 'ܑ' -- Mn       SYRIAC LETTER SUPERSCRIPT ALAPH
        , '\u{07FD}' -- Mn       NKO DANTAYALAN
        , 'ऺ' -- Mn       DEVANAGARI VOWEL SIGN OE
        , '़' -- Mn       DEVANAGARI SIGN NUKTA
        , '्' -- Mn       DEVANAGARI SIGN VIRAMA
        , 'ঁ' -- Mn       BENGALI SIGN CANDRABINDU
        , '়' -- Mn       BENGALI SIGN NUKTA
        , 'া' -- Mc       BENGALI VOWEL SIGN AA
        , '্' -- Mn       BENGALI SIGN VIRAMA
        , 'ৗ' -- Mc       BENGALI AU LENGTH MARK
        , '\u{09FE}' -- Mn       BENGALI SANDHI MARK
        , '਼' -- Mn       GURMUKHI SIGN NUKTA
        , 'ੑ' -- Mn       GURMUKHI SIGN UDAAT
        , 'ੵ' -- Mn       GURMUKHI SIGN YAKASH
        , '઼' -- Mn       GUJARATI SIGN NUKTA
        , '્' -- Mn       GUJARATI SIGN VIRAMA
        , 'ଁ' -- Mn       ORIYA SIGN CANDRABINDU
        , '଼' -- Mn       ORIYA SIGN NUKTA
        , 'ା' -- Mc       ORIYA VOWEL SIGN AA
        , 'ି' -- Mn       ORIYA VOWEL SIGN I
        , '୍' -- Mn       ORIYA SIGN VIRAMA
        , 'ୖ' -- Mn       ORIYA AI LENGTH MARK
        , 'ୗ' -- Mc       ORIYA AU LENGTH MARK
        , 'ஂ' -- Mn       TAMIL SIGN ANUSVARA
        , 'ா' -- Mc       TAMIL VOWEL SIGN AA
        , 'ீ' -- Mn       TAMIL VOWEL SIGN II
        , '்' -- Mn       TAMIL SIGN VIRAMA
        , 'ௗ' -- Mc       TAMIL AU LENGTH MARK
        , 'ఀ' -- Mn       TELUGU SIGN COMBINING CANDRABINDU ABOVE
        , '\u{0C04}' -- Mn       TELUGU SIGN COMBINING ANUSVARA ABOVE
        , 'ಁ' -- Mn       KANNADA SIGN CANDRABINDU
        , '಼' -- Mn       KANNADA SIGN NUKTA
        , 'ಿ' -- Mn       KANNADA VOWEL SIGN I
        , 'ೂ' -- Mc       KANNADA VOWEL SIGN UU
        , 'ೆ' -- Mn       KANNADA VOWEL SIGN E
        , 'ാ' -- Mc       MALAYALAM VOWEL SIGN AA
        , '്' -- Mn       MALAYALAM SIGN VIRAMA
        , 'ൗ' -- Mc       MALAYALAM AU LENGTH MARK
        , '්' -- Mn       SINHALA SIGN AL-LAKUNA
        , 'ා' -- Mc       SINHALA VOWEL SIGN AELA-PILLA
        , 'ූ' -- Mn       SINHALA VOWEL SIGN DIGA PAA-PILLA
        , 'ෟ' -- Mc       SINHALA VOWEL SIGN GAYANUKITTA
        , 'ั' -- Mn       THAI CHARACTER MAI HAN-AKAT
        , 'ັ' -- Mn       LAO VOWEL SIGN MAI KAN
        , '༵' -- Mn       TIBETAN MARK NGAS BZUNG NYI ZLA
        , '༷' -- Mn       TIBETAN MARK NGAS BZUNG SGOR RTAGS
        , '༹' -- Mn       TIBETAN MARK TSA -PHRU
        , '࿆' -- Mn       TIBETAN SYMBOL PADMA GDAN
        , 'ႂ' -- Mn       MYANMAR CONSONANT SIGN SHAN MEDIAL WA
        , 'ႍ' -- Mn       MYANMAR SIGN SHAN COUNCIL EMPHATIC TONE
        , 'ႝ' -- Mn       MYANMAR VOWEL SIGN AITON AI
        , 'ំ' -- Mn       KHMER SIGN NIKAHIT
        , '៝' -- Mn       KHMER SIGN ATTHACAN
        , 'ᢩ' -- Mn       MONGOLIAN LETTER ALI GALI DAGALGA
        , 'ᤲ' -- Mn       LIMBU SMALL LETTER ANUSVARA
        , 'ᨛ' -- Mn       BUGINESE VOWEL SIGN AE
        , 'ᩖ' -- Mn       TAI THAM CONSONANT SIGN MEDIAL LA
        , '᩠' -- Mn       TAI THAM SIGN SAKOT
        , 'ᩢ' -- Mn       TAI THAM VOWEL SIGN MAI SAT
        , '᩿' -- Mn       TAI THAM COMBINING CRYPTOGRAMMIC DOT
        , '᪾' -- Me       COMBINING PARENTHESES OVERLAY
        , '᬴' -- Mn       BALINESE SIGN REREKAN
        , 'ᬵ' -- Mc       BALINESE VOWEL SIGN TEDUNG
        , 'ᬼ' -- Mn       BALINESE VOWEL SIGN LA LENGA
        , 'ᭂ' -- Mn       BALINESE VOWEL SIGN PEPET
        , '᯦' -- Mn       BATAK SIGN TOMPI
        , 'ᯭ' -- Mn       BATAK VOWEL SIGN KARO O
        , '᳭' -- Mn       VEDIC SIGN TIRYAK
        , '᳴' -- Mn       VEDIC TONE CANDRA ABOVE
        , '\u{200C}' -- Cf       ZERO WIDTH NON-JOINER
        , '⃡' -- Mn       COMBINING LEFT RIGHT ARROW ABOVE
        , '⵿' -- Mn       TIFINAGH CONSONANT JOINER
        , '꙯' -- Mn       COMBINING CYRILLIC VZMET
        , 'ꠂ' -- Mn       SYLOTI NAGRI SIGN DVISVARA
        , '꠆' -- Mn       SYLOTI NAGRI SIGN HASANTA
        , 'ꠋ' -- Mn       SYLOTI NAGRI SIGN ANUSVARA
        , '\u{A8FF}' -- Mn       DEVANAGARI VOWEL SIGN AY
        , '꦳' -- Mn       JAVANESE SIGN CECAK TELU
        , 'ꧥ' -- Mn       MYANMAR SIGN SHAN SAW
        , 'ꩃ' -- Mn       CHAM CONSONANT SIGN FINAL NG
        , 'ꩌ' -- Mn       CHAM CONSONANT SIGN FINAL M
        , 'ꩼ' -- Mn       MYANMAR SIGN TAI LAING TONE-2
        , 'ꪰ' -- Mn       TAI VIET MAI KANG
        , '꫁' -- Mn       TAI VIET TONE MAI THO
        , '꫶' -- Mn       MEETEI MAYEK VIRAMA
        , 'ꯥ' -- Mn       MEETEI MAYEK VOWEL SIGN ANAP
        , 'ꯨ' -- Mn       MEETEI MAYEK VOWEL SIGN UNAP
        , '꯭' -- Mn       MEETEI MAYEK APUN IYEK
        , 'ﬞ' -- Mn       HEBREW POINT JUDEO-SPANISH VARIKA
        , '𐇽' -- Mn       PHAISTOS DISC SIGN COMBINING OBLIQUE STROKE
        , '𐋠' -- Mn       COPTIC EPACT THOUSANDS MARK
        , '𐨿' -- Mn       KHAROSHTHI VIRAMA
        , '𑀁' -- Mn       BRAHMI SIGN ANUSVARA
        , '𑅳' -- Mn       MAHAJANI SIGN NUKTA
        , '𑈴' -- Mn       KHOJKI SIGN ANUSVARA
        , '\u{1123E}' -- Mn       KHOJKI SIGN SUKUN
        , '𑋟' -- Mn       KHUDAWADI SIGN ANUSVARA
        , '𑌾' -- Mc       GRANTHA VOWEL SIGN AA
        , '𑍀' -- Mn       GRANTHA VOWEL SIGN II
        , '𑍗' -- Mc       GRANTHA AU LENGTH MARK
        , '\u{11446}' -- Mn       NEWA SIGN NUKTA
        , '\u{1145E}' -- Mn       NEWA SANDHI MARK
        , '𑒰' -- Mc       TIRHUTA VOWEL SIGN AA
        , '𑒺' -- Mn       TIRHUTA VOWEL SIGN SHORT E
        , '𑒽' -- Mc       TIRHUTA VOWEL SIGN SHORT O
        , '𑖯' -- Mc       SIDDHAM VOWEL SIGN AA
        , '𑘽' -- Mn       MODI SIGN ANUSVARA
        , '𑚫' -- Mn       TAKRI SIGN ANUSVARA
        , '𑚭' -- Mn       TAKRI VOWEL SIGN AA
        , '𑚷' -- Mn       TAKRI SIGN NUKTA
        , '\u{119E0}' -- Mn       NANDINAGARI SIGN VIRAMA
        , '\u{11A47}' -- Mn       ZANABAZAR SQUARE SUBJOINER
        , '\u{11C3F}' -- Mn       BHAIKSUKI SIGN VIRAMA
        , '\u{11D3A}' -- Mn       MASARAM GONDI VOWEL SIGN E
        , '\u{11D47}' -- Mn       MASARAM GONDI RA-KARA
        , '\u{11D95}' -- Mn       GUNJALA GONDI SIGN ANUSVARA
        , '\u{11D97}' -- Mn       GUNJALA GONDI VIRAMA
        , '\u{16F4F}' -- Mn       MIAO SIGN CONSONANT MODIFIER BAR
        , '𝅥' -- Mc       MUSICAL SYMBOL COMBINING STEM
        , '\u{1DA75}' -- Mn       SIGNWRITING UPPER BODY TILTING FROM HIP JOINTS
        , '\u{1DA84}' -- Mn       SIGNWRITING LOCATION HEAD NECK
        ]


ranges : List (Range Char)
ranges =
    List.map (\( low, high ) -> Range.range low high)
        [ ( '̀', 'ͯ' ) -- Mn [112] COMBINING GRAVE ACCENT..COMBINING LATIN SMALL LETTER X
        , ( '҃', '҇' ) -- Mn   [5] COMBINING CYRILLIC TITLO..COMBINING CYRILLIC POKRYTIE
        , ( '҈', '҉' ) -- Me   [2] COMBINING CYRILLIC HUNDRED THOUSANDS SIGN..COMBINING CYRILLIC MILLIONS SIGN
        , ( '֑', 'ֽ' ) -- Mn  [45] HEBREW ACCENT ETNAHTA..HEBREW POINT METEG
        , ( 'ׁ', 'ׂ' ) -- Mn   [2] HEBREW POINT SHIN DOT..HEBREW POINT SIN DOT
        , ( 'ׄ', 'ׅ' ) -- Mn   [2] HEBREW MARK UPPER DOT..HEBREW MARK LOWER DOT
        , ( 'ؐ', 'ؚ' ) -- Mn  [11] ARABIC SIGN SALLALLAHOU ALAYHE WASSALLAM..ARABIC SMALL KASRA
        , ( 'ً', 'ٟ' ) -- Mn  [21] ARABIC FATHATAN..ARABIC WAVY HAMZA BELOW
        , ( 'ۖ', 'ۜ' ) -- Mn   [7] ARABIC SMALL HIGH LIGATURE SAD WITH LAM WITH ALEF MAKSURA..ARABIC SMALL HIGH SEEN
        , ( '۟', 'ۤ' ) -- Mn   [6] ARABIC SMALL HIGH ROUNDED ZERO..ARABIC SMALL HIGH MADDA
        , ( 'ۧ', 'ۨ' ) -- Mn   [2] ARABIC SMALL HIGH YEH..ARABIC SMALL HIGH NOON
        , ( '۪', 'ۭ' ) -- Mn   [4] ARABIC EMPTY CENTRE LOW STOP..ARABIC SMALL LOW MEEM
        , ( 'ܰ', '݊' ) -- Mn  [27] SYRIAC PTHAHA ABOVE..SYRIAC BARREKH
        , ( 'ަ', 'ް' ) -- Mn  [11] THAANA ABAFILI..THAANA SUKUN
        , ( '߫', '߳' ) -- Mn   [9] NKO COMBINING SHORT HIGH TONE..NKO COMBINING DOUBLE DOT ABOVE
        , ( 'ࠖ', '࠙' ) -- Mn   [4] SAMARITAN MARK IN..SAMARITAN MARK DAGESH
        , ( 'ࠛ', 'ࠣ' ) -- Mn   [9] SAMARITAN MARK EPENTHETIC YUT..SAMARITAN VOWEL SIGN A
        , ( 'ࠥ', 'ࠧ' ) -- Mn   [3] SAMARITAN VOWEL SIGN SHORT A..SAMARITAN VOWEL SIGN U
        , ( 'ࠩ', '࠭' ) -- Mn   [5] SAMARITAN VOWEL SIGN LONG I..SAMARITAN MARK NEQUDAA
        , ( '࡙', '࡛' ) -- Mn   [3] MANDAIC AFFRICATION MARK..MANDAIC GEMINATION MARK
        , ( '\u{08D3}', '\u{08E1}' ) -- Mn  [15] ARABIC SMALL LOW WAW..ARABIC SMALL HIGH SIGN SAFHA
        , ( '\u{08E3}', 'ं' ) -- Mn  [32] ARABIC TURNED DAMMA BELOW..DEVANAGARI SIGN ANUSVARA
        , ( 'ु', 'ै' ) -- Mn   [8] DEVANAGARI VOWEL SIGN U..DEVANAGARI VOWEL SIGN AI
        , ( '॑', 'ॗ' ) -- Mn   [7] DEVANAGARI STRESS SIGN UDATTA..DEVANAGARI VOWEL SIGN UUE
        , ( 'ॢ', 'ॣ' ) -- Mn   [2] DEVANAGARI VOWEL SIGN VOCALIC L..DEVANAGARI VOWEL SIGN VOCALIC LL
        , ( 'ু', 'ৄ' ) -- Mn   [4] BENGALI VOWEL SIGN U..BENGALI VOWEL SIGN VOCALIC RR
        , ( 'ৢ', 'ৣ' ) -- Mn   [2] BENGALI VOWEL SIGN VOCALIC L..BENGALI VOWEL SIGN VOCALIC LL
        , ( 'ਁ', 'ਂ' ) -- Mn   [2] GURMUKHI SIGN ADAK BINDI..GURMUKHI SIGN BINDI
        , ( 'ੁ', 'ੂ' ) -- Mn   [2] GURMUKHI VOWEL SIGN U..GURMUKHI VOWEL SIGN UU
        , ( 'ੇ', 'ੈ' ) -- Mn   [2] GURMUKHI VOWEL SIGN EE..GURMUKHI VOWEL SIGN AI
        , ( 'ੋ', '੍' ) -- Mn   [3] GURMUKHI VOWEL SIGN OO..GURMUKHI SIGN VIRAMA
        , ( 'ੰ', 'ੱ' ) -- Mn   [2] GURMUKHI TIPPI..GURMUKHI ADDAK
        , ( 'ઁ', 'ં' ) -- Mn   [2] GUJARATI SIGN CANDRABINDU..GUJARATI SIGN ANUSVARA
        , ( 'ુ', 'ૅ' ) -- Mn   [5] GUJARATI VOWEL SIGN U..GUJARATI VOWEL SIGN CANDRA E
        , ( 'ે', 'ૈ' ) -- Mn   [2] GUJARATI VOWEL SIGN E..GUJARATI VOWEL SIGN AI
        , ( 'ૢ', 'ૣ' ) -- Mn   [2] GUJARATI VOWEL SIGN VOCALIC L..GUJARATI VOWEL SIGN VOCALIC LL
        , ( '\u{0AFA}', '\u{0AFF}' ) -- Mn   [6] GUJARATI SIGN SUKUN..GUJARATI SIGN TWO-CIRCLE NUKTA ABOVE
        , ( 'ୁ', 'ୄ' ) -- Mn   [4] ORIYA VOWEL SIGN U..ORIYA VOWEL SIGN VOCALIC RR
        , ( 'ୢ', 'ୣ' ) -- Mn   [2] ORIYA VOWEL SIGN VOCALIC L..ORIYA VOWEL SIGN VOCALIC LL
        , ( 'ా', 'ీ' ) -- Mn   [3] TELUGU VOWEL SIGN AA..TELUGU VOWEL SIGN II
        , ( 'ె', 'ై' ) -- Mn   [3] TELUGU VOWEL SIGN E..TELUGU VOWEL SIGN AI
        , ( 'ొ', '్' ) -- Mn   [4] TELUGU VOWEL SIGN O..TELUGU SIGN VIRAMA
        , ( 'ౕ', 'ౖ' ) -- Mn   [2] TELUGU LENGTH MARK..TELUGU AI LENGTH MARK
        , ( 'ౢ', 'ౣ' ) -- Mn   [2] TELUGU VOWEL SIGN VOCALIC L..TELUGU VOWEL SIGN VOCALIC LL
        , ( 'ೌ', '್' ) -- Mn   [2] KANNADA VOWEL SIGN AU..KANNADA SIGN VIRAMA
        , ( 'ೕ', 'ೖ' ) -- Mc   [2] KANNADA LENGTH MARK..KANNADA AI LENGTH MARK
        , ( 'ೢ', 'ೣ' ) -- Mn   [2] KANNADA VOWEL SIGN VOCALIC L..KANNADA VOWEL SIGN VOCALIC LL
        , ( '\u{0D00}', 'ഁ' ) -- Mn   [2] MALAYALAM SIGN COMBINING ANUSVARA ABOVE..MALAYALAM SIGN CANDRABINDU
        , ( '\u{0D3B}', '\u{0D3C}' ) -- Mn   [2] MALAYALAM SIGN VERTICAL BAR VIRAMA..MALAYALAM SIGN CIRCULAR VIRAMA
        , ( 'ു', 'ൄ' ) -- Mn   [4] MALAYALAM VOWEL SIGN U..MALAYALAM VOWEL SIGN VOCALIC RR
        , ( 'ൢ', 'ൣ' ) -- Mn   [2] MALAYALAM VOWEL SIGN VOCALIC L..MALAYALAM VOWEL SIGN VOCALIC LL
        , ( 'ි', 'ු' ) -- Mn   [3] SINHALA VOWEL SIGN KETTI IS-PILLA..SINHALA VOWEL SIGN KETTI PAA-PILLA
        , ( 'ิ', 'ฺ' ) -- Mn   [7] THAI CHARACTER SARA I..THAI CHARACTER PHINTHU
        , ( '็', '๎' ) -- Mn   [8] THAI CHARACTER MAITAIKHU..THAI CHARACTER YAMAKKAN
        , ( 'ິ', 'ຼ' ) -- Mn   [9] LAO VOWEL SIGN I..LAO SEMIVOWEL SIGN LO
        , ( '່', 'ໍ' ) -- Mn   [6] LAO TONE MAI EK..LAO NIGGAHITA
        , ( '༘', '༙' ) -- Mn   [2] TIBETAN ASTROLOGICAL SIGN -KHYUD PA..TIBETAN ASTROLOGICAL SIGN SDONG TSHUGS
        , ( 'ཱ', 'ཾ' ) -- Mn  [14] TIBETAN VOWEL SIGN AA..TIBETAN SIGN RJES SU NGA RO
        , ( 'ྀ', '྄' ) -- Mn   [5] TIBETAN VOWEL SIGN REVERSED I..TIBETAN MARK HALANTA
        , ( '྆', '྇' ) -- Mn   [2] TIBETAN SIGN LCI RTAGS..TIBETAN SIGN YANG RTAGS
        , ( 'ྍ', 'ྗ' ) -- Mn  [11] TIBETAN SUBJOINED SIGN LCE TSA CAN..TIBETAN SUBJOINED LETTER JA
        , ( 'ྙ', 'ྼ' ) -- Mn  [36] TIBETAN SUBJOINED LETTER NYA..TIBETAN SUBJOINED LETTER FIXED-FORM RA
        , ( 'ိ', 'ူ' ) -- Mn   [4] MYANMAR VOWEL SIGN I..MYANMAR VOWEL SIGN UU
        , ( 'ဲ', '့' ) -- Mn   [6] MYANMAR VOWEL SIGN AI..MYANMAR SIGN DOT BELOW
        , ( '္', '်' ) -- Mn   [2] MYANMAR SIGN VIRAMA..MYANMAR SIGN ASAT
        , ( 'ွ', 'ှ' ) -- Mn   [2] MYANMAR CONSONANT SIGN MEDIAL WA..MYANMAR CONSONANT SIGN MEDIAL HA
        , ( 'ၘ', 'ၙ' ) -- Mn   [2] MYANMAR VOWEL SIGN VOCALIC L..MYANMAR VOWEL SIGN VOCALIC LL
        , ( 'ၞ', 'ၠ' ) -- Mn   [3] MYANMAR CONSONANT SIGN MON MEDIAL NA..MYANMAR CONSONANT SIGN MON MEDIAL LA
        , ( 'ၱ', 'ၴ' ) -- Mn   [4] MYANMAR VOWEL SIGN GEBA KAREN I..MYANMAR VOWEL SIGN KAYAH EE
        , ( 'ႅ', 'ႆ' ) -- Mn   [2] MYANMAR VOWEL SIGN SHAN E ABOVE..MYANMAR VOWEL SIGN SHAN FINAL Y
        , ( '፝', '፟' ) -- Mn   [3] ETHIOPIC COMBINING GEMINATION AND VOWEL LENGTH MARK..ETHIOPIC COMBINING GEMINATION MARK
        , ( 'ᜒ', '᜔' ) -- Mn   [3] TAGALOG VOWEL SIGN I..TAGALOG SIGN VIRAMA
        , ( 'ᜲ', '᜴' ) -- Mn   [3] HANUNOO VOWEL SIGN I..HANUNOO SIGN PAMUDPOD
        , ( 'ᝒ', 'ᝓ' ) -- Mn   [2] BUHID VOWEL SIGN I..BUHID VOWEL SIGN U
        , ( 'ᝲ', 'ᝳ' ) -- Mn   [2] TAGBANWA VOWEL SIGN I..TAGBANWA VOWEL SIGN U
        , ( '឴', '឵' ) -- Mn   [2] KHMER VOWEL INHERENT AQ..KHMER VOWEL INHERENT AA
        , ( 'ិ', 'ួ' ) -- Mn   [7] KHMER VOWEL SIGN I..KHMER VOWEL SIGN UA
        , ( '៉', '៓' ) -- Mn  [11] KHMER SIGN MUUSIKATOAN..KHMER SIGN BATHAMASAT
        , ( '᠋', '᠍' ) -- Mn   [3] MONGOLIAN FREE VARIATION SELECTOR ONE..MONGOLIAN FREE VARIATION SELECTOR THREE
        , ( 'ᢅ', 'ᢆ' ) -- Mn   [2] MONGOLIAN LETTER ALI GALI BALUDA..MONGOLIAN LETTER ALI GALI THREE BALUDA
        , ( 'ᤠ', 'ᤢ' ) -- Mn   [3] LIMBU VOWEL SIGN A..LIMBU VOWEL SIGN U
        , ( 'ᤧ', 'ᤨ' ) -- Mn   [2] LIMBU VOWEL SIGN E..LIMBU VOWEL SIGN O
        , ( '᤹', '᤻' ) -- Mn   [3] LIMBU SIGN MUKPHRENG..LIMBU SIGN SA-I
        , ( 'ᨗ', 'ᨘ' ) -- Mn   [2] BUGINESE VOWEL SIGN I..BUGINESE VOWEL SIGN U
        , ( 'ᩘ', 'ᩞ' ) -- Mn   [7] TAI THAM SIGN MAI KANG LAI..TAI THAM CONSONANT SIGN SA
        , ( 'ᩥ', 'ᩬ' ) -- Mn   [8] TAI THAM VOWEL SIGN I..TAI THAM VOWEL SIGN OA BELOW
        , ( 'ᩳ', '᩼' ) -- Mn  [10] TAI THAM VOWEL SIGN OA ABOVE..TAI THAM SIGN KHUEN-LUE KARAN
        , ( '᪰', '᪽' ) -- Mn  [14] COMBINING DOUBLED CIRCUMFLEX ACCENT..COMBINING PARENTHESES BELOW
        , ( 'ᬀ', 'ᬃ' ) -- Mn   [4] BALINESE SIGN ULU RICEM..BALINESE SIGN SURANG
        , ( 'ᬶ', 'ᬺ' ) -- Mn   [5] BALINESE VOWEL SIGN ULU..BALINESE VOWEL SIGN RA REPA
        , ( '᭫', '᭳' ) -- Mn   [9] BALINESE MUSICAL SYMBOL COMBINING TEGEH..BALINESE MUSICAL SYMBOL COMBINING GONG
        , ( 'ᮀ', 'ᮁ' ) -- Mn   [2] SUNDANESE SIGN PANYECEK..SUNDANESE SIGN PANGLAYAR
        , ( 'ᮢ', 'ᮥ' ) -- Mn   [4] SUNDANESE CONSONANT SIGN PANYAKRA..SUNDANESE VOWEL SIGN PANYUKU
        , ( 'ᮨ', 'ᮩ' ) -- Mn   [2] SUNDANESE VOWEL SIGN PAMEPET..SUNDANESE VOWEL SIGN PANEULEUNG
        , ( '᮫', 'ᮭ' ) -- Mn   [3] SUNDANESE SIGN VIRAMA..SUNDANESE CONSONANT SIGN PASANGAN WA
        , ( 'ᯨ', 'ᯩ' ) -- Mn   [2] BATAK VOWEL SIGN PAKPAK E..BATAK VOWEL SIGN EE
        , ( 'ᯯ', 'ᯱ' ) -- Mn   [3] BATAK VOWEL SIGN U FOR SIMALUNGUN SA..BATAK CONSONANT SIGN H
        , ( 'ᰬ', 'ᰳ' ) -- Mn   [8] LEPCHA VOWEL SIGN E..LEPCHA CONSONANT SIGN T
        , ( 'ᰶ', '᰷' ) -- Mn   [2] LEPCHA SIGN RAN..LEPCHA SIGN NUKTA
        , ( '᳐', '᳒' ) -- Mn   [3] VEDIC TONE KARSHANA..VEDIC TONE PRENKHA
        , ( '᳔', '᳠' ) -- Mn  [13] VEDIC SIGN YAJURVEDIC MIDLINE SVARITA..VEDIC TONE RIGVEDIC KASHMIRI INDEPENDENT SVARITA
        , ( '᳢', '᳨' ) -- Mn   [7] VEDIC SIGN VISARGA SVARITA..VEDIC SIGN VISARGA ANUDATTA WITH TAIL
        , ( '᳸', '᳹' ) -- Mn   [2] VEDIC TONE RING ABOVE..VEDIC TONE DOUBLE RING ABOVE
        , ( '᷀', '\u{1DF9}' ) -- Mn  [58] COMBINING DOTTED GRAVE ACCENT..COMBINING WIDE INVERTED BRIDGE BELOW
        , ( '\u{1DFB}', '᷿' ) -- Mn   [5] COMBINING DELETION MARK..COMBINING RIGHT ARROWHEAD AND DOWN ARROWHEAD BELOW
        , ( '⃐', '⃜' ) -- Mn  [13] COMBINING LEFT HARPOON ABOVE..COMBINING FOUR DOTS ABOVE
        , ( '⃝', '⃠' ) -- Me   [4] COMBINING ENCLOSING CIRCLE..COMBINING ENCLOSING CIRCLE BACKSLASH
        , ( '⃢', '⃤' ) -- Me   [3] COMBINING ENCLOSING SCREEN..COMBINING ENCLOSING UPWARD POINTING TRIANGLE
        , ( '⃥', '⃰' ) -- Mn  [12] COMBINING REVERSE SOLIDUS OVERLAY..COMBINING ASTERISK ABOVE
        , ( '⳯', '⳱' ) -- Mn   [3] COPTIC COMBINING NI ABOVE..COPTIC COMBINING SPIRITUS LENIS
        , ( 'ⷠ', 'ⷿ' ) -- Mn  [32] COMBINING CYRILLIC LETTER BE..COMBINING CYRILLIC LETTER IOTIFIED BIG YUS
        , ( '〪', '〭' ) -- Mn   [4] IDEOGRAPHIC LEVEL TONE MARK..IDEOGRAPHIC ENTERING TONE MARK
        , ( '〮', '〯' ) -- Mc   [2] HANGUL SINGLE DOT TONE MARK..HANGUL DOUBLE DOT TONE MARK
        , ( '゙', '゚' ) -- Mn   [2] COMBINING KATAKANA-HIRAGANA VOICED SOUND MARK..COMBINING KATAKANA-HIRAGANA SEMI-VOICED SOUND MARK
        , ( '꙰', '꙲' ) -- Me   [3] COMBINING CYRILLIC TEN MILLIONS SIGN..COMBINING CYRILLIC THOUSAND MILLIONS SIGN
        , ( 'ꙴ', '꙽' ) -- Mn  [10] COMBINING CYRILLIC LETTER UKRAINIAN IE..COMBINING CYRILLIC PAYEROK
        , ( '\u{A69E}', 'ꚟ' ) -- Mn   [2] COMBINING CYRILLIC LETTER EF..COMBINING CYRILLIC LETTER IOTIFIED E
        , ( '꛰', '꛱' ) -- Mn   [2] BAMUM COMBINING MARK KOQNDON..BAMUM COMBINING MARK TUKWENTIS
        , ( 'ꠥ', 'ꠦ' ) -- Mn   [2] SYLOTI NAGRI VOWEL SIGN U..SYLOTI NAGRI VOWEL SIGN E
        , ( '꣄', '\u{A8C5}' ) -- Mn   [2] SAURASHTRA SIGN VIRAMA..SAURASHTRA SIGN CANDRABINDU
        , ( '꣠', '꣱' ) -- Mn  [18] COMBINING DEVANAGARI DIGIT ZERO..COMBINING DEVANAGARI SIGN AVAGRAHA
        , ( 'ꤦ', '꤭' ) -- Mn   [8] KAYAH LI VOWEL UE..KAYAH LI TONE CALYA PLOPHU
        , ( 'ꥇ', 'ꥑ' ) -- Mn  [11] REJANG VOWEL SIGN I..REJANG CONSONANT SIGN R
        , ( 'ꦀ', 'ꦂ' ) -- Mn   [3] JAVANESE SIGN PANYANGGA..JAVANESE SIGN LAYAR
        , ( 'ꦶ', 'ꦹ' ) -- Mn   [4] JAVANESE VOWEL SIGN WULU..JAVANESE VOWEL SIGN SUKU MENDUT
        , ( 'ꦼ', 'ꦽ' ) -- Mn   [2] JAVANESE VOWEL SIGN PEPET..JAVANESE CONSONANT SIGN KERET
        , ( 'ꨩ', 'ꨮ' ) -- Mn   [6] CHAM VOWEL SIGN AA..CHAM VOWEL SIGN OE
        , ( 'ꨱ', 'ꨲ' ) -- Mn   [2] CHAM VOWEL SIGN AU..CHAM VOWEL SIGN UE
        , ( 'ꨵ', 'ꨶ' ) -- Mn   [2] CHAM CONSONANT SIGN LA..CHAM CONSONANT SIGN WA
        , ( 'ꪲ', 'ꪴ' ) -- Mn   [3] TAI VIET VOWEL I..TAI VIET VOWEL U
        , ( 'ꪷ', 'ꪸ' ) -- Mn   [2] TAI VIET MAI KHIT..TAI VIET VOWEL IA
        , ( 'ꪾ', '꪿' ) -- Mn   [2] TAI VIET VOWEL AM..TAI VIET TONE MAI EK
        , ( 'ꫬ', 'ꫭ' ) -- Mn   [2] MEETEI MAYEK VOWEL SIGN UU..MEETEI MAYEK VOWEL SIGN AAI
        , ( '︀', '️' ) -- Mn  [16] VARIATION SELECTOR-1..VARIATION SELECTOR-16
        , ( '︠', '\u{FE2F}' ) -- Mn  [16] COMBINING LIGATURE LEFT HALF..COMBINING CYRILLIC TITLO RIGHT HALF
        , ( 'ﾞ', 'ﾟ' ) -- Lm   [2] HALFWIDTH KATAKANA VOICED SOUND MARK..HALFWIDTH KATAKANA SEMI-VOICED SOUND MARK
        , ( '𐍶', '𐍺' ) -- Mn   [5] COMBINING OLD PERMIC LETTER AN..COMBINING OLD PERMIC LETTER SII
        , ( '𐨁', '𐨃' ) -- Mn   [3] KHAROSHTHI VOWEL SIGN I..KHAROSHTHI VOWEL SIGN VOCALIC R
        , ( '𐨅', '𐨆' ) -- Mn   [2] KHAROSHTHI VOWEL SIGN E..KHAROSHTHI VOWEL SIGN O
        , ( '𐨌', '𐨏' ) -- Mn   [4] KHAROSHTHI VOWEL LENGTH MARK..KHAROSHTHI SIGN VISARGA
        , ( '𐨸', '𐨺' ) -- Mn   [3] KHAROSHTHI SIGN BAR ABOVE..KHAROSHTHI SIGN DOT BELOW
        , ( '𐫥', '𐫦' ) -- Mn   [2] MANICHAEAN ABBREVIATION MARK ABOVE..MANICHAEAN ABBREVIATION MARK BELOW
        , ( '\u{10D24}', '\u{10D27}' ) -- Mn   [4] HANIFI ROHINGYA SIGN HARBAHAY..HANIFI ROHINGYA SIGN TASSI
        , ( '\u{10F46}', '\u{10F50}' ) -- Mn  [11] SOGDIAN COMBINING DOT BELOW..SOGDIAN COMBINING STROKE BELOW
        , ( '𑀸', '𑁆' ) -- Mn  [15] BRAHMI VOWEL SIGN AA..BRAHMI VIRAMA
        , ( '𑁿', '𑂁' ) -- Mn   [3] BRAHMI NUMBER JOINER..KAITHI SIGN ANUSVARA
        , ( '𑂳', '𑂶' ) -- Mn   [4] KAITHI VOWEL SIGN U..KAITHI VOWEL SIGN AI
        , ( '𑂹', '𑂺' ) -- Mn   [2] KAITHI SIGN VIRAMA..KAITHI SIGN NUKTA
        , ( '𑄀', '𑄂' ) -- Mn   [3] CHAKMA SIGN CANDRABINDU..CHAKMA SIGN VISARGA
        , ( '𑄧', '𑄫' ) -- Mn   [5] CHAKMA VOWEL SIGN A..CHAKMA VOWEL SIGN UU
        , ( '𑄭', '𑄴' ) -- Mn   [8] CHAKMA VOWEL SIGN AI..CHAKMA MAAYYAA
        , ( '𑆀', '𑆁' ) -- Mn   [2] SHARADA SIGN CANDRABINDU..SHARADA SIGN ANUSVARA
        , ( '𑆶', '𑆾' ) -- Mn   [9] SHARADA VOWEL SIGN U..SHARADA VOWEL SIGN O
        , ( '\u{111C9}', '\u{111CC}' ) -- Mn   [4] SHARADA SANDHI MARK..SHARADA EXTRA SHORT VOWEL MARK
        , ( '𑈯', '𑈱' ) -- Mn   [3] KHOJKI VOWEL SIGN U..KHOJKI VOWEL SIGN AI
        , ( '𑈶', '𑈷' ) -- Mn   [2] KHOJKI SIGN NUKTA..KHOJKI SIGN SHADDA
        , ( '𑋣', '𑋪' ) -- Mn   [8] KHUDAWADI VOWEL SIGN U..KHUDAWADI SIGN VIRAMA
        , ( '\u{11300}', '𑌁' ) -- Mn   [2] GRANTHA SIGN COMBINING ANUSVARA ABOVE..GRANTHA SIGN CANDRABINDU
        , ( '\u{1133B}', '𑌼' ) -- Mn   [2] COMBINING BINDU BELOW..GRANTHA SIGN NUKTA
        , ( '𑍦', '𑍬' ) -- Mn   [7] COMBINING GRANTHA DIGIT ZERO..COMBINING GRANTHA DIGIT SIX
        , ( '𑍰', '𑍴' ) -- Mn   [5] COMBINING GRANTHA LETTER A..COMBINING GRANTHA LETTER PA
        , ( '\u{11438}', '\u{1143F}' ) -- Mn   [8] NEWA VOWEL SIGN U..NEWA VOWEL SIGN AI
        , ( '\u{11442}', '\u{11444}' ) -- Mn   [3] NEWA SIGN VIRAMA..NEWA SIGN ANUSVARA
        , ( '𑒳', '𑒸' ) -- Mn   [6] TIRHUTA VOWEL SIGN U..TIRHUTA VOWEL SIGN VOCALIC LL
        , ( '𑒿', '𑓀' ) -- Mn   [2] TIRHUTA SIGN CANDRABINDU..TIRHUTA SIGN ANUSVARA
        , ( '𑓂', '𑓃' ) -- Mn   [2] TIRHUTA SIGN VIRAMA..TIRHUTA SIGN NUKTA
        , ( '𑖲', '𑖵' ) -- Mn   [4] SIDDHAM VOWEL SIGN U..SIDDHAM VOWEL SIGN VOCALIC RR
        , ( '𑖼', '𑖽' ) -- Mn   [2] SIDDHAM SIGN CANDRABINDU..SIDDHAM SIGN ANUSVARA
        , ( '𑖿', '𑗀' ) -- Mn   [2] SIDDHAM SIGN VIRAMA..SIDDHAM SIGN NUKTA
        , ( '\u{115DC}', '\u{115DD}' ) -- Mn   [2] SIDDHAM VOWEL SIGN ALTERNATE U..SIDDHAM VOWEL SIGN ALTERNATE UU
        , ( '𑘳', '𑘺' ) -- Mn   [8] MODI VOWEL SIGN U..MODI VOWEL SIGN AI
        , ( '𑘿', '𑙀' ) -- Mn   [2] MODI SIGN VIRAMA..MODI SIGN ARDHACANDRA
        , ( '𑚰', '𑚵' ) -- Mn   [6] TAKRI VOWEL SIGN U..TAKRI VOWEL SIGN AU
        , ( '\u{1171D}', '\u{1171F}' ) -- Mn   [3] AHOM CONSONANT SIGN MEDIAL LA..AHOM CONSONANT SIGN MEDIAL LIGATING RA
        , ( '\u{11722}', '\u{11725}' ) -- Mn   [4] AHOM VOWEL SIGN I..AHOM VOWEL SIGN UU
        , ( '\u{11727}', '\u{1172B}' ) -- Mn   [5] AHOM VOWEL SIGN AW..AHOM SIGN KILLER
        , ( '\u{1182F}', '\u{11837}' ) -- Mn   [9] DOGRA VOWEL SIGN U..DOGRA SIGN ANUSVARA
        , ( '\u{11839}', '\u{1183A}' ) -- Mn   [2] DOGRA SIGN VIRAMA..DOGRA SIGN NUKTA
        , ( '\u{119D4}', '\u{119D7}' ) -- Mn   [4] NANDINAGARI VOWEL SIGN U..NANDINAGARI VOWEL SIGN VOCALIC RR
        , ( '\u{119DA}', '\u{119DB}' ) -- Mn   [2] NANDINAGARI VOWEL SIGN E..NANDINAGARI VOWEL SIGN AI
        , ( '\u{11A01}', '\u{11A0A}' ) -- Mn  [10] ZANABAZAR SQUARE VOWEL SIGN I..ZANABAZAR SQUARE VOWEL LENGTH MARK
        , ( '\u{11A33}', '\u{11A38}' ) -- Mn   [6] ZANABAZAR SQUARE FINAL CONSONANT MARK..ZANABAZAR SQUARE SIGN ANUSVARA
        , ( '\u{11A3B}', '\u{11A3E}' ) -- Mn   [4] ZANABAZAR SQUARE CLUSTER-FINAL LETTER YA..ZANABAZAR SQUARE CLUSTER-FINAL LETTER VA
        , ( '\u{11A51}', '\u{11A56}' ) -- Mn   [6] SOYOMBO VOWEL SIGN I..SOYOMBO VOWEL SIGN OE
        , ( '\u{11A59}', '\u{11A5B}' ) -- Mn   [3] SOYOMBO VOWEL SIGN VOCALIC R..SOYOMBO VOWEL LENGTH MARK
        , ( '\u{11A8A}', '\u{11A96}' ) -- Mn  [13] SOYOMBO FINAL CONSONANT SIGN G..SOYOMBO SIGN ANUSVARA
        , ( '\u{11A98}', '\u{11A99}' ) -- Mn   [2] SOYOMBO GEMINATION MARK..SOYOMBO SUBJOINER
        , ( '\u{11C30}', '\u{11C36}' ) -- Mn   [7] BHAIKSUKI VOWEL SIGN I..BHAIKSUKI VOWEL SIGN VOCALIC L
        , ( '\u{11C38}', '\u{11C3D}' ) -- Mn   [6] BHAIKSUKI VOWEL SIGN E..BHAIKSUKI SIGN ANUSVARA
        , ( '\u{11C92}', '\u{11CA7}' ) -- Mn  [22] MARCHEN SUBJOINED LETTER KA..MARCHEN SUBJOINED LETTER ZA
        , ( '\u{11CAA}', '\u{11CB0}' ) -- Mn   [7] MARCHEN SUBJOINED LETTER RA..MARCHEN VOWEL SIGN AA
        , ( '\u{11CB2}', '\u{11CB3}' ) -- Mn   [2] MARCHEN VOWEL SIGN U..MARCHEN VOWEL SIGN E
        , ( '\u{11CB5}', '\u{11CB6}' ) -- Mn   [2] MARCHEN SIGN ANUSVARA..MARCHEN SIGN CANDRABINDU
        , ( '\u{11D31}', '\u{11D36}' ) -- Mn   [6] MASARAM GONDI VOWEL SIGN AA..MASARAM GONDI VOWEL SIGN VOCALIC R
        , ( '\u{11D3C}', '\u{11D3D}' ) -- Mn   [2] MASARAM GONDI VOWEL SIGN AI..MASARAM GONDI VOWEL SIGN O
        , ( '\u{11D3F}', '\u{11D45}' ) -- Mn   [7] MASARAM GONDI VOWEL SIGN AU..MASARAM GONDI VIRAMA
        , ( '\u{11D90}', '\u{11D91}' ) -- Mn   [2] GUNJALA GONDI VOWEL SIGN EE..GUNJALA GONDI VOWEL SIGN AI
        , ( '\u{11EF3}', '\u{11EF4}' ) -- Mn   [2] MAKASAR VOWEL SIGN I..MAKASAR VOWEL SIGN U
        , ( '𖫰', '𖫴' ) -- Mn   [5] BASSA VAH COMBINING HIGH TONE..BASSA VAH COMBINING HIGH-LOW TONE
        , ( '𖬰', '𖬶' ) -- Mn   [7] PAHAWH HMONG MARK CIM TUB..PAHAWH HMONG MARK CIM TAUM
        , ( '𖾏', '𖾒' ) -- Mn   [4] MIAO TONE RIGHT..MIAO TONE BELOW
        , ( '𛲝', '𛲞' ) -- Mn   [2] DUPLOYAN THICK LETTER SELECTOR..DUPLOYAN DOUBLE MARK
        , ( '𝅧', '𝅩' ) -- Mn   [3] MUSICAL SYMBOL COMBINING TREMOLO-1..MUSICAL SYMBOL COMBINING TREMOLO-3
        , ( '𝅮', '𝅲' ) -- Mc   [5] MUSICAL SYMBOL COMBINING FLAG-1..MUSICAL SYMBOL COMBINING FLAG-5
        , ( '𝅻', '𝆂' ) -- Mn   [8] MUSICAL SYMBOL COMBINING ACCENT..MUSICAL SYMBOL COMBINING LOURE
        , ( '𝆅', '𝆋' ) -- Mn   [7] MUSICAL SYMBOL COMBINING DOIT..MUSICAL SYMBOL COMBINING TRIPLE TONGUE
        , ( '𝆪', '𝆭' ) -- Mn   [4] MUSICAL SYMBOL COMBINING DOWN BOW..MUSICAL SYMBOL COMBINING SNAP PIZZICATO
        , ( '𝉂', '𝉄' ) -- Mn   [3] COMBINING GREEK MUSICAL TRISEME..COMBINING GREEK MUSICAL PENTASEME
        , ( '\u{1DA00}', '\u{1DA36}' ) -- Mn  [55] SIGNWRITING HEAD RIM..SIGNWRITING AIR SUCKING IN
        , ( '\u{1DA3B}', '\u{1DA6C}' ) -- Mn  [50] SIGNWRITING MOUTH CLOSED NEUTRAL..SIGNWRITING EXCITEMENT
        , ( '\u{1DA9B}', '\u{1DA9F}' ) -- Mn   [5] SIGNWRITING FILL MODIFIER-2..SIGNWRITING FILL MODIFIER-6
        , ( '\u{1DAA1}', '\u{1DAAF}' ) -- Mn  [15] SIGNWRITING ROTATION MODIFIER-2..SIGNWRITING ROTATION MODIFIER-16
        , ( '\u{1E000}', '\u{1E006}' ) -- Mn   [7] COMBINING GLAGOLITIC LETTER AZU..COMBINING GLAGOLITIC LETTER ZHIVETE
        , ( '\u{1E008}', '\u{1E018}' ) -- Mn  [17] COMBINING GLAGOLITIC LETTER ZEMLJA..COMBINING GLAGOLITIC LETTER HERU
        , ( '\u{1E01B}', '\u{1E021}' ) -- Mn   [7] COMBINING GLAGOLITIC LETTER SHTA..COMBINING GLAGOLITIC LETTER YATI
        , ( '\u{1E023}', '\u{1E024}' ) -- Mn   [2] COMBINING GLAGOLITIC LETTER YU..COMBINING GLAGOLITIC LETTER SMALL YUS
        , ( '\u{1E026}', '\u{1E02A}' ) -- Mn   [5] COMBINING GLAGOLITIC LETTER YO..COMBINING GLAGOLITIC LETTER FITA
        , ( '\u{1E130}', '\u{1E136}' ) -- Mn   [7] NYIAKENG PUACHUE HMONG TONE-B..NYIAKENG PUACHUE HMONG TONE-D
        , ( '\u{1E2EC}', '\u{1E2EF}' ) -- Mn   [4] WANCHO TONE TUP..WANCHO TONE KOINI
        , ( '𞣐', '𞣖' ) -- Mn   [7] MENDE KIKAKUI COMBINING NUMBER TEENS..MENDE KIKAKUI COMBINING NUMBER MILLIONS
        , ( '\u{1E944}', '\u{1E94A}' ) -- Mn   [7] ADLAM ALIF LENGTHENER..ADLAM NUKTA
        , ( '\u{1F3FB}', '\u{1F3FF}' ) -- Sk   [5] EMOJI MODIFIER FITZPATRICK TYPE-1-2..EMOJI MODIFIER FITZPATRICK TYPE-6
        , ( '\u{E0020}', '\u{E007F}' ) -- Cf  [96] TAG SPACE..CANCEL TAG
        , ( '󠄀', '󠇯' ) -- Mn [240] VARIATION SELECTOR-17..VARIATION SELECTOR-256
        ]
