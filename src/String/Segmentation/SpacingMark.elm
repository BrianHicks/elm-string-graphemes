module String.Segmentation.SpacingMark exposing (chars, parser)

import Parser exposing (Parser)
import Set exposing (Set)


parser : Parser ()
parser =
    Parser.chompIf (\c -> Set.member c chars)


chars : Set Char
chars =
    (Set.fromList << List.concat)
        [ [ 'ः' ] -- Mc       DEVANAGARI SIGN VISARGA
        , [ 'ऻ' ] -- Mc       DEVANAGARI VOWEL SIGN OOE
        , List.map Char.fromCode (List.range 0x093E 0x0940) -- Mc   [3] DEVANAGARI VOWEL SIGN AA..DEVANAGARI VOWEL SIGN II
        , List.map Char.fromCode (List.range 0x0949 0x094C) -- Mc   [4] DEVANAGARI VOWEL SIGN CANDRA O..DEVANAGARI VOWEL SIGN AU
        , List.map Char.fromCode (List.range 0x094E 0x094F) -- Mc   [2] DEVANAGARI VOWEL SIGN PRISHTHAMATRA E..DEVANAGARI VOWEL SIGN AW
        , List.map Char.fromCode (List.range 0x0982 0x0983) -- Mc   [2] BENGALI SIGN ANUSVARA..BENGALI SIGN VISARGA
        , List.map Char.fromCode (List.range 0x09BF 0x09C0) -- Mc   [2] BENGALI VOWEL SIGN I..BENGALI VOWEL SIGN II
        , List.map Char.fromCode (List.range 0x09C7 0x09C8) -- Mc   [2] BENGALI VOWEL SIGN E..BENGALI VOWEL SIGN AI
        , List.map Char.fromCode (List.range 0x09CB 0x09CC) -- Mc   [2] BENGALI VOWEL SIGN O..BENGALI VOWEL SIGN AU
        , [ 'ਃ' ] -- Mc       GURMUKHI SIGN VISARGA
        , List.map Char.fromCode (List.range 0x0A3E 0x0A40) -- Mc   [3] GURMUKHI VOWEL SIGN AA..GURMUKHI VOWEL SIGN II
        , [ 'ઃ' ] -- Mc       GUJARATI SIGN VISARGA
        , List.map Char.fromCode (List.range 0x0ABE 0x0AC0) -- Mc   [3] GUJARATI VOWEL SIGN AA..GUJARATI VOWEL SIGN II
        , [ 'ૉ' ] -- Mc       GUJARATI VOWEL SIGN CANDRA O
        , List.map Char.fromCode (List.range 0x0ACB 0x0ACC) -- Mc   [2] GUJARATI VOWEL SIGN O..GUJARATI VOWEL SIGN AU
        , List.map Char.fromCode (List.range 0x0B02 0x0B03) -- Mc   [2] ORIYA SIGN ANUSVARA..ORIYA SIGN VISARGA
        , [ 'ୀ' ] -- Mc       ORIYA VOWEL SIGN II
        , List.map Char.fromCode (List.range 0x0B47 0x0B48) -- Mc   [2] ORIYA VOWEL SIGN E..ORIYA VOWEL SIGN AI
        , List.map Char.fromCode (List.range 0x0B4B 0x0B4C) -- Mc   [2] ORIYA VOWEL SIGN O..ORIYA VOWEL SIGN AU
        , [ 'ி' ] -- Mc       TAMIL VOWEL SIGN I
        , List.map Char.fromCode (List.range 0x0BC1 0x0BC2) -- Mc   [2] TAMIL VOWEL SIGN U..TAMIL VOWEL SIGN UU
        , List.map Char.fromCode (List.range 0x0BC6 0x0BC8) -- Mc   [3] TAMIL VOWEL SIGN E..TAMIL VOWEL SIGN AI
        , List.map Char.fromCode (List.range 0x0BCA 0x0BCC) -- Mc   [3] TAMIL VOWEL SIGN O..TAMIL VOWEL SIGN AU
        , List.map Char.fromCode (List.range 0x0C01 0x0C03) -- Mc   [3] TELUGU SIGN CANDRABINDU..TELUGU SIGN VISARGA
        , List.map Char.fromCode (List.range 0x0C41 0x0C44) -- Mc   [4] TELUGU VOWEL SIGN U..TELUGU VOWEL SIGN VOCALIC RR
        , List.map Char.fromCode (List.range 0x0C82 0x0C83) -- Mc   [2] KANNADA SIGN ANUSVARA..KANNADA SIGN VISARGA
        , [ 'ಾ' ] -- Mc       KANNADA VOWEL SIGN AA
        , List.map Char.fromCode (List.range 0x0CC0 0x0CC1) -- Mc   [2] KANNADA VOWEL SIGN II..KANNADA VOWEL SIGN U
        , List.map Char.fromCode (List.range 0x0CC3 0x0CC4) -- Mc   [2] KANNADA VOWEL SIGN VOCALIC R..KANNADA VOWEL SIGN VOCALIC RR
        , List.map Char.fromCode (List.range 0x0CC7 0x0CC8) -- Mc   [2] KANNADA VOWEL SIGN EE..KANNADA VOWEL SIGN AI
        , List.map Char.fromCode (List.range 0x0CCA 0x0CCB) -- Mc   [2] KANNADA VOWEL SIGN O..KANNADA VOWEL SIGN OO
        , List.map Char.fromCode (List.range 0x0D02 0x0D03) -- Mc   [2] MALAYALAM SIGN ANUSVARA..MALAYALAM SIGN VISARGA
        , List.map Char.fromCode (List.range 0x0D3F 0x0D40) -- Mc   [2] MALAYALAM VOWEL SIGN I..MALAYALAM VOWEL SIGN II
        , List.map Char.fromCode (List.range 0x0D46 0x0D48) -- Mc   [3] MALAYALAM VOWEL SIGN E..MALAYALAM VOWEL SIGN AI
        , List.map Char.fromCode (List.range 0x0D4A 0x0D4C) -- Mc   [3] MALAYALAM VOWEL SIGN O..MALAYALAM VOWEL SIGN AU
        , List.map Char.fromCode (List.range 0x0D82 0x0D83) -- Mc   [2] SINHALA SIGN ANUSVARAYA..SINHALA SIGN VISARGAYA
        , List.map Char.fromCode (List.range 0x0DD0 0x0DD1) -- Mc   [2] SINHALA VOWEL SIGN KETTI AEDA-PILLA..SINHALA VOWEL SIGN DIGA AEDA-PILLA
        , List.map Char.fromCode (List.range 0x0DD8 0x0DDE) -- Mc   [7] SINHALA VOWEL SIGN GAETTA-PILLA..SINHALA VOWEL SIGN KOMBUVA HAA GAYANUKITTA
        , List.map Char.fromCode (List.range 0x0DF2 0x0DF3) -- Mc   [2] SINHALA VOWEL SIGN DIGA GAETTA-PILLA..SINHALA VOWEL SIGN DIGA GAYANUKITTA
        , [ 'ำ' ] -- Lo       THAI CHARACTER SARA AM
        , [ 'ຳ' ] -- Lo       LAO VOWEL SIGN AM
        , List.map Char.fromCode (List.range 0x0F3E 0x0F3F) -- Mc   [2] TIBETAN SIGN YAR TSHES..TIBETAN SIGN MAR TSHES
        , [ 'ཿ' ] -- Mc       TIBETAN SIGN RNAM BCAD
        , [ 'ေ' ] -- Mc       MYANMAR VOWEL SIGN E
        , List.map Char.fromCode (List.range 0x103B 0x103C) -- Mc   [2] MYANMAR CONSONANT SIGN MEDIAL YA..MYANMAR CONSONANT SIGN MEDIAL RA
        , List.map Char.fromCode (List.range 0x1056 0x1057) -- Mc   [2] MYANMAR VOWEL SIGN VOCALIC R..MYANMAR VOWEL SIGN VOCALIC RR
        , [ 'ႄ' ] -- Mc       MYANMAR VOWEL SIGN SHAN E
        , [ 'ា' ] -- Mc       KHMER VOWEL SIGN AA
        , List.map Char.fromCode (List.range 0x17BE 0x17C5) -- Mc   [8] KHMER VOWEL SIGN OE..KHMER VOWEL SIGN AU
        , List.map Char.fromCode (List.range 0x17C7 0x17C8) -- Mc   [2] KHMER SIGN REAHMUK..KHMER SIGN YUUKALEAPINTU
        , List.map Char.fromCode (List.range 0x1923 0x1926) -- Mc   [4] LIMBU VOWEL SIGN EE..LIMBU VOWEL SIGN AU
        , List.map Char.fromCode (List.range 0x1929 0x192B) -- Mc   [3] LIMBU SUBJOINED LETTER YA..LIMBU SUBJOINED LETTER WA
        , List.map Char.fromCode (List.range 0x1930 0x1931) -- Mc   [2] LIMBU SMALL LETTER KA..LIMBU SMALL LETTER NGA
        , List.map Char.fromCode (List.range 0x1933 0x1938) -- Mc   [6] LIMBU SMALL LETTER TA..LIMBU SMALL LETTER LA
        , List.map Char.fromCode (List.range 0x1A19 0x1A1A) -- Mc   [2] BUGINESE VOWEL SIGN E..BUGINESE VOWEL SIGN O
        , [ 'ᩕ' ] -- Mc       TAI THAM CONSONANT SIGN MEDIAL RA
        , [ 'ᩗ' ] -- Mc       TAI THAM CONSONANT SIGN LA TANG LAI
        , List.map Char.fromCode (List.range 0x1A6D 0x1A72) -- Mc   [6] TAI THAM VOWEL SIGN OY..TAI THAM VOWEL SIGN THAM AI
        , [ 'ᬄ' ] -- Mc       BALINESE SIGN BISAH
        , [ 'ᬻ' ] -- Mc       BALINESE VOWEL SIGN RA REPA TEDUNG
        , List.map Char.fromCode (List.range 0x1B3D 0x1B41) -- Mc   [5] BALINESE VOWEL SIGN LA LENGA TEDUNG..BALINESE VOWEL SIGN TALING REPA TEDUNG
        , List.map Char.fromCode (List.range 0x1B43 0x1B44) -- Mc   [2] BALINESE VOWEL SIGN PEPET TEDUNG..BALINESE ADEG ADEG
        , [ 'ᮂ' ] -- Mc       SUNDANESE SIGN PANGWISAD
        , [ 'ᮡ' ] -- Mc       SUNDANESE CONSONANT SIGN PAMINGKAL
        , List.map Char.fromCode (List.range 0x1BA6 0x1BA7) -- Mc   [2] SUNDANESE VOWEL SIGN PANAELAENG..SUNDANESE VOWEL SIGN PANOLONG
        , [ '᮪' ] -- Mc       SUNDANESE SIGN PAMAAEH
        , [ 'ᯧ' ] -- Mc       BATAK VOWEL SIGN E
        , List.map Char.fromCode (List.range 0x1BEA 0x1BEC) -- Mc   [3] BATAK VOWEL SIGN I..BATAK VOWEL SIGN O
        , [ 'ᯮ' ] -- Mc       BATAK VOWEL SIGN U
        , List.map Char.fromCode (List.range 0x1BF2 0x1BF3) -- Mc   [2] BATAK PANGOLAT..BATAK PANONGONAN
        , List.map Char.fromCode (List.range 0x1C24 0x1C2B) -- Mc   [8] LEPCHA SUBJOINED LETTER YA..LEPCHA VOWEL SIGN UU
        , List.map Char.fromCode (List.range 0x1C34 0x1C35) -- Mc   [2] LEPCHA CONSONANT SIGN NYIN-DO..LEPCHA CONSONANT SIGN KANG
        , [ '᳡' ] -- Mc       VEDIC TONE ATHARVAVEDIC INDEPENDENT SVARITA
        , [ '\u{1CF7}' ] -- Mc       VEDIC SIGN ATIKRAMA
        , List.map Char.fromCode (List.range 0xA823 0xA824) -- Mc   [2] SYLOTI NAGRI VOWEL SIGN A..SYLOTI NAGRI VOWEL SIGN I
        , [ 'ꠧ' ] -- Mc       SYLOTI NAGRI VOWEL SIGN OO
        , List.map Char.fromCode (List.range 0xA880 0xA881) -- Mc   [2] SAURASHTRA SIGN ANUSVARA..SAURASHTRA SIGN VISARGA
        , List.map Char.fromCode (List.range 0xA8B4 0xA8C3) -- Mc  [16] SAURASHTRA CONSONANT SIGN HAARU..SAURASHTRA VOWEL SIGN AU
        , List.map Char.fromCode (List.range 0xA952 0xA953) -- Mc   [2] REJANG CONSONANT SIGN H..REJANG VIRAMA
        , [ 'ꦃ' ] -- Mc       JAVANESE SIGN WIGNYAN
        , List.map Char.fromCode (List.range 0xA9B4 0xA9B5) -- Mc   [2] JAVANESE VOWEL SIGN TARUNG..JAVANESE VOWEL SIGN TOLONG
        , List.map Char.fromCode (List.range 0xA9BA 0xA9BB) -- Mc   [2] JAVANESE VOWEL SIGN TALING..JAVANESE VOWEL SIGN DIRGA MURE
        , List.map Char.fromCode (List.range 0xA9BE 0xA9C0) -- Mc   [3] JAVANESE CONSONANT SIGN PENGKAL..JAVANESE PANGKON
        , List.map Char.fromCode (List.range 0xAA2F 0xAA30) -- Mc   [2] CHAM VOWEL SIGN O..CHAM VOWEL SIGN AI
        , List.map Char.fromCode (List.range 0xAA33 0xAA34) -- Mc   [2] CHAM CONSONANT SIGN YA..CHAM CONSONANT SIGN RA
        , [ 'ꩍ' ] -- Mc       CHAM CONSONANT SIGN FINAL H
        , [ 'ꫫ' ] -- Mc       MEETEI MAYEK VOWEL SIGN II
        , List.map Char.fromCode (List.range 0xAAEE 0xAAEF) -- Mc   [2] MEETEI MAYEK VOWEL SIGN AU..MEETEI MAYEK VOWEL SIGN AAU
        , [ 'ꫵ' ] -- Mc       MEETEI MAYEK VOWEL SIGN VISARGA
        , List.map Char.fromCode (List.range 0xABE3 0xABE4) -- Mc   [2] MEETEI MAYEK VOWEL SIGN ONAP..MEETEI MAYEK VOWEL SIGN INAP
        , List.map Char.fromCode (List.range 0xABE6 0xABE7) -- Mc   [2] MEETEI MAYEK VOWEL SIGN YENAP..MEETEI MAYEK VOWEL SIGN SOUNAP
        , List.map Char.fromCode (List.range 0xABE9 0xABEA) -- Mc   [2] MEETEI MAYEK VOWEL SIGN CHEINAP..MEETEI MAYEK VOWEL SIGN NUNG
        , [ '꯬' ] -- Mc       MEETEI MAYEK LUM IYEK
        , [ '𑀀' ] -- Mc       BRAHMI SIGN CANDRABINDU
        , [ '𑀂' ] -- Mc       BRAHMI SIGN VISARGA
        , [ '𑂂' ] -- Mc       KAITHI SIGN VISARGA
        , List.map Char.fromCode (List.range 0x000110B0 0x000110B2) -- Mc   [3] KAITHI VOWEL SIGN AA..KAITHI VOWEL SIGN II
        , List.map Char.fromCode (List.range 0x000110B7 0x000110B8) -- Mc   [2] KAITHI VOWEL SIGN O..KAITHI VOWEL SIGN AU
        , [ '𑄬' ] -- Mc       CHAKMA VOWEL SIGN E
        , List.map Char.fromCode (List.range 0x00011145 0x00011146) -- Mc   [2] CHAKMA VOWEL SIGN AA..CHAKMA VOWEL SIGN EI
        , [ '𑆂' ] -- Mc       SHARADA SIGN VISARGA
        , List.map Char.fromCode (List.range 0x000111B3 0x000111B5) -- Mc   [3] SHARADA VOWEL SIGN AA..SHARADA VOWEL SIGN II
        , List.map Char.fromCode (List.range 0x000111BF 0x000111C0) -- Mc   [2] SHARADA VOWEL SIGN AU..SHARADA SIGN VIRAMA
        , List.map Char.fromCode (List.range 0x0001122C 0x0001122E) -- Mc   [3] KHOJKI VOWEL SIGN AA..KHOJKI VOWEL SIGN II
        , List.map Char.fromCode (List.range 0x00011232 0x00011233) -- Mc   [2] KHOJKI VOWEL SIGN O..KHOJKI VOWEL SIGN AU
        , [ '𑈵' ] -- Mc       KHOJKI SIGN VIRAMA
        , List.map Char.fromCode (List.range 0x000112E0 0x000112E2) -- Mc   [3] KHUDAWADI VOWEL SIGN AA..KHUDAWADI VOWEL SIGN II
        , List.map Char.fromCode (List.range 0x00011302 0x00011303) -- Mc   [2] GRANTHA SIGN ANUSVARA..GRANTHA SIGN VISARGA
        , [ '𑌿' ] -- Mc       GRANTHA VOWEL SIGN I
        , List.map Char.fromCode (List.range 0x00011341 0x00011344) -- Mc   [4] GRANTHA VOWEL SIGN U..GRANTHA VOWEL SIGN VOCALIC RR
        , List.map Char.fromCode (List.range 0x00011347 0x00011348) -- Mc   [2] GRANTHA VOWEL SIGN EE..GRANTHA VOWEL SIGN AI
        , List.map Char.fromCode (List.range 0x0001134B 0x0001134D) -- Mc   [3] GRANTHA VOWEL SIGN OO..GRANTHA SIGN VIRAMA
        , List.map Char.fromCode (List.range 0x00011362 0x00011363) -- Mc   [2] GRANTHA VOWEL SIGN VOCALIC L..GRANTHA VOWEL SIGN VOCALIC LL
        , List.map Char.fromCode (List.range 0x00011435 0x00011437) -- Mc   [3] NEWA VOWEL SIGN AA..NEWA VOWEL SIGN II
        , List.map Char.fromCode (List.range 0x00011440 0x00011441) -- Mc   [2] NEWA VOWEL SIGN O..NEWA VOWEL SIGN AU
        , [ '\u{11445}' ] -- Mc       NEWA SIGN VISARGA
        , List.map Char.fromCode (List.range 0x000114B1 0x000114B2) -- Mc   [2] TIRHUTA VOWEL SIGN I..TIRHUTA VOWEL SIGN II
        , [ '𑒹' ] -- Mc       TIRHUTA VOWEL SIGN E
        , List.map Char.fromCode (List.range 0x000114BB 0x000114BC) -- Mc   [2] TIRHUTA VOWEL SIGN AI..TIRHUTA VOWEL SIGN O
        , [ '𑒾' ] -- Mc       TIRHUTA VOWEL SIGN AU
        , [ '𑓁' ] -- Mc       TIRHUTA SIGN VISARGA
        , List.map Char.fromCode (List.range 0x000115B0 0x000115B1) -- Mc   [2] SIDDHAM VOWEL SIGN I..SIDDHAM VOWEL SIGN II
        , List.map Char.fromCode (List.range 0x000115B8 0x000115BB) -- Mc   [4] SIDDHAM VOWEL SIGN E..SIDDHAM VOWEL SIGN AU
        , [ '𑖾' ] -- Mc       SIDDHAM SIGN VISARGA
        , List.map Char.fromCode (List.range 0x00011630 0x00011632) -- Mc   [3] MODI VOWEL SIGN AA..MODI VOWEL SIGN II
        , List.map Char.fromCode (List.range 0x0001163B 0x0001163C) -- Mc   [2] MODI VOWEL SIGN O..MODI VOWEL SIGN AU
        , [ '𑘾' ] -- Mc       MODI SIGN VISARGA
        , [ '𑚬' ] -- Mc       TAKRI SIGN VISARGA
        , List.map Char.fromCode (List.range 0x000116AE 0x000116AF) -- Mc   [2] TAKRI VOWEL SIGN I..TAKRI VOWEL SIGN II
        , [ '𑚶' ] -- Mc       TAKRI SIGN VIRAMA
        , List.map Char.fromCode (List.range 0x00011720 0x00011721) -- Mc   [2] AHOM VOWEL SIGN A..AHOM VOWEL SIGN AA
        , [ '\u{11726}' ] -- Mc       AHOM VOWEL SIGN E
        , List.map Char.fromCode (List.range 0x0001182C 0x0001182E) -- Mc   [3] DOGRA VOWEL SIGN AA..DOGRA VOWEL SIGN II
        , [ '\u{11838}' ] -- Mc       DOGRA SIGN VISARGA
        , List.map Char.fromCode (List.range 0x000119D1 0x000119D3) -- Mc   [3] NANDINAGARI VOWEL SIGN AA..NANDINAGARI VOWEL SIGN II
        , List.map Char.fromCode (List.range 0x000119DC 0x000119DF) -- Mc   [4] NANDINAGARI VOWEL SIGN O..NANDINAGARI SIGN VISARGA
        , [ '\u{119E4}' ] -- Mc       NANDINAGARI VOWEL SIGN PRISHTHAMATRA E
        , [ '\u{11A39}' ] -- Mc       ZANABAZAR SQUARE SIGN VISARGA
        , List.map Char.fromCode (List.range 0x00011A57 0x00011A58) -- Mc   [2] SOYOMBO VOWEL SIGN AI..SOYOMBO VOWEL SIGN AU
        , [ '\u{11A97}' ] -- Mc       SOYOMBO SIGN VISARGA
        , [ '\u{11C2F}' ] -- Mc       BHAIKSUKI VOWEL SIGN AA
        , [ '\u{11C3E}' ] -- Mc       BHAIKSUKI SIGN VISARGA
        , [ '\u{11CA9}' ] -- Mc       MARCHEN SUBJOINED LETTER YA
        , [ '\u{11CB1}' ] -- Mc       MARCHEN VOWEL SIGN I
        , [ '\u{11CB4}' ] -- Mc       MARCHEN VOWEL SIGN O
        , List.map Char.fromCode (List.range 0x00011D8A 0x00011D8E) -- Mc   [5] GUNJALA GONDI VOWEL SIGN AA..GUNJALA GONDI VOWEL SIGN UU
        , List.map Char.fromCode (List.range 0x00011D93 0x00011D94) -- Mc   [2] GUNJALA GONDI VOWEL SIGN OO..GUNJALA GONDI VOWEL SIGN AU
        , [ '\u{11D96}' ] -- Mc       GUNJALA GONDI SIGN VISARGA
        , List.map Char.fromCode (List.range 0x00011EF5 0x00011EF6) -- Mc   [2] MAKASAR VOWEL SIGN E..MAKASAR VOWEL SIGN O
        , List.map Char.fromCode (List.range 0x00016F51 0x00016F87) -- Mc  [55] MIAO SIGN ASPIRATION..MIAO VOWEL SIGN UI
        , [ '𝅦' ] -- Mc       MUSICAL SYMBOL COMBINING SPRECHGESANG STEM
        , [ '𝅭' ] -- Mc       MUSICAL SYMBOL COMBINING AUGMENTATION DOT
        ]
