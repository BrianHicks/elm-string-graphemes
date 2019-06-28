module String.Segmentation.Extend exposing (chars, match, parser)

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
        [ Range.range '̀' 'ͯ' -- Mn [112] COMBINING GRAVE ACCENT..COMBINING LATIN SMALL LETTER X
        , Range.range '҃' '҇' -- Mn   [5] COMBINING CYRILLIC TITLO..COMBINING CYRILLIC POKRYTIE
        , Range.range '҈' '҉' -- Me   [2] COMBINING CYRILLIC HUNDRED THOUSANDS SIGN..COMBINING CYRILLIC MILLIONS SIGN
        , Range.range '֑' 'ֽ' -- Mn  [45] HEBREW ACCENT ETNAHTA..HEBREW POINT METEG
        , Range.point 'ֿ' -- Mn       HEBREW POINT RAFE
        , Range.range 'ׁ' 'ׂ' -- Mn   [2] HEBREW POINT SHIN DOT..HEBREW POINT SIN DOT
        , Range.range 'ׄ' 'ׅ' -- Mn   [2] HEBREW MARK UPPER DOT..HEBREW MARK LOWER DOT
        , Range.point 'ׇ' -- Mn       HEBREW POINT QAMATS QATAN
        , Range.range 'ؐ' 'ؚ' -- Mn  [11] ARABIC SIGN SALLALLAHOU ALAYHE WASSALLAM..ARABIC SMALL KASRA
        , Range.range 'ً' 'ٟ' -- Mn  [21] ARABIC FATHATAN..ARABIC WAVY HAMZA BELOW
        , Range.point 'ٰ' -- Mn       ARABIC LETTER SUPERSCRIPT ALEF
        , Range.range 'ۖ' 'ۜ' -- Mn   [7] ARABIC SMALL HIGH LIGATURE SAD WITH LAM WITH ALEF MAKSURA..ARABIC SMALL HIGH SEEN
        , Range.range '۟' 'ۤ' -- Mn   [6] ARABIC SMALL HIGH ROUNDED ZERO..ARABIC SMALL HIGH MADDA
        , Range.range 'ۧ' 'ۨ' -- Mn   [2] ARABIC SMALL HIGH YEH..ARABIC SMALL HIGH NOON
        , Range.range '۪' 'ۭ' -- Mn   [4] ARABIC EMPTY CENTRE LOW STOP..ARABIC SMALL LOW MEEM
        , Range.point 'ܑ' -- Mn       SYRIAC LETTER SUPERSCRIPT ALAPH
        , Range.range 'ܰ' '݊' -- Mn  [27] SYRIAC PTHAHA ABOVE..SYRIAC BARREKH
        , Range.range 'ަ' 'ް' -- Mn  [11] THAANA ABAFILI..THAANA SUKUN
        , Range.range '߫' '߳' -- Mn   [9] NKO COMBINING SHORT HIGH TONE..NKO COMBINING DOUBLE DOT ABOVE
        , Range.point '\u{07FD}' -- Mn       NKO DANTAYALAN
        , Range.range 'ࠖ' '࠙' -- Mn   [4] SAMARITAN MARK IN..SAMARITAN MARK DAGESH
        , Range.range 'ࠛ' 'ࠣ' -- Mn   [9] SAMARITAN MARK EPENTHETIC YUT..SAMARITAN VOWEL SIGN A
        , Range.range 'ࠥ' 'ࠧ' -- Mn   [3] SAMARITAN VOWEL SIGN SHORT A..SAMARITAN VOWEL SIGN U
        , Range.range 'ࠩ' '࠭' -- Mn   [5] SAMARITAN VOWEL SIGN LONG I..SAMARITAN MARK NEQUDAA
        , Range.range '࡙' '࡛' -- Mn   [3] MANDAIC AFFRICATION MARK..MANDAIC GEMINATION MARK
        , Range.range '\u{08D3}' '\u{08E1}' -- Mn  [15] ARABIC SMALL LOW WAW..ARABIC SMALL HIGH SIGN SAFHA
        , Range.range '\u{08E3}' 'ं' -- Mn  [32] ARABIC TURNED DAMMA BELOW..DEVANAGARI SIGN ANUSVARA
        , Range.point 'ऺ' -- Mn       DEVANAGARI VOWEL SIGN OE
        , Range.point '़' -- Mn       DEVANAGARI SIGN NUKTA
        , Range.range 'ु' 'ै' -- Mn   [8] DEVANAGARI VOWEL SIGN U..DEVANAGARI VOWEL SIGN AI
        , Range.point '्' -- Mn       DEVANAGARI SIGN VIRAMA
        , Range.range '॑' 'ॗ' -- Mn   [7] DEVANAGARI STRESS SIGN UDATTA..DEVANAGARI VOWEL SIGN UUE
        , Range.range 'ॢ' 'ॣ' -- Mn   [2] DEVANAGARI VOWEL SIGN VOCALIC L..DEVANAGARI VOWEL SIGN VOCALIC LL
        , Range.point 'ঁ' -- Mn       BENGALI SIGN CANDRABINDU
        , Range.point '়' -- Mn       BENGALI SIGN NUKTA
        , Range.point 'া' -- Mc       BENGALI VOWEL SIGN AA
        , Range.range 'ু' 'ৄ' -- Mn   [4] BENGALI VOWEL SIGN U..BENGALI VOWEL SIGN VOCALIC RR
        , Range.point '্' -- Mn       BENGALI SIGN VIRAMA
        , Range.point 'ৗ' -- Mc       BENGALI AU LENGTH MARK
        , Range.range 'ৢ' 'ৣ' -- Mn   [2] BENGALI VOWEL SIGN VOCALIC L..BENGALI VOWEL SIGN VOCALIC LL
        , Range.point '\u{09FE}' -- Mn       BENGALI SANDHI MARK
        , Range.range 'ਁ' 'ਂ' -- Mn   [2] GURMUKHI SIGN ADAK BINDI..GURMUKHI SIGN BINDI
        , Range.point '਼' -- Mn       GURMUKHI SIGN NUKTA
        , Range.range 'ੁ' 'ੂ' -- Mn   [2] GURMUKHI VOWEL SIGN U..GURMUKHI VOWEL SIGN UU
        , Range.range 'ੇ' 'ੈ' -- Mn   [2] GURMUKHI VOWEL SIGN EE..GURMUKHI VOWEL SIGN AI
        , Range.range 'ੋ' '੍' -- Mn   [3] GURMUKHI VOWEL SIGN OO..GURMUKHI SIGN VIRAMA
        , Range.point 'ੑ' -- Mn       GURMUKHI SIGN UDAAT
        , Range.range 'ੰ' 'ੱ' -- Mn   [2] GURMUKHI TIPPI..GURMUKHI ADDAK
        , Range.point 'ੵ' -- Mn       GURMUKHI SIGN YAKASH
        , Range.range 'ઁ' 'ં' -- Mn   [2] GUJARATI SIGN CANDRABINDU..GUJARATI SIGN ANUSVARA
        , Range.point '઼' -- Mn       GUJARATI SIGN NUKTA
        , Range.range 'ુ' 'ૅ' -- Mn   [5] GUJARATI VOWEL SIGN U..GUJARATI VOWEL SIGN CANDRA E
        , Range.range 'ે' 'ૈ' -- Mn   [2] GUJARATI VOWEL SIGN E..GUJARATI VOWEL SIGN AI
        , Range.point '્' -- Mn       GUJARATI SIGN VIRAMA
        , Range.range 'ૢ' 'ૣ' -- Mn   [2] GUJARATI VOWEL SIGN VOCALIC L..GUJARATI VOWEL SIGN VOCALIC LL
        , Range.range '\u{0AFA}' '\u{0AFF}' -- Mn   [6] GUJARATI SIGN SUKUN..GUJARATI SIGN TWO-CIRCLE NUKTA ABOVE
        , Range.point 'ଁ' -- Mn       ORIYA SIGN CANDRABINDU
        , Range.point '଼' -- Mn       ORIYA SIGN NUKTA
        , Range.point 'ା' -- Mc       ORIYA VOWEL SIGN AA
        , Range.point 'ି' -- Mn       ORIYA VOWEL SIGN I
        , Range.range 'ୁ' 'ୄ' -- Mn   [4] ORIYA VOWEL SIGN U..ORIYA VOWEL SIGN VOCALIC RR
        , Range.point '୍' -- Mn       ORIYA SIGN VIRAMA
        , Range.point 'ୖ' -- Mn       ORIYA AI LENGTH MARK
        , Range.point 'ୗ' -- Mc       ORIYA AU LENGTH MARK
        , Range.range 'ୢ' 'ୣ' -- Mn   [2] ORIYA VOWEL SIGN VOCALIC L..ORIYA VOWEL SIGN VOCALIC LL
        , Range.point 'ஂ' -- Mn       TAMIL SIGN ANUSVARA
        , Range.point 'ா' -- Mc       TAMIL VOWEL SIGN AA
        , Range.point 'ீ' -- Mn       TAMIL VOWEL SIGN II
        , Range.point '்' -- Mn       TAMIL SIGN VIRAMA
        , Range.point 'ௗ' -- Mc       TAMIL AU LENGTH MARK
        , Range.point 'ఀ' -- Mn       TELUGU SIGN COMBINING CANDRABINDU ABOVE
        , Range.point '\u{0C04}' -- Mn       TELUGU SIGN COMBINING ANUSVARA ABOVE
        , Range.range 'ా' 'ీ' -- Mn   [3] TELUGU VOWEL SIGN AA..TELUGU VOWEL SIGN II
        , Range.range 'ె' 'ై' -- Mn   [3] TELUGU VOWEL SIGN E..TELUGU VOWEL SIGN AI
        , Range.range 'ొ' '్' -- Mn   [4] TELUGU VOWEL SIGN O..TELUGU SIGN VIRAMA
        , Range.range 'ౕ' 'ౖ' -- Mn   [2] TELUGU LENGTH MARK..TELUGU AI LENGTH MARK
        , Range.range 'ౢ' 'ౣ' -- Mn   [2] TELUGU VOWEL SIGN VOCALIC L..TELUGU VOWEL SIGN VOCALIC LL
        , Range.point 'ಁ' -- Mn       KANNADA SIGN CANDRABINDU
        , Range.point '಼' -- Mn       KANNADA SIGN NUKTA
        , Range.point 'ಿ' -- Mn       KANNADA VOWEL SIGN I
        , Range.point 'ೂ' -- Mc       KANNADA VOWEL SIGN UU
        , Range.point 'ೆ' -- Mn       KANNADA VOWEL SIGN E
        , Range.range 'ೌ' '್' -- Mn   [2] KANNADA VOWEL SIGN AU..KANNADA SIGN VIRAMA
        , Range.range 'ೕ' 'ೖ' -- Mc   [2] KANNADA LENGTH MARK..KANNADA AI LENGTH MARK
        , Range.range 'ೢ' 'ೣ' -- Mn   [2] KANNADA VOWEL SIGN VOCALIC L..KANNADA VOWEL SIGN VOCALIC LL
        , Range.range '\u{0D00}' 'ഁ' -- Mn   [2] MALAYALAM SIGN COMBINING ANUSVARA ABOVE..MALAYALAM SIGN CANDRABINDU
        , Range.range '\u{0D3B}' '\u{0D3C}' -- Mn   [2] MALAYALAM SIGN VERTICAL BAR VIRAMA..MALAYALAM SIGN CIRCULAR VIRAMA
        , Range.point 'ാ' -- Mc       MALAYALAM VOWEL SIGN AA
        , Range.range 'ു' 'ൄ' -- Mn   [4] MALAYALAM VOWEL SIGN U..MALAYALAM VOWEL SIGN VOCALIC RR
        , Range.point '്' -- Mn       MALAYALAM SIGN VIRAMA
        , Range.point 'ൗ' -- Mc       MALAYALAM AU LENGTH MARK
        , Range.range 'ൢ' 'ൣ' -- Mn   [2] MALAYALAM VOWEL SIGN VOCALIC L..MALAYALAM VOWEL SIGN VOCALIC LL
        , Range.point '්' -- Mn       SINHALA SIGN AL-LAKUNA
        , Range.point 'ා' -- Mc       SINHALA VOWEL SIGN AELA-PILLA
        , Range.range 'ි' 'ු' -- Mn   [3] SINHALA VOWEL SIGN KETTI IS-PILLA..SINHALA VOWEL SIGN KETTI PAA-PILLA
        , Range.point 'ූ' -- Mn       SINHALA VOWEL SIGN DIGA PAA-PILLA
        , Range.point 'ෟ' -- Mc       SINHALA VOWEL SIGN GAYANUKITTA
        , Range.point 'ั' -- Mn       THAI CHARACTER MAI HAN-AKAT
        , Range.range 'ิ' 'ฺ' -- Mn   [7] THAI CHARACTER SARA I..THAI CHARACTER PHINTHU
        , Range.range '็' '๎' -- Mn   [8] THAI CHARACTER MAITAIKHU..THAI CHARACTER YAMAKKAN
        , Range.point 'ັ' -- Mn       LAO VOWEL SIGN MAI KAN
        , Range.range 'ິ' 'ຼ' -- Mn   [9] LAO VOWEL SIGN I..LAO SEMIVOWEL SIGN LO
        , Range.range '່' 'ໍ' -- Mn   [6] LAO TONE MAI EK..LAO NIGGAHITA
        , Range.range '༘' '༙' -- Mn   [2] TIBETAN ASTROLOGICAL SIGN -KHYUD PA..TIBETAN ASTROLOGICAL SIGN SDONG TSHUGS
        , Range.point '༵' -- Mn       TIBETAN MARK NGAS BZUNG NYI ZLA
        , Range.point '༷' -- Mn       TIBETAN MARK NGAS BZUNG SGOR RTAGS
        , Range.point '༹' -- Mn       TIBETAN MARK TSA -PHRU
        , Range.range 'ཱ' 'ཾ' -- Mn  [14] TIBETAN VOWEL SIGN AA..TIBETAN SIGN RJES SU NGA RO
        , Range.range 'ྀ' '྄' -- Mn   [5] TIBETAN VOWEL SIGN REVERSED I..TIBETAN MARK HALANTA
        , Range.range '྆' '྇' -- Mn   [2] TIBETAN SIGN LCI RTAGS..TIBETAN SIGN YANG RTAGS
        , Range.range 'ྍ' 'ྗ' -- Mn  [11] TIBETAN SUBJOINED SIGN LCE TSA CAN..TIBETAN SUBJOINED LETTER JA
        , Range.range 'ྙ' 'ྼ' -- Mn  [36] TIBETAN SUBJOINED LETTER NYA..TIBETAN SUBJOINED LETTER FIXED-FORM RA
        , Range.point '࿆' -- Mn       TIBETAN SYMBOL PADMA GDAN
        , Range.range 'ိ' 'ူ' -- Mn   [4] MYANMAR VOWEL SIGN I..MYANMAR VOWEL SIGN UU
        , Range.range 'ဲ' '့' -- Mn   [6] MYANMAR VOWEL SIGN AI..MYANMAR SIGN DOT BELOW
        , Range.range '္' '်' -- Mn   [2] MYANMAR SIGN VIRAMA..MYANMAR SIGN ASAT
        , Range.range 'ွ' 'ှ' -- Mn   [2] MYANMAR CONSONANT SIGN MEDIAL WA..MYANMAR CONSONANT SIGN MEDIAL HA
        , Range.range 'ၘ' 'ၙ' -- Mn   [2] MYANMAR VOWEL SIGN VOCALIC L..MYANMAR VOWEL SIGN VOCALIC LL
        , Range.range 'ၞ' 'ၠ' -- Mn   [3] MYANMAR CONSONANT SIGN MON MEDIAL NA..MYANMAR CONSONANT SIGN MON MEDIAL LA
        , Range.range 'ၱ' 'ၴ' -- Mn   [4] MYANMAR VOWEL SIGN GEBA KAREN I..MYANMAR VOWEL SIGN KAYAH EE
        , Range.point 'ႂ' -- Mn       MYANMAR CONSONANT SIGN SHAN MEDIAL WA
        , Range.range 'ႅ' 'ႆ' -- Mn   [2] MYANMAR VOWEL SIGN SHAN E ABOVE..MYANMAR VOWEL SIGN SHAN FINAL Y
        , Range.point 'ႍ' -- Mn       MYANMAR SIGN SHAN COUNCIL EMPHATIC TONE
        , Range.point 'ႝ' -- Mn       MYANMAR VOWEL SIGN AITON AI
        , Range.range '፝' '፟' -- Mn   [3] ETHIOPIC COMBINING GEMINATION AND VOWEL LENGTH MARK..ETHIOPIC COMBINING GEMINATION MARK
        , Range.range 'ᜒ' '᜔' -- Mn   [3] TAGALOG VOWEL SIGN I..TAGALOG SIGN VIRAMA
        , Range.range 'ᜲ' '᜴' -- Mn   [3] HANUNOO VOWEL SIGN I..HANUNOO SIGN PAMUDPOD
        , Range.range 'ᝒ' 'ᝓ' -- Mn   [2] BUHID VOWEL SIGN I..BUHID VOWEL SIGN U
        , Range.range 'ᝲ' 'ᝳ' -- Mn   [2] TAGBANWA VOWEL SIGN I..TAGBANWA VOWEL SIGN U
        , Range.range '឴' '឵' -- Mn   [2] KHMER VOWEL INHERENT AQ..KHMER VOWEL INHERENT AA
        , Range.range 'ិ' 'ួ' -- Mn   [7] KHMER VOWEL SIGN I..KHMER VOWEL SIGN UA
        , Range.point 'ំ' -- Mn       KHMER SIGN NIKAHIT
        , Range.range '៉' '៓' -- Mn  [11] KHMER SIGN MUUSIKATOAN..KHMER SIGN BATHAMASAT
        , Range.point '៝' -- Mn       KHMER SIGN ATTHACAN
        , Range.range '᠋' '᠍' -- Mn   [3] MONGOLIAN FREE VARIATION SELECTOR ONE..MONGOLIAN FREE VARIATION SELECTOR THREE
        , Range.range 'ᢅ' 'ᢆ' -- Mn   [2] MONGOLIAN LETTER ALI GALI BALUDA..MONGOLIAN LETTER ALI GALI THREE BALUDA
        , Range.point 'ᢩ' -- Mn       MONGOLIAN LETTER ALI GALI DAGALGA
        , Range.range 'ᤠ' 'ᤢ' -- Mn   [3] LIMBU VOWEL SIGN A..LIMBU VOWEL SIGN U
        , Range.range 'ᤧ' 'ᤨ' -- Mn   [2] LIMBU VOWEL SIGN E..LIMBU VOWEL SIGN O
        , Range.point 'ᤲ' -- Mn       LIMBU SMALL LETTER ANUSVARA
        , Range.range '᤹' '᤻' -- Mn   [3] LIMBU SIGN MUKPHRENG..LIMBU SIGN SA-I
        , Range.range 'ᨗ' 'ᨘ' -- Mn   [2] BUGINESE VOWEL SIGN I..BUGINESE VOWEL SIGN U
        , Range.point 'ᨛ' -- Mn       BUGINESE VOWEL SIGN AE
        , Range.point 'ᩖ' -- Mn       TAI THAM CONSONANT SIGN MEDIAL LA
        , Range.range 'ᩘ' 'ᩞ' -- Mn   [7] TAI THAM SIGN MAI KANG LAI..TAI THAM CONSONANT SIGN SA
        , Range.point '᩠' -- Mn       TAI THAM SIGN SAKOT
        , Range.point 'ᩢ' -- Mn       TAI THAM VOWEL SIGN MAI SAT
        , Range.range 'ᩥ' 'ᩬ' -- Mn   [8] TAI THAM VOWEL SIGN I..TAI THAM VOWEL SIGN OA BELOW
        , Range.range 'ᩳ' '᩼' -- Mn  [10] TAI THAM VOWEL SIGN OA ABOVE..TAI THAM SIGN KHUEN-LUE KARAN
        , Range.point '᩿' -- Mn       TAI THAM COMBINING CRYPTOGRAMMIC DOT
        , Range.range '᪰' '᪽' -- Mn  [14] COMBINING DOUBLED CIRCUMFLEX ACCENT..COMBINING PARENTHESES BELOW
        , Range.point '᪾' -- Me       COMBINING PARENTHESES OVERLAY
        , Range.range 'ᬀ' 'ᬃ' -- Mn   [4] BALINESE SIGN ULU RICEM..BALINESE SIGN SURANG
        , Range.point '᬴' -- Mn       BALINESE SIGN REREKAN
        , Range.point 'ᬵ' -- Mc       BALINESE VOWEL SIGN TEDUNG
        , Range.range 'ᬶ' 'ᬺ' -- Mn   [5] BALINESE VOWEL SIGN ULU..BALINESE VOWEL SIGN RA REPA
        , Range.point 'ᬼ' -- Mn       BALINESE VOWEL SIGN LA LENGA
        , Range.point 'ᭂ' -- Mn       BALINESE VOWEL SIGN PEPET
        , Range.range '᭫' '᭳' -- Mn   [9] BALINESE MUSICAL SYMBOL COMBINING TEGEH..BALINESE MUSICAL SYMBOL COMBINING GONG
        , Range.range 'ᮀ' 'ᮁ' -- Mn   [2] SUNDANESE SIGN PANYECEK..SUNDANESE SIGN PANGLAYAR
        , Range.range 'ᮢ' 'ᮥ' -- Mn   [4] SUNDANESE CONSONANT SIGN PANYAKRA..SUNDANESE VOWEL SIGN PANYUKU
        , Range.range 'ᮨ' 'ᮩ' -- Mn   [2] SUNDANESE VOWEL SIGN PAMEPET..SUNDANESE VOWEL SIGN PANEULEUNG
        , Range.range '᮫' 'ᮭ' -- Mn   [3] SUNDANESE SIGN VIRAMA..SUNDANESE CONSONANT SIGN PASANGAN WA
        , Range.point '᯦' -- Mn       BATAK SIGN TOMPI
        , Range.range 'ᯨ' 'ᯩ' -- Mn   [2] BATAK VOWEL SIGN PAKPAK E..BATAK VOWEL SIGN EE
        , Range.point 'ᯭ' -- Mn       BATAK VOWEL SIGN KARO O
        , Range.range 'ᯯ' 'ᯱ' -- Mn   [3] BATAK VOWEL SIGN U FOR SIMALUNGUN SA..BATAK CONSONANT SIGN H
        , Range.range 'ᰬ' 'ᰳ' -- Mn   [8] LEPCHA VOWEL SIGN E..LEPCHA CONSONANT SIGN T
        , Range.range 'ᰶ' '᰷' -- Mn   [2] LEPCHA SIGN RAN..LEPCHA SIGN NUKTA
        , Range.range '᳐' '᳒' -- Mn   [3] VEDIC TONE KARSHANA..VEDIC TONE PRENKHA
        , Range.range '᳔' '᳠' -- Mn  [13] VEDIC SIGN YAJURVEDIC MIDLINE SVARITA..VEDIC TONE RIGVEDIC KASHMIRI INDEPENDENT SVARITA
        , Range.range '᳢' '᳨' -- Mn   [7] VEDIC SIGN VISARGA SVARITA..VEDIC SIGN VISARGA ANUDATTA WITH TAIL
        , Range.point '᳭' -- Mn       VEDIC SIGN TIRYAK
        , Range.point '᳴' -- Mn       VEDIC TONE CANDRA ABOVE
        , Range.range '᳸' '᳹' -- Mn   [2] VEDIC TONE RING ABOVE..VEDIC TONE DOUBLE RING ABOVE
        , Range.range '᷀' '\u{1DF9}' -- Mn  [58] COMBINING DOTTED GRAVE ACCENT..COMBINING WIDE INVERTED BRIDGE BELOW
        , Range.range '\u{1DFB}' '᷿' -- Mn   [5] COMBINING DELETION MARK..COMBINING RIGHT ARROWHEAD AND DOWN ARROWHEAD BELOW
        , Range.point '\u{200C}' -- Cf       ZERO WIDTH NON-JOINER
        , Range.range '⃐' '⃜' -- Mn  [13] COMBINING LEFT HARPOON ABOVE..COMBINING FOUR DOTS ABOVE
        , Range.range '⃝' '⃠' -- Me   [4] COMBINING ENCLOSING CIRCLE..COMBINING ENCLOSING CIRCLE BACKSLASH
        , Range.point '⃡' -- Mn       COMBINING LEFT RIGHT ARROW ABOVE
        , Range.range '⃢' '⃤' -- Me   [3] COMBINING ENCLOSING SCREEN..COMBINING ENCLOSING UPWARD POINTING TRIANGLE
        , Range.range '⃥' '⃰' -- Mn  [12] COMBINING REVERSE SOLIDUS OVERLAY..COMBINING ASTERISK ABOVE
        , Range.range '⳯' '⳱' -- Mn   [3] COPTIC COMBINING NI ABOVE..COPTIC COMBINING SPIRITUS LENIS
        , Range.point '⵿' -- Mn       TIFINAGH CONSONANT JOINER
        , Range.range 'ⷠ' 'ⷿ' -- Mn  [32] COMBINING CYRILLIC LETTER BE..COMBINING CYRILLIC LETTER IOTIFIED BIG YUS
        , Range.range '〪' '〭' -- Mn   [4] IDEOGRAPHIC LEVEL TONE MARK..IDEOGRAPHIC ENTERING TONE MARK
        , Range.range '〮' '〯' -- Mc   [2] HANGUL SINGLE DOT TONE MARK..HANGUL DOUBLE DOT TONE MARK
        , Range.range '゙' '゚' -- Mn   [2] COMBINING KATAKANA-HIRAGANA VOICED SOUND MARK..COMBINING KATAKANA-HIRAGANA SEMI-VOICED SOUND MARK
        , Range.point '꙯' -- Mn       COMBINING CYRILLIC VZMET
        , Range.range '꙰' '꙲' -- Me   [3] COMBINING CYRILLIC TEN MILLIONS SIGN..COMBINING CYRILLIC THOUSAND MILLIONS SIGN
        , Range.range 'ꙴ' '꙽' -- Mn  [10] COMBINING CYRILLIC LETTER UKRAINIAN IE..COMBINING CYRILLIC PAYEROK
        , Range.range '\u{A69E}' 'ꚟ' -- Mn   [2] COMBINING CYRILLIC LETTER EF..COMBINING CYRILLIC LETTER IOTIFIED E
        , Range.range '꛰' '꛱' -- Mn   [2] BAMUM COMBINING MARK KOQNDON..BAMUM COMBINING MARK TUKWENTIS
        , Range.point 'ꠂ' -- Mn       SYLOTI NAGRI SIGN DVISVARA
        , Range.point '꠆' -- Mn       SYLOTI NAGRI SIGN HASANTA
        , Range.point 'ꠋ' -- Mn       SYLOTI NAGRI SIGN ANUSVARA
        , Range.range 'ꠥ' 'ꠦ' -- Mn   [2] SYLOTI NAGRI VOWEL SIGN U..SYLOTI NAGRI VOWEL SIGN E
        , Range.range '꣄' '\u{A8C5}' -- Mn   [2] SAURASHTRA SIGN VIRAMA..SAURASHTRA SIGN CANDRABINDU
        , Range.range '꣠' '꣱' -- Mn  [18] COMBINING DEVANAGARI DIGIT ZERO..COMBINING DEVANAGARI SIGN AVAGRAHA
        , Range.point '\u{A8FF}' -- Mn       DEVANAGARI VOWEL SIGN AY
        , Range.range 'ꤦ' '꤭' -- Mn   [8] KAYAH LI VOWEL UE..KAYAH LI TONE CALYA PLOPHU
        , Range.range 'ꥇ' 'ꥑ' -- Mn  [11] REJANG VOWEL SIGN I..REJANG CONSONANT SIGN R
        , Range.range 'ꦀ' 'ꦂ' -- Mn   [3] JAVANESE SIGN PANYANGGA..JAVANESE SIGN LAYAR
        , Range.point '꦳' -- Mn       JAVANESE SIGN CECAK TELU
        , Range.range 'ꦶ' 'ꦹ' -- Mn   [4] JAVANESE VOWEL SIGN WULU..JAVANESE VOWEL SIGN SUKU MENDUT
        , Range.range 'ꦼ' 'ꦽ' -- Mn   [2] JAVANESE VOWEL SIGN PEPET..JAVANESE CONSONANT SIGN KERET
        , Range.point 'ꧥ' -- Mn       MYANMAR SIGN SHAN SAW
        , Range.range 'ꨩ' 'ꨮ' -- Mn   [6] CHAM VOWEL SIGN AA..CHAM VOWEL SIGN OE
        , Range.range 'ꨱ' 'ꨲ' -- Mn   [2] CHAM VOWEL SIGN AU..CHAM VOWEL SIGN UE
        , Range.range 'ꨵ' 'ꨶ' -- Mn   [2] CHAM CONSONANT SIGN LA..CHAM CONSONANT SIGN WA
        , Range.point 'ꩃ' -- Mn       CHAM CONSONANT SIGN FINAL NG
        , Range.point 'ꩌ' -- Mn       CHAM CONSONANT SIGN FINAL M
        , Range.point 'ꩼ' -- Mn       MYANMAR SIGN TAI LAING TONE-2
        , Range.point 'ꪰ' -- Mn       TAI VIET MAI KANG
        , Range.range 'ꪲ' 'ꪴ' -- Mn   [3] TAI VIET VOWEL I..TAI VIET VOWEL U
        , Range.range 'ꪷ' 'ꪸ' -- Mn   [2] TAI VIET MAI KHIT..TAI VIET VOWEL IA
        , Range.range 'ꪾ' '꪿' -- Mn   [2] TAI VIET VOWEL AM..TAI VIET TONE MAI EK
        , Range.point '꫁' -- Mn       TAI VIET TONE MAI THO
        , Range.range 'ꫬ' 'ꫭ' -- Mn   [2] MEETEI MAYEK VOWEL SIGN UU..MEETEI MAYEK VOWEL SIGN AAI
        , Range.point '꫶' -- Mn       MEETEI MAYEK VIRAMA
        , Range.point 'ꯥ' -- Mn       MEETEI MAYEK VOWEL SIGN ANAP
        , Range.point 'ꯨ' -- Mn       MEETEI MAYEK VOWEL SIGN UNAP
        , Range.point '꯭' -- Mn       MEETEI MAYEK APUN IYEK
        , Range.point 'ﬞ' -- Mn       HEBREW POINT JUDEO-SPANISH VARIKA
        , Range.range '︀' '️' -- Mn  [16] VARIATION SELECTOR-1..VARIATION SELECTOR-16
        , Range.range '︠' '\u{FE2F}' -- Mn  [16] COMBINING LIGATURE LEFT HALF..COMBINING CYRILLIC TITLO RIGHT HALF
        , Range.range 'ﾞ' 'ﾟ' -- Lm   [2] HALFWIDTH KATAKANA VOICED SOUND MARK..HALFWIDTH KATAKANA SEMI-VOICED SOUND MARK
        , Range.point '𐇽' -- Mn       PHAISTOS DISC SIGN COMBINING OBLIQUE STROKE
        , Range.point '𐋠' -- Mn       COPTIC EPACT THOUSANDS MARK
        , Range.range '𐍶' '𐍺' -- Mn   [5] COMBINING OLD PERMIC LETTER AN..COMBINING OLD PERMIC LETTER SII
        , Range.range '𐨁' '𐨃' -- Mn   [3] KHAROSHTHI VOWEL SIGN I..KHAROSHTHI VOWEL SIGN VOCALIC R
        , Range.range '𐨅' '𐨆' -- Mn   [2] KHAROSHTHI VOWEL SIGN E..KHAROSHTHI VOWEL SIGN O
        , Range.range '𐨌' '𐨏' -- Mn   [4] KHAROSHTHI VOWEL LENGTH MARK..KHAROSHTHI SIGN VISARGA
        , Range.range '𐨸' '𐨺' -- Mn   [3] KHAROSHTHI SIGN BAR ABOVE..KHAROSHTHI SIGN DOT BELOW
        , Range.point '𐨿' -- Mn       KHAROSHTHI VIRAMA
        , Range.range '𐫥' '𐫦' -- Mn   [2] MANICHAEAN ABBREVIATION MARK ABOVE..MANICHAEAN ABBREVIATION MARK BELOW
        , Range.range '\u{10D24}' '\u{10D27}' -- Mn   [4] HANIFI ROHINGYA SIGN HARBAHAY..HANIFI ROHINGYA SIGN TASSI
        , Range.range '\u{10F46}' '\u{10F50}' -- Mn  [11] SOGDIAN COMBINING DOT BELOW..SOGDIAN COMBINING STROKE BELOW
        , Range.point '𑀁' -- Mn       BRAHMI SIGN ANUSVARA
        , Range.range '𑀸' '𑁆' -- Mn  [15] BRAHMI VOWEL SIGN AA..BRAHMI VIRAMA
        , Range.range '𑁿' '𑂁' -- Mn   [3] BRAHMI NUMBER JOINER..KAITHI SIGN ANUSVARA
        , Range.range '𑂳' '𑂶' -- Mn   [4] KAITHI VOWEL SIGN U..KAITHI VOWEL SIGN AI
        , Range.range '𑂹' '𑂺' -- Mn   [2] KAITHI SIGN VIRAMA..KAITHI SIGN NUKTA
        , Range.range '𑄀' '𑄂' -- Mn   [3] CHAKMA SIGN CANDRABINDU..CHAKMA SIGN VISARGA
        , Range.range '𑄧' '𑄫' -- Mn   [5] CHAKMA VOWEL SIGN A..CHAKMA VOWEL SIGN UU
        , Range.range '𑄭' '𑄴' -- Mn   [8] CHAKMA VOWEL SIGN AI..CHAKMA MAAYYAA
        , Range.point '𑅳' -- Mn       MAHAJANI SIGN NUKTA
        , Range.range '𑆀' '𑆁' -- Mn   [2] SHARADA SIGN CANDRABINDU..SHARADA SIGN ANUSVARA
        , Range.range '𑆶' '𑆾' -- Mn   [9] SHARADA VOWEL SIGN U..SHARADA VOWEL SIGN O
        , Range.range '\u{111C9}' '\u{111CC}' -- Mn   [4] SHARADA SANDHI MARK..SHARADA EXTRA SHORT VOWEL MARK
        , Range.range '𑈯' '𑈱' -- Mn   [3] KHOJKI VOWEL SIGN U..KHOJKI VOWEL SIGN AI
        , Range.point '𑈴' -- Mn       KHOJKI SIGN ANUSVARA
        , Range.range '𑈶' '𑈷' -- Mn   [2] KHOJKI SIGN NUKTA..KHOJKI SIGN SHADDA
        , Range.point '\u{1123E}' -- Mn       KHOJKI SIGN SUKUN
        , Range.point '𑋟' -- Mn       KHUDAWADI SIGN ANUSVARA
        , Range.range '𑋣' '𑋪' -- Mn   [8] KHUDAWADI VOWEL SIGN U..KHUDAWADI SIGN VIRAMA
        , Range.range '\u{11300}' '𑌁' -- Mn   [2] GRANTHA SIGN COMBINING ANUSVARA ABOVE..GRANTHA SIGN CANDRABINDU
        , Range.range '\u{1133B}' '𑌼' -- Mn   [2] COMBINING BINDU BELOW..GRANTHA SIGN NUKTA
        , Range.point '𑌾' -- Mc       GRANTHA VOWEL SIGN AA
        , Range.point '𑍀' -- Mn       GRANTHA VOWEL SIGN II
        , Range.point '𑍗' -- Mc       GRANTHA AU LENGTH MARK
        , Range.range '𑍦' '𑍬' -- Mn   [7] COMBINING GRANTHA DIGIT ZERO..COMBINING GRANTHA DIGIT SIX
        , Range.range '𑍰' '𑍴' -- Mn   [5] COMBINING GRANTHA LETTER A..COMBINING GRANTHA LETTER PA
        , Range.range '\u{11438}' '\u{1143F}' -- Mn   [8] NEWA VOWEL SIGN U..NEWA VOWEL SIGN AI
        , Range.range '\u{11442}' '\u{11444}' -- Mn   [3] NEWA SIGN VIRAMA..NEWA SIGN ANUSVARA
        , Range.point '\u{11446}' -- Mn       NEWA SIGN NUKTA
        , Range.point '\u{1145E}' -- Mn       NEWA SANDHI MARK
        , Range.point '𑒰' -- Mc       TIRHUTA VOWEL SIGN AA
        , Range.range '𑒳' '𑒸' -- Mn   [6] TIRHUTA VOWEL SIGN U..TIRHUTA VOWEL SIGN VOCALIC LL
        , Range.point '𑒺' -- Mn       TIRHUTA VOWEL SIGN SHORT E
        , Range.point '𑒽' -- Mc       TIRHUTA VOWEL SIGN SHORT O
        , Range.range '𑒿' '𑓀' -- Mn   [2] TIRHUTA SIGN CANDRABINDU..TIRHUTA SIGN ANUSVARA
        , Range.range '𑓂' '𑓃' -- Mn   [2] TIRHUTA SIGN VIRAMA..TIRHUTA SIGN NUKTA
        , Range.point '𑖯' -- Mc       SIDDHAM VOWEL SIGN AA
        , Range.range '𑖲' '𑖵' -- Mn   [4] SIDDHAM VOWEL SIGN U..SIDDHAM VOWEL SIGN VOCALIC RR
        , Range.range '𑖼' '𑖽' -- Mn   [2] SIDDHAM SIGN CANDRABINDU..SIDDHAM SIGN ANUSVARA
        , Range.range '𑖿' '𑗀' -- Mn   [2] SIDDHAM SIGN VIRAMA..SIDDHAM SIGN NUKTA
        , Range.range '\u{115DC}' '\u{115DD}' -- Mn   [2] SIDDHAM VOWEL SIGN ALTERNATE U..SIDDHAM VOWEL SIGN ALTERNATE UU
        , Range.range '𑘳' '𑘺' -- Mn   [8] MODI VOWEL SIGN U..MODI VOWEL SIGN AI
        , Range.point '𑘽' -- Mn       MODI SIGN ANUSVARA
        , Range.range '𑘿' '𑙀' -- Mn   [2] MODI SIGN VIRAMA..MODI SIGN ARDHACANDRA
        , Range.point '𑚫' -- Mn       TAKRI SIGN ANUSVARA
        , Range.point '𑚭' -- Mn       TAKRI VOWEL SIGN AA
        , Range.range '𑚰' '𑚵' -- Mn   [6] TAKRI VOWEL SIGN U..TAKRI VOWEL SIGN AU
        , Range.point '𑚷' -- Mn       TAKRI SIGN NUKTA
        , Range.range '\u{1171D}' '\u{1171F}' -- Mn   [3] AHOM CONSONANT SIGN MEDIAL LA..AHOM CONSONANT SIGN MEDIAL LIGATING RA
        , Range.range '\u{11722}' '\u{11725}' -- Mn   [4] AHOM VOWEL SIGN I..AHOM VOWEL SIGN UU
        , Range.range '\u{11727}' '\u{1172B}' -- Mn   [5] AHOM VOWEL SIGN AW..AHOM SIGN KILLER
        , Range.range '\u{1182F}' '\u{11837}' -- Mn   [9] DOGRA VOWEL SIGN U..DOGRA SIGN ANUSVARA
        , Range.range '\u{11839}' '\u{1183A}' -- Mn   [2] DOGRA SIGN VIRAMA..DOGRA SIGN NUKTA
        , Range.range '\u{119D4}' '\u{119D7}' -- Mn   [4] NANDINAGARI VOWEL SIGN U..NANDINAGARI VOWEL SIGN VOCALIC RR
        , Range.range '\u{119DA}' '\u{119DB}' -- Mn   [2] NANDINAGARI VOWEL SIGN E..NANDINAGARI VOWEL SIGN AI
        , Range.point '\u{119E0}' -- Mn       NANDINAGARI SIGN VIRAMA
        , Range.range '\u{11A01}' '\u{11A0A}' -- Mn  [10] ZANABAZAR SQUARE VOWEL SIGN I..ZANABAZAR SQUARE VOWEL LENGTH MARK
        , Range.range '\u{11A33}' '\u{11A38}' -- Mn   [6] ZANABAZAR SQUARE FINAL CONSONANT MARK..ZANABAZAR SQUARE SIGN ANUSVARA
        , Range.range '\u{11A3B}' '\u{11A3E}' -- Mn   [4] ZANABAZAR SQUARE CLUSTER-FINAL LETTER YA..ZANABAZAR SQUARE CLUSTER-FINAL LETTER VA
        , Range.point '\u{11A47}' -- Mn       ZANABAZAR SQUARE SUBJOINER
        , Range.range '\u{11A51}' '\u{11A56}' -- Mn   [6] SOYOMBO VOWEL SIGN I..SOYOMBO VOWEL SIGN OE
        , Range.range '\u{11A59}' '\u{11A5B}' -- Mn   [3] SOYOMBO VOWEL SIGN VOCALIC R..SOYOMBO VOWEL LENGTH MARK
        , Range.range '\u{11A8A}' '\u{11A96}' -- Mn  [13] SOYOMBO FINAL CONSONANT SIGN G..SOYOMBO SIGN ANUSVARA
        , Range.range '\u{11A98}' '\u{11A99}' -- Mn   [2] SOYOMBO GEMINATION MARK..SOYOMBO SUBJOINER
        , Range.range '\u{11C30}' '\u{11C36}' -- Mn   [7] BHAIKSUKI VOWEL SIGN I..BHAIKSUKI VOWEL SIGN VOCALIC L
        , Range.range '\u{11C38}' '\u{11C3D}' -- Mn   [6] BHAIKSUKI VOWEL SIGN E..BHAIKSUKI SIGN ANUSVARA
        , Range.point '\u{11C3F}' -- Mn       BHAIKSUKI SIGN VIRAMA
        , Range.range '\u{11C92}' '\u{11CA7}' -- Mn  [22] MARCHEN SUBJOINED LETTER KA..MARCHEN SUBJOINED LETTER ZA
        , Range.range '\u{11CAA}' '\u{11CB0}' -- Mn   [7] MARCHEN SUBJOINED LETTER RA..MARCHEN VOWEL SIGN AA
        , Range.range '\u{11CB2}' '\u{11CB3}' -- Mn   [2] MARCHEN VOWEL SIGN U..MARCHEN VOWEL SIGN E
        , Range.range '\u{11CB5}' '\u{11CB6}' -- Mn   [2] MARCHEN SIGN ANUSVARA..MARCHEN SIGN CANDRABINDU
        , Range.range '\u{11D31}' '\u{11D36}' -- Mn   [6] MASARAM GONDI VOWEL SIGN AA..MASARAM GONDI VOWEL SIGN VOCALIC R
        , Range.point '\u{11D3A}' -- Mn       MASARAM GONDI VOWEL SIGN E
        , Range.range '\u{11D3C}' '\u{11D3D}' -- Mn   [2] MASARAM GONDI VOWEL SIGN AI..MASARAM GONDI VOWEL SIGN O
        , Range.range '\u{11D3F}' '\u{11D45}' -- Mn   [7] MASARAM GONDI VOWEL SIGN AU..MASARAM GONDI VIRAMA
        , Range.point '\u{11D47}' -- Mn       MASARAM GONDI RA-KARA
        , Range.range '\u{11D90}' '\u{11D91}' -- Mn   [2] GUNJALA GONDI VOWEL SIGN EE..GUNJALA GONDI VOWEL SIGN AI
        , Range.point '\u{11D95}' -- Mn       GUNJALA GONDI SIGN ANUSVARA
        , Range.point '\u{11D97}' -- Mn       GUNJALA GONDI VIRAMA
        , Range.range '\u{11EF3}' '\u{11EF4}' -- Mn   [2] MAKASAR VOWEL SIGN I..MAKASAR VOWEL SIGN U
        , Range.range '𖫰' '𖫴' -- Mn   [5] BASSA VAH COMBINING HIGH TONE..BASSA VAH COMBINING HIGH-LOW TONE
        , Range.range '𖬰' '𖬶' -- Mn   [7] PAHAWH HMONG MARK CIM TUB..PAHAWH HMONG MARK CIM TAUM
        , Range.point '\u{16F4F}' -- Mn       MIAO SIGN CONSONANT MODIFIER BAR
        , Range.range '𖾏' '𖾒' -- Mn   [4] MIAO TONE RIGHT..MIAO TONE BELOW
        , Range.range '𛲝' '𛲞' -- Mn   [2] DUPLOYAN THICK LETTER SELECTOR..DUPLOYAN DOUBLE MARK
        , Range.point '𝅥' -- Mc       MUSICAL SYMBOL COMBINING STEM
        , Range.range '𝅧' '𝅩' -- Mn   [3] MUSICAL SYMBOL COMBINING TREMOLO-1..MUSICAL SYMBOL COMBINING TREMOLO-3
        , Range.range '𝅮' '𝅲' -- Mc   [5] MUSICAL SYMBOL COMBINING FLAG-1..MUSICAL SYMBOL COMBINING FLAG-5
        , Range.range '𝅻' '𝆂' -- Mn   [8] MUSICAL SYMBOL COMBINING ACCENT..MUSICAL SYMBOL COMBINING LOURE
        , Range.range '𝆅' '𝆋' -- Mn   [7] MUSICAL SYMBOL COMBINING DOIT..MUSICAL SYMBOL COMBINING TRIPLE TONGUE
        , Range.range '𝆪' '𝆭' -- Mn   [4] MUSICAL SYMBOL COMBINING DOWN BOW..MUSICAL SYMBOL COMBINING SNAP PIZZICATO
        , Range.range '𝉂' '𝉄' -- Mn   [3] COMBINING GREEK MUSICAL TRISEME..COMBINING GREEK MUSICAL PENTASEME
        , Range.range '\u{1DA00}' '\u{1DA36}' -- Mn  [55] SIGNWRITING HEAD RIM..SIGNWRITING AIR SUCKING IN
        , Range.range '\u{1DA3B}' '\u{1DA6C}' -- Mn  [50] SIGNWRITING MOUTH CLOSED NEUTRAL..SIGNWRITING EXCITEMENT
        , Range.point '\u{1DA75}' -- Mn       SIGNWRITING UPPER BODY TILTING FROM HIP JOINTS
        , Range.point '\u{1DA84}' -- Mn       SIGNWRITING LOCATION HEAD NECK
        , Range.range '\u{1DA9B}' '\u{1DA9F}' -- Mn   [5] SIGNWRITING FILL MODIFIER-2..SIGNWRITING FILL MODIFIER-6
        , Range.range '\u{1DAA1}' '\u{1DAAF}' -- Mn  [15] SIGNWRITING ROTATION MODIFIER-2..SIGNWRITING ROTATION MODIFIER-16
        , Range.range '\u{1E000}' '\u{1E006}' -- Mn   [7] COMBINING GLAGOLITIC LETTER AZU..COMBINING GLAGOLITIC LETTER ZHIVETE
        , Range.range '\u{1E008}' '\u{1E018}' -- Mn  [17] COMBINING GLAGOLITIC LETTER ZEMLJA..COMBINING GLAGOLITIC LETTER HERU
        , Range.range '\u{1E01B}' '\u{1E021}' -- Mn   [7] COMBINING GLAGOLITIC LETTER SHTA..COMBINING GLAGOLITIC LETTER YATI
        , Range.range '\u{1E023}' '\u{1E024}' -- Mn   [2] COMBINING GLAGOLITIC LETTER YU..COMBINING GLAGOLITIC LETTER SMALL YUS
        , Range.range '\u{1E026}' '\u{1E02A}' -- Mn   [5] COMBINING GLAGOLITIC LETTER YO..COMBINING GLAGOLITIC LETTER FITA
        , Range.range '\u{1E130}' '\u{1E136}' -- Mn   [7] NYIAKENG PUACHUE HMONG TONE-B..NYIAKENG PUACHUE HMONG TONE-D
        , Range.range '\u{1E2EC}' '\u{1E2EF}' -- Mn   [4] WANCHO TONE TUP..WANCHO TONE KOINI
        , Range.range '𞣐' '𞣖' -- Mn   [7] MENDE KIKAKUI COMBINING NUMBER TEENS..MENDE KIKAKUI COMBINING NUMBER MILLIONS
        , Range.range '\u{1E944}' '\u{1E94A}' -- Mn   [7] ADLAM ALIF LENGTHENER..ADLAM NUKTA
        , Range.range '\u{1F3FB}' '\u{1F3FF}' -- Sk   [5] EMOJI MODIFIER FITZPATRICK TYPE-1-2..EMOJI MODIFIER FITZPATRICK TYPE-6
        , Range.range '\u{E0020}' '\u{E007F}' -- Cf  [96] TAG SPACE..CANCEL TAG
        , Range.range '󠄀' '󠇯' -- Mn [240] VARIATION SELECTOR-17..VARIATION SELECTOR-256
        ]
