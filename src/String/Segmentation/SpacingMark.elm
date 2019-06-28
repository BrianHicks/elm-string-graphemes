module String.Segmentation.SpacingMark exposing (chars, match, parser)

{-| Hey, this module was generated automatically. Please don't edit it.

Run `make src/String/Segmentation/SpacingMark.elm` instead!

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
        [ Range.point 'ः' -- Mc       DEVANAGARI SIGN VISARGA
        , Range.point 'ऻ' -- Mc       DEVANAGARI VOWEL SIGN OOE
        , Range.range 'ा' 'ी' -- Mc   [3] DEVANAGARI VOWEL SIGN AA..DEVANAGARI VOWEL SIGN II
        , Range.range 'ॉ' 'ौ' -- Mc   [4] DEVANAGARI VOWEL SIGN CANDRA O..DEVANAGARI VOWEL SIGN AU
        , Range.range 'ॎ' 'ॏ' -- Mc   [2] DEVANAGARI VOWEL SIGN PRISHTHAMATRA E..DEVANAGARI VOWEL SIGN AW
        , Range.range 'ং' 'ঃ' -- Mc   [2] BENGALI SIGN ANUSVARA..BENGALI SIGN VISARGA
        , Range.range 'ি' 'ী' -- Mc   [2] BENGALI VOWEL SIGN I..BENGALI VOWEL SIGN II
        , Range.range 'ে' 'ৈ' -- Mc   [2] BENGALI VOWEL SIGN E..BENGALI VOWEL SIGN AI
        , Range.range 'ো' 'ৌ' -- Mc   [2] BENGALI VOWEL SIGN O..BENGALI VOWEL SIGN AU
        , Range.point 'ਃ' -- Mc       GURMUKHI SIGN VISARGA
        , Range.range 'ਾ' 'ੀ' -- Mc   [3] GURMUKHI VOWEL SIGN AA..GURMUKHI VOWEL SIGN II
        , Range.point 'ઃ' -- Mc       GUJARATI SIGN VISARGA
        , Range.range 'ા' 'ી' -- Mc   [3] GUJARATI VOWEL SIGN AA..GUJARATI VOWEL SIGN II
        , Range.point 'ૉ' -- Mc       GUJARATI VOWEL SIGN CANDRA O
        , Range.range 'ો' 'ૌ' -- Mc   [2] GUJARATI VOWEL SIGN O..GUJARATI VOWEL SIGN AU
        , Range.range 'ଂ' 'ଃ' -- Mc   [2] ORIYA SIGN ANUSVARA..ORIYA SIGN VISARGA
        , Range.point 'ୀ' -- Mc       ORIYA VOWEL SIGN II
        , Range.range 'େ' 'ୈ' -- Mc   [2] ORIYA VOWEL SIGN E..ORIYA VOWEL SIGN AI
        , Range.range 'ୋ' 'ୌ' -- Mc   [2] ORIYA VOWEL SIGN O..ORIYA VOWEL SIGN AU
        , Range.point 'ி' -- Mc       TAMIL VOWEL SIGN I
        , Range.range 'ு' 'ூ' -- Mc   [2] TAMIL VOWEL SIGN U..TAMIL VOWEL SIGN UU
        , Range.range 'ெ' 'ை' -- Mc   [3] TAMIL VOWEL SIGN E..TAMIL VOWEL SIGN AI
        , Range.range 'ொ' 'ௌ' -- Mc   [3] TAMIL VOWEL SIGN O..TAMIL VOWEL SIGN AU
        , Range.range 'ఁ' 'ః' -- Mc   [3] TELUGU SIGN CANDRABINDU..TELUGU SIGN VISARGA
        , Range.range 'ు' 'ౄ' -- Mc   [4] TELUGU VOWEL SIGN U..TELUGU VOWEL SIGN VOCALIC RR
        , Range.range 'ಂ' 'ಃ' -- Mc   [2] KANNADA SIGN ANUSVARA..KANNADA SIGN VISARGA
        , Range.point 'ಾ' -- Mc       KANNADA VOWEL SIGN AA
        , Range.range 'ೀ' 'ು' -- Mc   [2] KANNADA VOWEL SIGN II..KANNADA VOWEL SIGN U
        , Range.range 'ೃ' 'ೄ' -- Mc   [2] KANNADA VOWEL SIGN VOCALIC R..KANNADA VOWEL SIGN VOCALIC RR
        , Range.range 'ೇ' 'ೈ' -- Mc   [2] KANNADA VOWEL SIGN EE..KANNADA VOWEL SIGN AI
        , Range.range 'ೊ' 'ೋ' -- Mc   [2] KANNADA VOWEL SIGN O..KANNADA VOWEL SIGN OO
        , Range.range 'ം' 'ഃ' -- Mc   [2] MALAYALAM SIGN ANUSVARA..MALAYALAM SIGN VISARGA
        , Range.range 'ി' 'ീ' -- Mc   [2] MALAYALAM VOWEL SIGN I..MALAYALAM VOWEL SIGN II
        , Range.range 'െ' 'ൈ' -- Mc   [3] MALAYALAM VOWEL SIGN E..MALAYALAM VOWEL SIGN AI
        , Range.range 'ൊ' 'ൌ' -- Mc   [3] MALAYALAM VOWEL SIGN O..MALAYALAM VOWEL SIGN AU
        , Range.range 'ං' 'ඃ' -- Mc   [2] SINHALA SIGN ANUSVARAYA..SINHALA SIGN VISARGAYA
        , Range.range 'ැ' 'ෑ' -- Mc   [2] SINHALA VOWEL SIGN KETTI AEDA-PILLA..SINHALA VOWEL SIGN DIGA AEDA-PILLA
        , Range.range 'ෘ' 'ෞ' -- Mc   [7] SINHALA VOWEL SIGN GAETTA-PILLA..SINHALA VOWEL SIGN KOMBUVA HAA GAYANUKITTA
        , Range.range 'ෲ' 'ෳ' -- Mc   [2] SINHALA VOWEL SIGN DIGA GAETTA-PILLA..SINHALA VOWEL SIGN DIGA GAYANUKITTA
        , Range.point 'ำ' -- Lo       THAI CHARACTER SARA AM
        , Range.point 'ຳ' -- Lo       LAO VOWEL SIGN AM
        , Range.range '༾' '༿' -- Mc   [2] TIBETAN SIGN YAR TSHES..TIBETAN SIGN MAR TSHES
        , Range.point 'ཿ' -- Mc       TIBETAN SIGN RNAM BCAD
        , Range.point 'ေ' -- Mc       MYANMAR VOWEL SIGN E
        , Range.range 'ျ' 'ြ' -- Mc   [2] MYANMAR CONSONANT SIGN MEDIAL YA..MYANMAR CONSONANT SIGN MEDIAL RA
        , Range.range 'ၖ' 'ၗ' -- Mc   [2] MYANMAR VOWEL SIGN VOCALIC R..MYANMAR VOWEL SIGN VOCALIC RR
        , Range.point 'ႄ' -- Mc       MYANMAR VOWEL SIGN SHAN E
        , Range.point 'ា' -- Mc       KHMER VOWEL SIGN AA
        , Range.range 'ើ' 'ៅ' -- Mc   [8] KHMER VOWEL SIGN OE..KHMER VOWEL SIGN AU
        , Range.range 'ះ' 'ៈ' -- Mc   [2] KHMER SIGN REAHMUK..KHMER SIGN YUUKALEAPINTU
        , Range.range 'ᤣ' 'ᤦ' -- Mc   [4] LIMBU VOWEL SIGN EE..LIMBU VOWEL SIGN AU
        , Range.range 'ᤩ' 'ᤫ' -- Mc   [3] LIMBU SUBJOINED LETTER YA..LIMBU SUBJOINED LETTER WA
        , Range.range 'ᤰ' 'ᤱ' -- Mc   [2] LIMBU SMALL LETTER KA..LIMBU SMALL LETTER NGA
        , Range.range 'ᤳ' 'ᤸ' -- Mc   [6] LIMBU SMALL LETTER TA..LIMBU SMALL LETTER LA
        , Range.range 'ᨙ' 'ᨚ' -- Mc   [2] BUGINESE VOWEL SIGN E..BUGINESE VOWEL SIGN O
        , Range.point 'ᩕ' -- Mc       TAI THAM CONSONANT SIGN MEDIAL RA
        , Range.point 'ᩗ' -- Mc       TAI THAM CONSONANT SIGN LA TANG LAI
        , Range.range 'ᩭ' 'ᩲ' -- Mc   [6] TAI THAM VOWEL SIGN OY..TAI THAM VOWEL SIGN THAM AI
        , Range.point 'ᬄ' -- Mc       BALINESE SIGN BISAH
        , Range.point 'ᬻ' -- Mc       BALINESE VOWEL SIGN RA REPA TEDUNG
        , Range.range 'ᬽ' 'ᭁ' -- Mc   [5] BALINESE VOWEL SIGN LA LENGA TEDUNG..BALINESE VOWEL SIGN TALING REPA TEDUNG
        , Range.range 'ᭃ' '᭄' -- Mc   [2] BALINESE VOWEL SIGN PEPET TEDUNG..BALINESE ADEG ADEG
        , Range.point 'ᮂ' -- Mc       SUNDANESE SIGN PANGWISAD
        , Range.point 'ᮡ' -- Mc       SUNDANESE CONSONANT SIGN PAMINGKAL
        , Range.range 'ᮦ' 'ᮧ' -- Mc   [2] SUNDANESE VOWEL SIGN PANAELAENG..SUNDANESE VOWEL SIGN PANOLONG
        , Range.point '᮪' -- Mc       SUNDANESE SIGN PAMAAEH
        , Range.point 'ᯧ' -- Mc       BATAK VOWEL SIGN E
        , Range.range 'ᯪ' 'ᯬ' -- Mc   [3] BATAK VOWEL SIGN I..BATAK VOWEL SIGN O
        , Range.point 'ᯮ' -- Mc       BATAK VOWEL SIGN U
        , Range.range '᯲' '᯳' -- Mc   [2] BATAK PANGOLAT..BATAK PANONGONAN
        , Range.range 'ᰤ' 'ᰫ' -- Mc   [8] LEPCHA SUBJOINED LETTER YA..LEPCHA VOWEL SIGN UU
        , Range.range 'ᰴ' 'ᰵ' -- Mc   [2] LEPCHA CONSONANT SIGN NYIN-DO..LEPCHA CONSONANT SIGN KANG
        , Range.point '᳡' -- Mc       VEDIC TONE ATHARVAVEDIC INDEPENDENT SVARITA
        , Range.point '\u{1CF7}' -- Mc       VEDIC SIGN ATIKRAMA
        , Range.range 'ꠣ' 'ꠤ' -- Mc   [2] SYLOTI NAGRI VOWEL SIGN A..SYLOTI NAGRI VOWEL SIGN I
        , Range.point 'ꠧ' -- Mc       SYLOTI NAGRI VOWEL SIGN OO
        , Range.range 'ꢀ' 'ꢁ' -- Mc   [2] SAURASHTRA SIGN ANUSVARA..SAURASHTRA SIGN VISARGA
        , Range.range 'ꢴ' 'ꣃ' -- Mc  [16] SAURASHTRA CONSONANT SIGN HAARU..SAURASHTRA VOWEL SIGN AU
        , Range.range 'ꥒ' '꥓' -- Mc   [2] REJANG CONSONANT SIGN H..REJANG VIRAMA
        , Range.point 'ꦃ' -- Mc       JAVANESE SIGN WIGNYAN
        , Range.range 'ꦴ' 'ꦵ' -- Mc   [2] JAVANESE VOWEL SIGN TARUNG..JAVANESE VOWEL SIGN TOLONG
        , Range.range 'ꦺ' 'ꦻ' -- Mc   [2] JAVANESE VOWEL SIGN TALING..JAVANESE VOWEL SIGN DIRGA MURE
        , Range.range 'ꦾ' '꧀' -- Mc   [3] JAVANESE CONSONANT SIGN PENGKAL..JAVANESE PANGKON
        , Range.range 'ꨯ' 'ꨰ' -- Mc   [2] CHAM VOWEL SIGN O..CHAM VOWEL SIGN AI
        , Range.range 'ꨳ' 'ꨴ' -- Mc   [2] CHAM CONSONANT SIGN YA..CHAM CONSONANT SIGN RA
        , Range.point 'ꩍ' -- Mc       CHAM CONSONANT SIGN FINAL H
        , Range.point 'ꫫ' -- Mc       MEETEI MAYEK VOWEL SIGN II
        , Range.range 'ꫮ' 'ꫯ' -- Mc   [2] MEETEI MAYEK VOWEL SIGN AU..MEETEI MAYEK VOWEL SIGN AAU
        , Range.point 'ꫵ' -- Mc       MEETEI MAYEK VOWEL SIGN VISARGA
        , Range.range 'ꯣ' 'ꯤ' -- Mc   [2] MEETEI MAYEK VOWEL SIGN ONAP..MEETEI MAYEK VOWEL SIGN INAP
        , Range.range 'ꯦ' 'ꯧ' -- Mc   [2] MEETEI MAYEK VOWEL SIGN YENAP..MEETEI MAYEK VOWEL SIGN SOUNAP
        , Range.range 'ꯩ' 'ꯪ' -- Mc   [2] MEETEI MAYEK VOWEL SIGN CHEINAP..MEETEI MAYEK VOWEL SIGN NUNG
        , Range.point '꯬' -- Mc       MEETEI MAYEK LUM IYEK
        , Range.point '𑀀' -- Mc       BRAHMI SIGN CANDRABINDU
        , Range.point '𑀂' -- Mc       BRAHMI SIGN VISARGA
        , Range.point '𑂂' -- Mc       KAITHI SIGN VISARGA
        , Range.range '𑂰' '𑂲' -- Mc   [3] KAITHI VOWEL SIGN AA..KAITHI VOWEL SIGN II
        , Range.range '𑂷' '𑂸' -- Mc   [2] KAITHI VOWEL SIGN O..KAITHI VOWEL SIGN AU
        , Range.point '𑄬' -- Mc       CHAKMA VOWEL SIGN E
        , Range.range '\u{11145}' '\u{11146}' -- Mc   [2] CHAKMA VOWEL SIGN AA..CHAKMA VOWEL SIGN EI
        , Range.point '𑆂' -- Mc       SHARADA SIGN VISARGA
        , Range.range '𑆳' '𑆵' -- Mc   [3] SHARADA VOWEL SIGN AA..SHARADA VOWEL SIGN II
        , Range.range '𑆿' '𑇀' -- Mc   [2] SHARADA VOWEL SIGN AU..SHARADA SIGN VIRAMA
        , Range.range '𑈬' '𑈮' -- Mc   [3] KHOJKI VOWEL SIGN AA..KHOJKI VOWEL SIGN II
        , Range.range '𑈲' '𑈳' -- Mc   [2] KHOJKI VOWEL SIGN O..KHOJKI VOWEL SIGN AU
        , Range.point '𑈵' -- Mc       KHOJKI SIGN VIRAMA
        , Range.range '𑋠' '𑋢' -- Mc   [3] KHUDAWADI VOWEL SIGN AA..KHUDAWADI VOWEL SIGN II
        , Range.range '𑌂' '𑌃' -- Mc   [2] GRANTHA SIGN ANUSVARA..GRANTHA SIGN VISARGA
        , Range.point '𑌿' -- Mc       GRANTHA VOWEL SIGN I
        , Range.range '𑍁' '𑍄' -- Mc   [4] GRANTHA VOWEL SIGN U..GRANTHA VOWEL SIGN VOCALIC RR
        , Range.range '𑍇' '𑍈' -- Mc   [2] GRANTHA VOWEL SIGN EE..GRANTHA VOWEL SIGN AI
        , Range.range '𑍋' '𑍍' -- Mc   [3] GRANTHA VOWEL SIGN OO..GRANTHA SIGN VIRAMA
        , Range.range '𑍢' '𑍣' -- Mc   [2] GRANTHA VOWEL SIGN VOCALIC L..GRANTHA VOWEL SIGN VOCALIC LL
        , Range.range '\u{11435}' '\u{11437}' -- Mc   [3] NEWA VOWEL SIGN AA..NEWA VOWEL SIGN II
        , Range.range '\u{11440}' '\u{11441}' -- Mc   [2] NEWA VOWEL SIGN O..NEWA VOWEL SIGN AU
        , Range.point '\u{11445}' -- Mc       NEWA SIGN VISARGA
        , Range.range '𑒱' '𑒲' -- Mc   [2] TIRHUTA VOWEL SIGN I..TIRHUTA VOWEL SIGN II
        , Range.point '𑒹' -- Mc       TIRHUTA VOWEL SIGN E
        , Range.range '𑒻' '𑒼' -- Mc   [2] TIRHUTA VOWEL SIGN AI..TIRHUTA VOWEL SIGN O
        , Range.point '𑒾' -- Mc       TIRHUTA VOWEL SIGN AU
        , Range.point '𑓁' -- Mc       TIRHUTA SIGN VISARGA
        , Range.range '𑖰' '𑖱' -- Mc   [2] SIDDHAM VOWEL SIGN I..SIDDHAM VOWEL SIGN II
        , Range.range '𑖸' '𑖻' -- Mc   [4] SIDDHAM VOWEL SIGN E..SIDDHAM VOWEL SIGN AU
        , Range.point '𑖾' -- Mc       SIDDHAM SIGN VISARGA
        , Range.range '𑘰' '𑘲' -- Mc   [3] MODI VOWEL SIGN AA..MODI VOWEL SIGN II
        , Range.range '𑘻' '𑘼' -- Mc   [2] MODI VOWEL SIGN O..MODI VOWEL SIGN AU
        , Range.point '𑘾' -- Mc       MODI SIGN VISARGA
        , Range.point '𑚬' -- Mc       TAKRI SIGN VISARGA
        , Range.range '𑚮' '𑚯' -- Mc   [2] TAKRI VOWEL SIGN I..TAKRI VOWEL SIGN II
        , Range.point '𑚶' -- Mc       TAKRI SIGN VIRAMA
        , Range.range '\u{11720}' '\u{11721}' -- Mc   [2] AHOM VOWEL SIGN A..AHOM VOWEL SIGN AA
        , Range.point '\u{11726}' -- Mc       AHOM VOWEL SIGN E
        , Range.range '\u{1182C}' '\u{1182E}' -- Mc   [3] DOGRA VOWEL SIGN AA..DOGRA VOWEL SIGN II
        , Range.point '\u{11838}' -- Mc       DOGRA SIGN VISARGA
        , Range.range '\u{119D1}' '\u{119D3}' -- Mc   [3] NANDINAGARI VOWEL SIGN AA..NANDINAGARI VOWEL SIGN II
        , Range.range '\u{119DC}' '\u{119DF}' -- Mc   [4] NANDINAGARI VOWEL SIGN O..NANDINAGARI SIGN VISARGA
        , Range.point '\u{119E4}' -- Mc       NANDINAGARI VOWEL SIGN PRISHTHAMATRA E
        , Range.point '\u{11A39}' -- Mc       ZANABAZAR SQUARE SIGN VISARGA
        , Range.range '\u{11A57}' '\u{11A58}' -- Mc   [2] SOYOMBO VOWEL SIGN AI..SOYOMBO VOWEL SIGN AU
        , Range.point '\u{11A97}' -- Mc       SOYOMBO SIGN VISARGA
        , Range.point '\u{11C2F}' -- Mc       BHAIKSUKI VOWEL SIGN AA
        , Range.point '\u{11C3E}' -- Mc       BHAIKSUKI SIGN VISARGA
        , Range.point '\u{11CA9}' -- Mc       MARCHEN SUBJOINED LETTER YA
        , Range.point '\u{11CB1}' -- Mc       MARCHEN VOWEL SIGN I
        , Range.point '\u{11CB4}' -- Mc       MARCHEN VOWEL SIGN O
        , Range.range '\u{11D8A}' '\u{11D8E}' -- Mc   [5] GUNJALA GONDI VOWEL SIGN AA..GUNJALA GONDI VOWEL SIGN UU
        , Range.range '\u{11D93}' '\u{11D94}' -- Mc   [2] GUNJALA GONDI VOWEL SIGN OO..GUNJALA GONDI VOWEL SIGN AU
        , Range.point '\u{11D96}' -- Mc       GUNJALA GONDI SIGN VISARGA
        , Range.range '\u{11EF5}' '\u{11EF6}' -- Mc   [2] MAKASAR VOWEL SIGN E..MAKASAR VOWEL SIGN O
        , Range.range '𖽑' '\u{16F87}' -- Mc  [55] MIAO SIGN ASPIRATION..MIAO VOWEL SIGN UI
        , Range.point '𝅦' -- Mc       MUSICAL SYMBOL COMBINING SPRECHGESANG STEM
        , Range.point '𝅭' -- Mc       MUSICAL SYMBOL COMBINING AUGMENTATION DOT
        ]
