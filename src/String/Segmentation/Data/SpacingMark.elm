module String.Segmentation.Data.SpacingMark exposing (chars, match, parser)

{-| Hey, this module was generated automatically. Please don't edit it.

Run `make src/String/Segmentation/Data/SpacingMark.elm` instead!

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
        [ 'ः' -- Mc       DEVANAGARI SIGN VISARGA
        , 'ऻ' -- Mc       DEVANAGARI VOWEL SIGN OOE
        , 'ਃ' -- Mc       GURMUKHI SIGN VISARGA
        , 'ઃ' -- Mc       GUJARATI SIGN VISARGA
        , 'ૉ' -- Mc       GUJARATI VOWEL SIGN CANDRA O
        , 'ୀ' -- Mc       ORIYA VOWEL SIGN II
        , 'ி' -- Mc       TAMIL VOWEL SIGN I
        , 'ಾ' -- Mc       KANNADA VOWEL SIGN AA
        , 'ำ' -- Lo       THAI CHARACTER SARA AM
        , 'ຳ' -- Lo       LAO VOWEL SIGN AM
        , 'ཿ' -- Mc       TIBETAN SIGN RNAM BCAD
        , 'ေ' -- Mc       MYANMAR VOWEL SIGN E
        , 'ႄ' -- Mc       MYANMAR VOWEL SIGN SHAN E
        , 'ា' -- Mc       KHMER VOWEL SIGN AA
        , 'ᩕ' -- Mc       TAI THAM CONSONANT SIGN MEDIAL RA
        , 'ᩗ' -- Mc       TAI THAM CONSONANT SIGN LA TANG LAI
        , 'ᬄ' -- Mc       BALINESE SIGN BISAH
        , 'ᬻ' -- Mc       BALINESE VOWEL SIGN RA REPA TEDUNG
        , 'ᮂ' -- Mc       SUNDANESE SIGN PANGWISAD
        , 'ᮡ' -- Mc       SUNDANESE CONSONANT SIGN PAMINGKAL
        , '᮪' -- Mc       SUNDANESE SIGN PAMAAEH
        , 'ᯧ' -- Mc       BATAK VOWEL SIGN E
        , 'ᯮ' -- Mc       BATAK VOWEL SIGN U
        , '᳡' -- Mc       VEDIC TONE ATHARVAVEDIC INDEPENDENT SVARITA
        , '\u{1CF7}' -- Mc       VEDIC SIGN ATIKRAMA
        , 'ꠧ' -- Mc       SYLOTI NAGRI VOWEL SIGN OO
        , 'ꦃ' -- Mc       JAVANESE SIGN WIGNYAN
        , 'ꩍ' -- Mc       CHAM CONSONANT SIGN FINAL H
        , 'ꫫ' -- Mc       MEETEI MAYEK VOWEL SIGN II
        , 'ꫵ' -- Mc       MEETEI MAYEK VOWEL SIGN VISARGA
        , '꯬' -- Mc       MEETEI MAYEK LUM IYEK
        , '𑀀' -- Mc       BRAHMI SIGN CANDRABINDU
        , '𑀂' -- Mc       BRAHMI SIGN VISARGA
        , '𑂂' -- Mc       KAITHI SIGN VISARGA
        , '𑄬' -- Mc       CHAKMA VOWEL SIGN E
        , '𑆂' -- Mc       SHARADA SIGN VISARGA
        , '𑈵' -- Mc       KHOJKI SIGN VIRAMA
        , '𑌿' -- Mc       GRANTHA VOWEL SIGN I
        , '\u{11445}' -- Mc       NEWA SIGN VISARGA
        , '𑒹' -- Mc       TIRHUTA VOWEL SIGN E
        , '𑒾' -- Mc       TIRHUTA VOWEL SIGN AU
        , '𑓁' -- Mc       TIRHUTA SIGN VISARGA
        , '𑖾' -- Mc       SIDDHAM SIGN VISARGA
        , '𑘾' -- Mc       MODI SIGN VISARGA
        , '𑚬' -- Mc       TAKRI SIGN VISARGA
        , '𑚶' -- Mc       TAKRI SIGN VIRAMA
        , '\u{11726}' -- Mc       AHOM VOWEL SIGN E
        , '\u{11838}' -- Mc       DOGRA SIGN VISARGA
        , '\u{119E4}' -- Mc       NANDINAGARI VOWEL SIGN PRISHTHAMATRA E
        , '\u{11A39}' -- Mc       ZANABAZAR SQUARE SIGN VISARGA
        , '\u{11A97}' -- Mc       SOYOMBO SIGN VISARGA
        , '\u{11C2F}' -- Mc       BHAIKSUKI VOWEL SIGN AA
        , '\u{11C3E}' -- Mc       BHAIKSUKI SIGN VISARGA
        , '\u{11CA9}' -- Mc       MARCHEN SUBJOINED LETTER YA
        , '\u{11CB1}' -- Mc       MARCHEN VOWEL SIGN I
        , '\u{11CB4}' -- Mc       MARCHEN VOWEL SIGN O
        , '\u{11D96}' -- Mc       GUNJALA GONDI SIGN VISARGA
        , '𝅦' -- Mc       MUSICAL SYMBOL COMBINING SPRECHGESANG STEM
        , '𝅭' -- Mc       MUSICAL SYMBOL COMBINING AUGMENTATION DOT
        ]


ranges : List (Range Char)
ranges =
    List.map (\( low, high ) -> Range.range low high)
        [ ( 'ा', 'ी' ) -- Mc   [3] DEVANAGARI VOWEL SIGN AA..DEVANAGARI VOWEL SIGN II
        , ( 'ॉ', 'ौ' ) -- Mc   [4] DEVANAGARI VOWEL SIGN CANDRA O..DEVANAGARI VOWEL SIGN AU
        , ( 'ॎ', 'ॏ' ) -- Mc   [2] DEVANAGARI VOWEL SIGN PRISHTHAMATRA E..DEVANAGARI VOWEL SIGN AW
        , ( 'ং', 'ঃ' ) -- Mc   [2] BENGALI SIGN ANUSVARA..BENGALI SIGN VISARGA
        , ( 'ি', 'ী' ) -- Mc   [2] BENGALI VOWEL SIGN I..BENGALI VOWEL SIGN II
        , ( 'ে', 'ৈ' ) -- Mc   [2] BENGALI VOWEL SIGN E..BENGALI VOWEL SIGN AI
        , ( 'ো', 'ৌ' ) -- Mc   [2] BENGALI VOWEL SIGN O..BENGALI VOWEL SIGN AU
        , ( 'ਾ', 'ੀ' ) -- Mc   [3] GURMUKHI VOWEL SIGN AA..GURMUKHI VOWEL SIGN II
        , ( 'ા', 'ી' ) -- Mc   [3] GUJARATI VOWEL SIGN AA..GUJARATI VOWEL SIGN II
        , ( 'ો', 'ૌ' ) -- Mc   [2] GUJARATI VOWEL SIGN O..GUJARATI VOWEL SIGN AU
        , ( 'ଂ', 'ଃ' ) -- Mc   [2] ORIYA SIGN ANUSVARA..ORIYA SIGN VISARGA
        , ( 'େ', 'ୈ' ) -- Mc   [2] ORIYA VOWEL SIGN E..ORIYA VOWEL SIGN AI
        , ( 'ୋ', 'ୌ' ) -- Mc   [2] ORIYA VOWEL SIGN O..ORIYA VOWEL SIGN AU
        , ( 'ு', 'ூ' ) -- Mc   [2] TAMIL VOWEL SIGN U..TAMIL VOWEL SIGN UU
        , ( 'ெ', 'ை' ) -- Mc   [3] TAMIL VOWEL SIGN E..TAMIL VOWEL SIGN AI
        , ( 'ொ', 'ௌ' ) -- Mc   [3] TAMIL VOWEL SIGN O..TAMIL VOWEL SIGN AU
        , ( 'ఁ', 'ః' ) -- Mc   [3] TELUGU SIGN CANDRABINDU..TELUGU SIGN VISARGA
        , ( 'ు', 'ౄ' ) -- Mc   [4] TELUGU VOWEL SIGN U..TELUGU VOWEL SIGN VOCALIC RR
        , ( 'ಂ', 'ಃ' ) -- Mc   [2] KANNADA SIGN ANUSVARA..KANNADA SIGN VISARGA
        , ( 'ೀ', 'ು' ) -- Mc   [2] KANNADA VOWEL SIGN II..KANNADA VOWEL SIGN U
        , ( 'ೃ', 'ೄ' ) -- Mc   [2] KANNADA VOWEL SIGN VOCALIC R..KANNADA VOWEL SIGN VOCALIC RR
        , ( 'ೇ', 'ೈ' ) -- Mc   [2] KANNADA VOWEL SIGN EE..KANNADA VOWEL SIGN AI
        , ( 'ೊ', 'ೋ' ) -- Mc   [2] KANNADA VOWEL SIGN O..KANNADA VOWEL SIGN OO
        , ( 'ം', 'ഃ' ) -- Mc   [2] MALAYALAM SIGN ANUSVARA..MALAYALAM SIGN VISARGA
        , ( 'ി', 'ീ' ) -- Mc   [2] MALAYALAM VOWEL SIGN I..MALAYALAM VOWEL SIGN II
        , ( 'െ', 'ൈ' ) -- Mc   [3] MALAYALAM VOWEL SIGN E..MALAYALAM VOWEL SIGN AI
        , ( 'ൊ', 'ൌ' ) -- Mc   [3] MALAYALAM VOWEL SIGN O..MALAYALAM VOWEL SIGN AU
        , ( 'ං', 'ඃ' ) -- Mc   [2] SINHALA SIGN ANUSVARAYA..SINHALA SIGN VISARGAYA
        , ( 'ැ', 'ෑ' ) -- Mc   [2] SINHALA VOWEL SIGN KETTI AEDA-PILLA..SINHALA VOWEL SIGN DIGA AEDA-PILLA
        , ( 'ෘ', 'ෞ' ) -- Mc   [7] SINHALA VOWEL SIGN GAETTA-PILLA..SINHALA VOWEL SIGN KOMBUVA HAA GAYANUKITTA
        , ( 'ෲ', 'ෳ' ) -- Mc   [2] SINHALA VOWEL SIGN DIGA GAETTA-PILLA..SINHALA VOWEL SIGN DIGA GAYANUKITTA
        , ( '༾', '༿' ) -- Mc   [2] TIBETAN SIGN YAR TSHES..TIBETAN SIGN MAR TSHES
        , ( 'ျ', 'ြ' ) -- Mc   [2] MYANMAR CONSONANT SIGN MEDIAL YA..MYANMAR CONSONANT SIGN MEDIAL RA
        , ( 'ၖ', 'ၗ' ) -- Mc   [2] MYANMAR VOWEL SIGN VOCALIC R..MYANMAR VOWEL SIGN VOCALIC RR
        , ( 'ើ', 'ៅ' ) -- Mc   [8] KHMER VOWEL SIGN OE..KHMER VOWEL SIGN AU
        , ( 'ះ', 'ៈ' ) -- Mc   [2] KHMER SIGN REAHMUK..KHMER SIGN YUUKALEAPINTU
        , ( 'ᤣ', 'ᤦ' ) -- Mc   [4] LIMBU VOWEL SIGN EE..LIMBU VOWEL SIGN AU
        , ( 'ᤩ', 'ᤫ' ) -- Mc   [3] LIMBU SUBJOINED LETTER YA..LIMBU SUBJOINED LETTER WA
        , ( 'ᤰ', 'ᤱ' ) -- Mc   [2] LIMBU SMALL LETTER KA..LIMBU SMALL LETTER NGA
        , ( 'ᤳ', 'ᤸ' ) -- Mc   [6] LIMBU SMALL LETTER TA..LIMBU SMALL LETTER LA
        , ( 'ᨙ', 'ᨚ' ) -- Mc   [2] BUGINESE VOWEL SIGN E..BUGINESE VOWEL SIGN O
        , ( 'ᩭ', 'ᩲ' ) -- Mc   [6] TAI THAM VOWEL SIGN OY..TAI THAM VOWEL SIGN THAM AI
        , ( 'ᬽ', 'ᭁ' ) -- Mc   [5] BALINESE VOWEL SIGN LA LENGA TEDUNG..BALINESE VOWEL SIGN TALING REPA TEDUNG
        , ( 'ᭃ', '᭄' ) -- Mc   [2] BALINESE VOWEL SIGN PEPET TEDUNG..BALINESE ADEG ADEG
        , ( 'ᮦ', 'ᮧ' ) -- Mc   [2] SUNDANESE VOWEL SIGN PANAELAENG..SUNDANESE VOWEL SIGN PANOLONG
        , ( 'ᯪ', 'ᯬ' ) -- Mc   [3] BATAK VOWEL SIGN I..BATAK VOWEL SIGN O
        , ( '᯲', '᯳' ) -- Mc   [2] BATAK PANGOLAT..BATAK PANONGONAN
        , ( 'ᰤ', 'ᰫ' ) -- Mc   [8] LEPCHA SUBJOINED LETTER YA..LEPCHA VOWEL SIGN UU
        , ( 'ᰴ', 'ᰵ' ) -- Mc   [2] LEPCHA CONSONANT SIGN NYIN-DO..LEPCHA CONSONANT SIGN KANG
        , ( 'ꠣ', 'ꠤ' ) -- Mc   [2] SYLOTI NAGRI VOWEL SIGN A..SYLOTI NAGRI VOWEL SIGN I
        , ( 'ꢀ', 'ꢁ' ) -- Mc   [2] SAURASHTRA SIGN ANUSVARA..SAURASHTRA SIGN VISARGA
        , ( 'ꢴ', 'ꣃ' ) -- Mc  [16] SAURASHTRA CONSONANT SIGN HAARU..SAURASHTRA VOWEL SIGN AU
        , ( 'ꥒ', '꥓' ) -- Mc   [2] REJANG CONSONANT SIGN H..REJANG VIRAMA
        , ( 'ꦴ', 'ꦵ' ) -- Mc   [2] JAVANESE VOWEL SIGN TARUNG..JAVANESE VOWEL SIGN TOLONG
        , ( 'ꦺ', 'ꦻ' ) -- Mc   [2] JAVANESE VOWEL SIGN TALING..JAVANESE VOWEL SIGN DIRGA MURE
        , ( 'ꦾ', '꧀' ) -- Mc   [3] JAVANESE CONSONANT SIGN PENGKAL..JAVANESE PANGKON
        , ( 'ꨯ', 'ꨰ' ) -- Mc   [2] CHAM VOWEL SIGN O..CHAM VOWEL SIGN AI
        , ( 'ꨳ', 'ꨴ' ) -- Mc   [2] CHAM CONSONANT SIGN YA..CHAM CONSONANT SIGN RA
        , ( 'ꫮ', 'ꫯ' ) -- Mc   [2] MEETEI MAYEK VOWEL SIGN AU..MEETEI MAYEK VOWEL SIGN AAU
        , ( 'ꯣ', 'ꯤ' ) -- Mc   [2] MEETEI MAYEK VOWEL SIGN ONAP..MEETEI MAYEK VOWEL SIGN INAP
        , ( 'ꯦ', 'ꯧ' ) -- Mc   [2] MEETEI MAYEK VOWEL SIGN YENAP..MEETEI MAYEK VOWEL SIGN SOUNAP
        , ( 'ꯩ', 'ꯪ' ) -- Mc   [2] MEETEI MAYEK VOWEL SIGN CHEINAP..MEETEI MAYEK VOWEL SIGN NUNG
        , ( '𑂰', '𑂲' ) -- Mc   [3] KAITHI VOWEL SIGN AA..KAITHI VOWEL SIGN II
        , ( '𑂷', '𑂸' ) -- Mc   [2] KAITHI VOWEL SIGN O..KAITHI VOWEL SIGN AU
        , ( '\u{11145}', '\u{11146}' ) -- Mc   [2] CHAKMA VOWEL SIGN AA..CHAKMA VOWEL SIGN EI
        , ( '𑆳', '𑆵' ) -- Mc   [3] SHARADA VOWEL SIGN AA..SHARADA VOWEL SIGN II
        , ( '𑆿', '𑇀' ) -- Mc   [2] SHARADA VOWEL SIGN AU..SHARADA SIGN VIRAMA
        , ( '𑈬', '𑈮' ) -- Mc   [3] KHOJKI VOWEL SIGN AA..KHOJKI VOWEL SIGN II
        , ( '𑈲', '𑈳' ) -- Mc   [2] KHOJKI VOWEL SIGN O..KHOJKI VOWEL SIGN AU
        , ( '𑋠', '𑋢' ) -- Mc   [3] KHUDAWADI VOWEL SIGN AA..KHUDAWADI VOWEL SIGN II
        , ( '𑌂', '𑌃' ) -- Mc   [2] GRANTHA SIGN ANUSVARA..GRANTHA SIGN VISARGA
        , ( '𑍁', '𑍄' ) -- Mc   [4] GRANTHA VOWEL SIGN U..GRANTHA VOWEL SIGN VOCALIC RR
        , ( '𑍇', '𑍈' ) -- Mc   [2] GRANTHA VOWEL SIGN EE..GRANTHA VOWEL SIGN AI
        , ( '𑍋', '𑍍' ) -- Mc   [3] GRANTHA VOWEL SIGN OO..GRANTHA SIGN VIRAMA
        , ( '𑍢', '𑍣' ) -- Mc   [2] GRANTHA VOWEL SIGN VOCALIC L..GRANTHA VOWEL SIGN VOCALIC LL
        , ( '\u{11435}', '\u{11437}' ) -- Mc   [3] NEWA VOWEL SIGN AA..NEWA VOWEL SIGN II
        , ( '\u{11440}', '\u{11441}' ) -- Mc   [2] NEWA VOWEL SIGN O..NEWA VOWEL SIGN AU
        , ( '𑒱', '𑒲' ) -- Mc   [2] TIRHUTA VOWEL SIGN I..TIRHUTA VOWEL SIGN II
        , ( '𑒻', '𑒼' ) -- Mc   [2] TIRHUTA VOWEL SIGN AI..TIRHUTA VOWEL SIGN O
        , ( '𑖰', '𑖱' ) -- Mc   [2] SIDDHAM VOWEL SIGN I..SIDDHAM VOWEL SIGN II
        , ( '𑖸', '𑖻' ) -- Mc   [4] SIDDHAM VOWEL SIGN E..SIDDHAM VOWEL SIGN AU
        , ( '𑘰', '𑘲' ) -- Mc   [3] MODI VOWEL SIGN AA..MODI VOWEL SIGN II
        , ( '𑘻', '𑘼' ) -- Mc   [2] MODI VOWEL SIGN O..MODI VOWEL SIGN AU
        , ( '𑚮', '𑚯' ) -- Mc   [2] TAKRI VOWEL SIGN I..TAKRI VOWEL SIGN II
        , ( '\u{11720}', '\u{11721}' ) -- Mc   [2] AHOM VOWEL SIGN A..AHOM VOWEL SIGN AA
        , ( '\u{1182C}', '\u{1182E}' ) -- Mc   [3] DOGRA VOWEL SIGN AA..DOGRA VOWEL SIGN II
        , ( '\u{119D1}', '\u{119D3}' ) -- Mc   [3] NANDINAGARI VOWEL SIGN AA..NANDINAGARI VOWEL SIGN II
        , ( '\u{119DC}', '\u{119DF}' ) -- Mc   [4] NANDINAGARI VOWEL SIGN O..NANDINAGARI SIGN VISARGA
        , ( '\u{11A57}', '\u{11A58}' ) -- Mc   [2] SOYOMBO VOWEL SIGN AI..SOYOMBO VOWEL SIGN AU
        , ( '\u{11D8A}', '\u{11D8E}' ) -- Mc   [5] GUNJALA GONDI VOWEL SIGN AA..GUNJALA GONDI VOWEL SIGN UU
        , ( '\u{11D93}', '\u{11D94}' ) -- Mc   [2] GUNJALA GONDI VOWEL SIGN OO..GUNJALA GONDI VOWEL SIGN AU
        , ( '\u{11EF5}', '\u{11EF6}' ) -- Mc   [2] MAKASAR VOWEL SIGN E..MAKASAR VOWEL SIGN O
        , ( '𖽑', '\u{16F87}' ) -- Mc  [55] MIAO SIGN ASPIRATION..MIAO VOWEL SIGN UI
        ]
