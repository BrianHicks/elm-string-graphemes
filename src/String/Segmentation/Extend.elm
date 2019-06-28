module String.Segmentation.Extend exposing (chars, parser)

import Parser exposing (Parser)
import Set exposing (Set)


parser : Parser ()
parser =
    Parser.chompIf (\c -> Set.member c chars)


chars : Set Char
chars =
    (Set.fromList << List.concat)
        [ List.map Char.fromCode (List.range 0x0300 0x036F) -- Mn [112] COMBINING GRAVE ACCENT..COMBINING LATIN SMALL LETTER X
        , List.map Char.fromCode (List.range 0x0483 0x0487) -- Mn   [5] COMBINING CYRILLIC TITLO..COMBINING CYRILLIC POKRYTIE
        , List.map Char.fromCode (List.range 0x0488 0x0489) -- Me   [2] COMBINING CYRILLIC HUNDRED THOUSANDS SIGN..COMBINING CYRILLIC MILLIONS SIGN
        , List.map Char.fromCode (List.range 0x0591 0x05BD) -- Mn  [45] HEBREW ACCENT ETNAHTA..HEBREW POINT METEG
        , [ 'ֿ' ] -- Mn       HEBREW POINT RAFE
        , List.map Char.fromCode (List.range 0x05C1 0x05C2) -- Mn   [2] HEBREW POINT SHIN DOT..HEBREW POINT SIN DOT
        , List.map Char.fromCode (List.range 0x05C4 0x05C5) -- Mn   [2] HEBREW MARK UPPER DOT..HEBREW MARK LOWER DOT
        , [ 'ׇ' ] -- Mn       HEBREW POINT QAMATS QATAN
        , List.map Char.fromCode (List.range 0x0610 0x061A) -- Mn  [11] ARABIC SIGN SALLALLAHOU ALAYHE WASSALLAM..ARABIC SMALL KASRA
        , List.map Char.fromCode (List.range 0x064B 0x065F) -- Mn  [21] ARABIC FATHATAN..ARABIC WAVY HAMZA BELOW
        , [ 'ٰ' ] -- Mn       ARABIC LETTER SUPERSCRIPT ALEF
        , List.map Char.fromCode (List.range 0x06D6 0x06DC) -- Mn   [7] ARABIC SMALL HIGH LIGATURE SAD WITH LAM WITH ALEF MAKSURA..ARABIC SMALL HIGH SEEN
        , List.map Char.fromCode (List.range 0x06DF 0x06E4) -- Mn   [6] ARABIC SMALL HIGH ROUNDED ZERO..ARABIC SMALL HIGH MADDA
        , List.map Char.fromCode (List.range 0x06E7 0x06E8) -- Mn   [2] ARABIC SMALL HIGH YEH..ARABIC SMALL HIGH NOON
        , List.map Char.fromCode (List.range 0x06EA 0x06ED) -- Mn   [4] ARABIC EMPTY CENTRE LOW STOP..ARABIC SMALL LOW MEEM
        , [ 'ܑ' ] -- Mn       SYRIAC LETTER SUPERSCRIPT ALAPH
        , List.map Char.fromCode (List.range 0x0730 0x074A) -- Mn  [27] SYRIAC PTHAHA ABOVE..SYRIAC BARREKH
        , List.map Char.fromCode (List.range 0x07A6 0x07B0) -- Mn  [11] THAANA ABAFILI..THAANA SUKUN
        , List.map Char.fromCode (List.range 0x07EB 0x07F3) -- Mn   [9] NKO COMBINING SHORT HIGH TONE..NKO COMBINING DOUBLE DOT ABOVE
        , [ '\u{07FD}' ] -- Mn       NKO DANTAYALAN
        , List.map Char.fromCode (List.range 0x0816 0x0819) -- Mn   [4] SAMARITAN MARK IN..SAMARITAN MARK DAGESH
        , List.map Char.fromCode (List.range 0x081B 0x0823) -- Mn   [9] SAMARITAN MARK EPENTHETIC YUT..SAMARITAN VOWEL SIGN A
        , List.map Char.fromCode (List.range 0x0825 0x0827) -- Mn   [3] SAMARITAN VOWEL SIGN SHORT A..SAMARITAN VOWEL SIGN U
        , List.map Char.fromCode (List.range 0x0829 0x082D) -- Mn   [5] SAMARITAN VOWEL SIGN LONG I..SAMARITAN MARK NEQUDAA
        , List.map Char.fromCode (List.range 0x0859 0x085B) -- Mn   [3] MANDAIC AFFRICATION MARK..MANDAIC GEMINATION MARK
        , List.map Char.fromCode (List.range 0x08D3 0x08E1) -- Mn  [15] ARABIC SMALL LOW WAW..ARABIC SMALL HIGH SIGN SAFHA
        , List.map Char.fromCode (List.range 0x08E3 0x0902) -- Mn  [32] ARABIC TURNED DAMMA BELOW..DEVANAGARI SIGN ANUSVARA
        , [ 'ऺ' ] -- Mn       DEVANAGARI VOWEL SIGN OE
        , [ '़' ] -- Mn       DEVANAGARI SIGN NUKTA
        , List.map Char.fromCode (List.range 0x0941 0x0948) -- Mn   [8] DEVANAGARI VOWEL SIGN U..DEVANAGARI VOWEL SIGN AI
        , [ '्' ] -- Mn       DEVANAGARI SIGN VIRAMA
        , List.map Char.fromCode (List.range 0x0951 0x0957) -- Mn   [7] DEVANAGARI STRESS SIGN UDATTA..DEVANAGARI VOWEL SIGN UUE
        , List.map Char.fromCode (List.range 0x0962 0x0963) -- Mn   [2] DEVANAGARI VOWEL SIGN VOCALIC L..DEVANAGARI VOWEL SIGN VOCALIC LL
        , [ 'ঁ' ] -- Mn       BENGALI SIGN CANDRABINDU
        , [ '়' ] -- Mn       BENGALI SIGN NUKTA
        , [ 'া' ] -- Mc       BENGALI VOWEL SIGN AA
        , List.map Char.fromCode (List.range 0x09C1 0x09C4) -- Mn   [4] BENGALI VOWEL SIGN U..BENGALI VOWEL SIGN VOCALIC RR
        , [ '্' ] -- Mn       BENGALI SIGN VIRAMA
        , [ 'ৗ' ] -- Mc       BENGALI AU LENGTH MARK
        , List.map Char.fromCode (List.range 0x09E2 0x09E3) -- Mn   [2] BENGALI VOWEL SIGN VOCALIC L..BENGALI VOWEL SIGN VOCALIC LL
        , [ '\u{09FE}' ] -- Mn       BENGALI SANDHI MARK
        , List.map Char.fromCode (List.range 0x0A01 0x0A02) -- Mn   [2] GURMUKHI SIGN ADAK BINDI..GURMUKHI SIGN BINDI
        , [ '਼' ] -- Mn       GURMUKHI SIGN NUKTA
        , List.map Char.fromCode (List.range 0x0A41 0x0A42) -- Mn   [2] GURMUKHI VOWEL SIGN U..GURMUKHI VOWEL SIGN UU
        , List.map Char.fromCode (List.range 0x0A47 0x0A48) -- Mn   [2] GURMUKHI VOWEL SIGN EE..GURMUKHI VOWEL SIGN AI
        , List.map Char.fromCode (List.range 0x0A4B 0x0A4D) -- Mn   [3] GURMUKHI VOWEL SIGN OO..GURMUKHI SIGN VIRAMA
        , [ 'ੑ' ] -- Mn       GURMUKHI SIGN UDAAT
        , List.map Char.fromCode (List.range 0x0A70 0x0A71) -- Mn   [2] GURMUKHI TIPPI..GURMUKHI ADDAK
        , [ 'ੵ' ] -- Mn       GURMUKHI SIGN YAKASH
        , List.map Char.fromCode (List.range 0x0A81 0x0A82) -- Mn   [2] GUJARATI SIGN CANDRABINDU..GUJARATI SIGN ANUSVARA
        , [ '઼' ] -- Mn       GUJARATI SIGN NUKTA
        , List.map Char.fromCode (List.range 0x0AC1 0x0AC5) -- Mn   [5] GUJARATI VOWEL SIGN U..GUJARATI VOWEL SIGN CANDRA E
        , List.map Char.fromCode (List.range 0x0AC7 0x0AC8) -- Mn   [2] GUJARATI VOWEL SIGN E..GUJARATI VOWEL SIGN AI
        , [ '્' ] -- Mn       GUJARATI SIGN VIRAMA
        , List.map Char.fromCode (List.range 0x0AE2 0x0AE3) -- Mn   [2] GUJARATI VOWEL SIGN VOCALIC L..GUJARATI VOWEL SIGN VOCALIC LL
        , List.map Char.fromCode (List.range 0x0AFA 0x0AFF) -- Mn   [6] GUJARATI SIGN SUKUN..GUJARATI SIGN TWO-CIRCLE NUKTA ABOVE
        , [ 'ଁ' ] -- Mn       ORIYA SIGN CANDRABINDU
        , [ '଼' ] -- Mn       ORIYA SIGN NUKTA
        , [ 'ା' ] -- Mc       ORIYA VOWEL SIGN AA
        , [ 'ି' ] -- Mn       ORIYA VOWEL SIGN I
        , List.map Char.fromCode (List.range 0x0B41 0x0B44) -- Mn   [4] ORIYA VOWEL SIGN U..ORIYA VOWEL SIGN VOCALIC RR
        , [ '୍' ] -- Mn       ORIYA SIGN VIRAMA
        , [ 'ୖ' ] -- Mn       ORIYA AI LENGTH MARK
        , [ 'ୗ' ] -- Mc       ORIYA AU LENGTH MARK
        , List.map Char.fromCode (List.range 0x0B62 0x0B63) -- Mn   [2] ORIYA VOWEL SIGN VOCALIC L..ORIYA VOWEL SIGN VOCALIC LL
        , [ 'ஂ' ] -- Mn       TAMIL SIGN ANUSVARA
        , [ 'ா' ] -- Mc       TAMIL VOWEL SIGN AA
        , [ 'ீ' ] -- Mn       TAMIL VOWEL SIGN II
        , [ '்' ] -- Mn       TAMIL SIGN VIRAMA
        , [ 'ௗ' ] -- Mc       TAMIL AU LENGTH MARK
        , [ 'ఀ' ] -- Mn       TELUGU SIGN COMBINING CANDRABINDU ABOVE
        , [ '\u{0C04}' ] -- Mn       TELUGU SIGN COMBINING ANUSVARA ABOVE
        , List.map Char.fromCode (List.range 0x0C3E 0x0C40) -- Mn   [3] TELUGU VOWEL SIGN AA..TELUGU VOWEL SIGN II
        , List.map Char.fromCode (List.range 0x0C46 0x0C48) -- Mn   [3] TELUGU VOWEL SIGN E..TELUGU VOWEL SIGN AI
        , List.map Char.fromCode (List.range 0x0C4A 0x0C4D) -- Mn   [4] TELUGU VOWEL SIGN O..TELUGU SIGN VIRAMA
        , List.map Char.fromCode (List.range 0x0C55 0x0C56) -- Mn   [2] TELUGU LENGTH MARK..TELUGU AI LENGTH MARK
        , List.map Char.fromCode (List.range 0x0C62 0x0C63) -- Mn   [2] TELUGU VOWEL SIGN VOCALIC L..TELUGU VOWEL SIGN VOCALIC LL
        , [ 'ಁ' ] -- Mn       KANNADA SIGN CANDRABINDU
        , [ '಼' ] -- Mn       KANNADA SIGN NUKTA
        , [ 'ಿ' ] -- Mn       KANNADA VOWEL SIGN I
        , [ 'ೂ' ] -- Mc       KANNADA VOWEL SIGN UU
        , [ 'ೆ' ] -- Mn       KANNADA VOWEL SIGN E
        , List.map Char.fromCode (List.range 0x0CCC 0x0CCD) -- Mn   [2] KANNADA VOWEL SIGN AU..KANNADA SIGN VIRAMA
        , List.map Char.fromCode (List.range 0x0CD5 0x0CD6) -- Mc   [2] KANNADA LENGTH MARK..KANNADA AI LENGTH MARK
        , List.map Char.fromCode (List.range 0x0CE2 0x0CE3) -- Mn   [2] KANNADA VOWEL SIGN VOCALIC L..KANNADA VOWEL SIGN VOCALIC LL
        , List.map Char.fromCode (List.range 0x0D00 0x0D01) -- Mn   [2] MALAYALAM SIGN COMBINING ANUSVARA ABOVE..MALAYALAM SIGN CANDRABINDU
        , List.map Char.fromCode (List.range 0x0D3B 0x0D3C) -- Mn   [2] MALAYALAM SIGN VERTICAL BAR VIRAMA..MALAYALAM SIGN CIRCULAR VIRAMA
        , [ 'ാ' ] -- Mc       MALAYALAM VOWEL SIGN AA
        , List.map Char.fromCode (List.range 0x0D41 0x0D44) -- Mn   [4] MALAYALAM VOWEL SIGN U..MALAYALAM VOWEL SIGN VOCALIC RR
        , [ '്' ] -- Mn       MALAYALAM SIGN VIRAMA
        , [ 'ൗ' ] -- Mc       MALAYALAM AU LENGTH MARK
        , List.map Char.fromCode (List.range 0x0D62 0x0D63) -- Mn   [2] MALAYALAM VOWEL SIGN VOCALIC L..MALAYALAM VOWEL SIGN VOCALIC LL
        , [ '්' ] -- Mn       SINHALA SIGN AL-LAKUNA
        , [ 'ා' ] -- Mc       SINHALA VOWEL SIGN AELA-PILLA
        , List.map Char.fromCode (List.range 0x0DD2 0x0DD4) -- Mn   [3] SINHALA VOWEL SIGN KETTI IS-PILLA..SINHALA VOWEL SIGN KETTI PAA-PILLA
        , [ 'ූ' ] -- Mn       SINHALA VOWEL SIGN DIGA PAA-PILLA
        , [ 'ෟ' ] -- Mc       SINHALA VOWEL SIGN GAYANUKITTA
        , [ 'ั' ] -- Mn       THAI CHARACTER MAI HAN-AKAT
        , List.map Char.fromCode (List.range 0x0E34 0x0E3A) -- Mn   [7] THAI CHARACTER SARA I..THAI CHARACTER PHINTHU
        , List.map Char.fromCode (List.range 0x0E47 0x0E4E) -- Mn   [8] THAI CHARACTER MAITAIKHU..THAI CHARACTER YAMAKKAN
        , [ 'ັ' ] -- Mn       LAO VOWEL SIGN MAI KAN
        , List.map Char.fromCode (List.range 0x0EB4 0x0EBC) -- Mn   [9] LAO VOWEL SIGN I..LAO SEMIVOWEL SIGN LO
        , List.map Char.fromCode (List.range 0x0EC8 0x0ECD) -- Mn   [6] LAO TONE MAI EK..LAO NIGGAHITA
        , List.map Char.fromCode (List.range 0x0F18 0x0F19) -- Mn   [2] TIBETAN ASTROLOGICAL SIGN -KHYUD PA..TIBETAN ASTROLOGICAL SIGN SDONG TSHUGS
        , [ '༵' ] -- Mn       TIBETAN MARK NGAS BZUNG NYI ZLA
        , [ '༷' ] -- Mn       TIBETAN MARK NGAS BZUNG SGOR RTAGS
        , [ '༹' ] -- Mn       TIBETAN MARK TSA -PHRU
        , List.map Char.fromCode (List.range 0x0F71 0x0F7E) -- Mn  [14] TIBETAN VOWEL SIGN AA..TIBETAN SIGN RJES SU NGA RO
        , List.map Char.fromCode (List.range 0x0F80 0x0F84) -- Mn   [5] TIBETAN VOWEL SIGN REVERSED I..TIBETAN MARK HALANTA
        , List.map Char.fromCode (List.range 0x0F86 0x0F87) -- Mn   [2] TIBETAN SIGN LCI RTAGS..TIBETAN SIGN YANG RTAGS
        , List.map Char.fromCode (List.range 0x0F8D 0x0F97) -- Mn  [11] TIBETAN SUBJOINED SIGN LCE TSA CAN..TIBETAN SUBJOINED LETTER JA
        , List.map Char.fromCode (List.range 0x0F99 0x0FBC) -- Mn  [36] TIBETAN SUBJOINED LETTER NYA..TIBETAN SUBJOINED LETTER FIXED-FORM RA
        , [ '࿆' ] -- Mn       TIBETAN SYMBOL PADMA GDAN
        , List.map Char.fromCode (List.range 0x102D 0x1030) -- Mn   [4] MYANMAR VOWEL SIGN I..MYANMAR VOWEL SIGN UU
        , List.map Char.fromCode (List.range 0x1032 0x1037) -- Mn   [6] MYANMAR VOWEL SIGN AI..MYANMAR SIGN DOT BELOW
        , List.map Char.fromCode (List.range 0x1039 0x103A) -- Mn   [2] MYANMAR SIGN VIRAMA..MYANMAR SIGN ASAT
        , List.map Char.fromCode (List.range 0x103D 0x103E) -- Mn   [2] MYANMAR CONSONANT SIGN MEDIAL WA..MYANMAR CONSONANT SIGN MEDIAL HA
        , List.map Char.fromCode (List.range 0x1058 0x1059) -- Mn   [2] MYANMAR VOWEL SIGN VOCALIC L..MYANMAR VOWEL SIGN VOCALIC LL
        , List.map Char.fromCode (List.range 0x105E 0x1060) -- Mn   [3] MYANMAR CONSONANT SIGN MON MEDIAL NA..MYANMAR CONSONANT SIGN MON MEDIAL LA
        , List.map Char.fromCode (List.range 0x1071 0x1074) -- Mn   [4] MYANMAR VOWEL SIGN GEBA KAREN I..MYANMAR VOWEL SIGN KAYAH EE
        , [ 'ႂ' ] -- Mn       MYANMAR CONSONANT SIGN SHAN MEDIAL WA
        , List.map Char.fromCode (List.range 0x1085 0x1086) -- Mn   [2] MYANMAR VOWEL SIGN SHAN E ABOVE..MYANMAR VOWEL SIGN SHAN FINAL Y
        , [ 'ႍ' ] -- Mn       MYANMAR SIGN SHAN COUNCIL EMPHATIC TONE
        , [ 'ႝ' ] -- Mn       MYANMAR VOWEL SIGN AITON AI
        , List.map Char.fromCode (List.range 0x135D 0x135F) -- Mn   [3] ETHIOPIC COMBINING GEMINATION AND VOWEL LENGTH MARK..ETHIOPIC COMBINING GEMINATION MARK
        , List.map Char.fromCode (List.range 0x1712 0x1714) -- Mn   [3] TAGALOG VOWEL SIGN I..TAGALOG SIGN VIRAMA
        , List.map Char.fromCode (List.range 0x1732 0x1734) -- Mn   [3] HANUNOO VOWEL SIGN I..HANUNOO SIGN PAMUDPOD
        , List.map Char.fromCode (List.range 0x1752 0x1753) -- Mn   [2] BUHID VOWEL SIGN I..BUHID VOWEL SIGN U
        , List.map Char.fromCode (List.range 0x1772 0x1773) -- Mn   [2] TAGBANWA VOWEL SIGN I..TAGBANWA VOWEL SIGN U
        , List.map Char.fromCode (List.range 0x17B4 0x17B5) -- Mn   [2] KHMER VOWEL INHERENT AQ..KHMER VOWEL INHERENT AA
        , List.map Char.fromCode (List.range 0x17B7 0x17BD) -- Mn   [7] KHMER VOWEL SIGN I..KHMER VOWEL SIGN UA
        , [ 'ំ' ] -- Mn       KHMER SIGN NIKAHIT
        , List.map Char.fromCode (List.range 0x17C9 0x17D3) -- Mn  [11] KHMER SIGN MUUSIKATOAN..KHMER SIGN BATHAMASAT
        , [ '៝' ] -- Mn       KHMER SIGN ATTHACAN
        , List.map Char.fromCode (List.range 0x180B 0x180D) -- Mn   [3] MONGOLIAN FREE VARIATION SELECTOR ONE..MONGOLIAN FREE VARIATION SELECTOR THREE
        , List.map Char.fromCode (List.range 0x1885 0x1886) -- Mn   [2] MONGOLIAN LETTER ALI GALI BALUDA..MONGOLIAN LETTER ALI GALI THREE BALUDA
        , [ 'ᢩ' ] -- Mn       MONGOLIAN LETTER ALI GALI DAGALGA
        , List.map Char.fromCode (List.range 0x1920 0x1922) -- Mn   [3] LIMBU VOWEL SIGN A..LIMBU VOWEL SIGN U
        , List.map Char.fromCode (List.range 0x1927 0x1928) -- Mn   [2] LIMBU VOWEL SIGN E..LIMBU VOWEL SIGN O
        , [ 'ᤲ' ] -- Mn       LIMBU SMALL LETTER ANUSVARA
        , List.map Char.fromCode (List.range 0x1939 0x193B) -- Mn   [3] LIMBU SIGN MUKPHRENG..LIMBU SIGN SA-I
        , List.map Char.fromCode (List.range 0x1A17 0x1A18) -- Mn   [2] BUGINESE VOWEL SIGN I..BUGINESE VOWEL SIGN U
        , [ 'ᨛ' ] -- Mn       BUGINESE VOWEL SIGN AE
        , [ 'ᩖ' ] -- Mn       TAI THAM CONSONANT SIGN MEDIAL LA
        , List.map Char.fromCode (List.range 0x1A58 0x1A5E) -- Mn   [7] TAI THAM SIGN MAI KANG LAI..TAI THAM CONSONANT SIGN SA
        , [ '᩠' ] -- Mn       TAI THAM SIGN SAKOT
        , [ 'ᩢ' ] -- Mn       TAI THAM VOWEL SIGN MAI SAT
        , List.map Char.fromCode (List.range 0x1A65 0x1A6C) -- Mn   [8] TAI THAM VOWEL SIGN I..TAI THAM VOWEL SIGN OA BELOW
        , List.map Char.fromCode (List.range 0x1A73 0x1A7C) -- Mn  [10] TAI THAM VOWEL SIGN OA ABOVE..TAI THAM SIGN KHUEN-LUE KARAN
        , [ '᩿' ] -- Mn       TAI THAM COMBINING CRYPTOGRAMMIC DOT
        , List.map Char.fromCode (List.range 0x1AB0 0x1ABD) -- Mn  [14] COMBINING DOUBLED CIRCUMFLEX ACCENT..COMBINING PARENTHESES BELOW
        , [ '᪾' ] -- Me       COMBINING PARENTHESES OVERLAY
        , List.map Char.fromCode (List.range 0x1B00 0x1B03) -- Mn   [4] BALINESE SIGN ULU RICEM..BALINESE SIGN SURANG
        , [ '᬴' ] -- Mn       BALINESE SIGN REREKAN
        , [ 'ᬵ' ] -- Mc       BALINESE VOWEL SIGN TEDUNG
        , List.map Char.fromCode (List.range 0x1B36 0x1B3A) -- Mn   [5] BALINESE VOWEL SIGN ULU..BALINESE VOWEL SIGN RA REPA
        , [ 'ᬼ' ] -- Mn       BALINESE VOWEL SIGN LA LENGA
        , [ 'ᭂ' ] -- Mn       BALINESE VOWEL SIGN PEPET
        , List.map Char.fromCode (List.range 0x1B6B 0x1B73) -- Mn   [9] BALINESE MUSICAL SYMBOL COMBINING TEGEH..BALINESE MUSICAL SYMBOL COMBINING GONG
        , List.map Char.fromCode (List.range 0x1B80 0x1B81) -- Mn   [2] SUNDANESE SIGN PANYECEK..SUNDANESE SIGN PANGLAYAR
        , List.map Char.fromCode (List.range 0x1BA2 0x1BA5) -- Mn   [4] SUNDANESE CONSONANT SIGN PANYAKRA..SUNDANESE VOWEL SIGN PANYUKU
        , List.map Char.fromCode (List.range 0x1BA8 0x1BA9) -- Mn   [2] SUNDANESE VOWEL SIGN PAMEPET..SUNDANESE VOWEL SIGN PANEULEUNG
        , List.map Char.fromCode (List.range 0x1BAB 0x1BAD) -- Mn   [3] SUNDANESE SIGN VIRAMA..SUNDANESE CONSONANT SIGN PASANGAN WA
        , [ '᯦' ] -- Mn       BATAK SIGN TOMPI
        , List.map Char.fromCode (List.range 0x1BE8 0x1BE9) -- Mn   [2] BATAK VOWEL SIGN PAKPAK E..BATAK VOWEL SIGN EE
        , [ 'ᯭ' ] -- Mn       BATAK VOWEL SIGN KARO O
        , List.map Char.fromCode (List.range 0x1BEF 0x1BF1) -- Mn   [3] BATAK VOWEL SIGN U FOR SIMALUNGUN SA..BATAK CONSONANT SIGN H
        , List.map Char.fromCode (List.range 0x1C2C 0x1C33) -- Mn   [8] LEPCHA VOWEL SIGN E..LEPCHA CONSONANT SIGN T
        , List.map Char.fromCode (List.range 0x1C36 0x1C37) -- Mn   [2] LEPCHA SIGN RAN..LEPCHA SIGN NUKTA
        , List.map Char.fromCode (List.range 0x1CD0 0x1CD2) -- Mn   [3] VEDIC TONE KARSHANA..VEDIC TONE PRENKHA
        , List.map Char.fromCode (List.range 0x1CD4 0x1CE0) -- Mn  [13] VEDIC SIGN YAJURVEDIC MIDLINE SVARITA..VEDIC TONE RIGVEDIC KASHMIRI INDEPENDENT SVARITA
        , List.map Char.fromCode (List.range 0x1CE2 0x1CE8) -- Mn   [7] VEDIC SIGN VISARGA SVARITA..VEDIC SIGN VISARGA ANUDATTA WITH TAIL
        , [ '᳭' ] -- Mn       VEDIC SIGN TIRYAK
        , [ '᳴' ] -- Mn       VEDIC TONE CANDRA ABOVE
        , List.map Char.fromCode (List.range 0x1CF8 0x1CF9) -- Mn   [2] VEDIC TONE RING ABOVE..VEDIC TONE DOUBLE RING ABOVE
        , List.map Char.fromCode (List.range 0x1DC0 0x1DF9) -- Mn  [58] COMBINING DOTTED GRAVE ACCENT..COMBINING WIDE INVERTED BRIDGE BELOW
        , List.map Char.fromCode (List.range 0x1DFB 0x1DFF) -- Mn   [5] COMBINING DELETION MARK..COMBINING RIGHT ARROWHEAD AND DOWN ARROWHEAD BELOW
        , [ '\u{200C}' ] -- Cf       ZERO WIDTH NON-JOINER
        , List.map Char.fromCode (List.range 0x20D0 0x20DC) -- Mn  [13] COMBINING LEFT HARPOON ABOVE..COMBINING FOUR DOTS ABOVE
        , List.map Char.fromCode (List.range 0x20DD 0x20E0) -- Me   [4] COMBINING ENCLOSING CIRCLE..COMBINING ENCLOSING CIRCLE BACKSLASH
        , [ '⃡' ] -- Mn       COMBINING LEFT RIGHT ARROW ABOVE
        , List.map Char.fromCode (List.range 0x20E2 0x20E4) -- Me   [3] COMBINING ENCLOSING SCREEN..COMBINING ENCLOSING UPWARD POINTING TRIANGLE
        , List.map Char.fromCode (List.range 0x20E5 0x20F0) -- Mn  [12] COMBINING REVERSE SOLIDUS OVERLAY..COMBINING ASTERISK ABOVE
        , List.map Char.fromCode (List.range 0x2CEF 0x2CF1) -- Mn   [3] COPTIC COMBINING NI ABOVE..COPTIC COMBINING SPIRITUS LENIS
        , [ '⵿' ] -- Mn       TIFINAGH CONSONANT JOINER
        , List.map Char.fromCode (List.range 0x2DE0 0x2DFF) -- Mn  [32] COMBINING CYRILLIC LETTER BE..COMBINING CYRILLIC LETTER IOTIFIED BIG YUS
        , List.map Char.fromCode (List.range 0x302A 0x302D) -- Mn   [4] IDEOGRAPHIC LEVEL TONE MARK..IDEOGRAPHIC ENTERING TONE MARK
        , List.map Char.fromCode (List.range 0x302E 0x302F) -- Mc   [2] HANGUL SINGLE DOT TONE MARK..HANGUL DOUBLE DOT TONE MARK
        , List.map Char.fromCode (List.range 0x3099 0x309A) -- Mn   [2] COMBINING KATAKANA-HIRAGANA VOICED SOUND MARK..COMBINING KATAKANA-HIRAGANA SEMI-VOICED SOUND MARK
        , [ '꙯' ] -- Mn       COMBINING CYRILLIC VZMET
        , List.map Char.fromCode (List.range 0xA670 0xA672) -- Me   [3] COMBINING CYRILLIC TEN MILLIONS SIGN..COMBINING CYRILLIC THOUSAND MILLIONS SIGN
        , List.map Char.fromCode (List.range 0xA674 0xA67D) -- Mn  [10] COMBINING CYRILLIC LETTER UKRAINIAN IE..COMBINING CYRILLIC PAYEROK
        , List.map Char.fromCode (List.range 0xA69E 0xA69F) -- Mn   [2] COMBINING CYRILLIC LETTER EF..COMBINING CYRILLIC LETTER IOTIFIED E
        , List.map Char.fromCode (List.range 0xA6F0 0xA6F1) -- Mn   [2] BAMUM COMBINING MARK KOQNDON..BAMUM COMBINING MARK TUKWENTIS
        , [ 'ꠂ' ] -- Mn       SYLOTI NAGRI SIGN DVISVARA
        , [ '꠆' ] -- Mn       SYLOTI NAGRI SIGN HASANTA
        , [ 'ꠋ' ] -- Mn       SYLOTI NAGRI SIGN ANUSVARA
        , List.map Char.fromCode (List.range 0xA825 0xA826) -- Mn   [2] SYLOTI NAGRI VOWEL SIGN U..SYLOTI NAGRI VOWEL SIGN E
        , List.map Char.fromCode (List.range 0xA8C4 0xA8C5) -- Mn   [2] SAURASHTRA SIGN VIRAMA..SAURASHTRA SIGN CANDRABINDU
        , List.map Char.fromCode (List.range 0xA8E0 0xA8F1) -- Mn  [18] COMBINING DEVANAGARI DIGIT ZERO..COMBINING DEVANAGARI SIGN AVAGRAHA
        , [ '\u{A8FF}' ] -- Mn       DEVANAGARI VOWEL SIGN AY
        , List.map Char.fromCode (List.range 0xA926 0xA92D) -- Mn   [8] KAYAH LI VOWEL UE..KAYAH LI TONE CALYA PLOPHU
        , List.map Char.fromCode (List.range 0xA947 0xA951) -- Mn  [11] REJANG VOWEL SIGN I..REJANG CONSONANT SIGN R
        , List.map Char.fromCode (List.range 0xA980 0xA982) -- Mn   [3] JAVANESE SIGN PANYANGGA..JAVANESE SIGN LAYAR
        , [ '꦳' ] -- Mn       JAVANESE SIGN CECAK TELU
        , List.map Char.fromCode (List.range 0xA9B6 0xA9B9) -- Mn   [4] JAVANESE VOWEL SIGN WULU..JAVANESE VOWEL SIGN SUKU MENDUT
        , List.map Char.fromCode (List.range 0xA9BC 0xA9BD) -- Mn   [2] JAVANESE VOWEL SIGN PEPET..JAVANESE CONSONANT SIGN KERET
        , [ 'ꧥ' ] -- Mn       MYANMAR SIGN SHAN SAW
        , List.map Char.fromCode (List.range 0xAA29 0xAA2E) -- Mn   [6] CHAM VOWEL SIGN AA..CHAM VOWEL SIGN OE
        , List.map Char.fromCode (List.range 0xAA31 0xAA32) -- Mn   [2] CHAM VOWEL SIGN AU..CHAM VOWEL SIGN UE
        , List.map Char.fromCode (List.range 0xAA35 0xAA36) -- Mn   [2] CHAM CONSONANT SIGN LA..CHAM CONSONANT SIGN WA
        , [ 'ꩃ' ] -- Mn       CHAM CONSONANT SIGN FINAL NG
        , [ 'ꩌ' ] -- Mn       CHAM CONSONANT SIGN FINAL M
        , [ 'ꩼ' ] -- Mn       MYANMAR SIGN TAI LAING TONE-2
        , [ 'ꪰ' ] -- Mn       TAI VIET MAI KANG
        , List.map Char.fromCode (List.range 0xAAB2 0xAAB4) -- Mn   [3] TAI VIET VOWEL I..TAI VIET VOWEL U
        , List.map Char.fromCode (List.range 0xAAB7 0xAAB8) -- Mn   [2] TAI VIET MAI KHIT..TAI VIET VOWEL IA
        , List.map Char.fromCode (List.range 0xAABE 0xAABF) -- Mn   [2] TAI VIET VOWEL AM..TAI VIET TONE MAI EK
        , [ '꫁' ] -- Mn       TAI VIET TONE MAI THO
        , List.map Char.fromCode (List.range 0xAAEC 0xAAED) -- Mn   [2] MEETEI MAYEK VOWEL SIGN UU..MEETEI MAYEK VOWEL SIGN AAI
        , [ '꫶' ] -- Mn       MEETEI MAYEK VIRAMA
        , [ 'ꯥ' ] -- Mn       MEETEI MAYEK VOWEL SIGN ANAP
        , [ 'ꯨ' ] -- Mn       MEETEI MAYEK VOWEL SIGN UNAP
        , [ '꯭' ] -- Mn       MEETEI MAYEK APUN IYEK
        , [ 'ﬞ' ] -- Mn       HEBREW POINT JUDEO-SPANISH VARIKA
        , List.map Char.fromCode (List.range 0xFE00 0xFE0F) -- Mn  [16] VARIATION SELECTOR-1..VARIATION SELECTOR-16
        , List.map Char.fromCode (List.range 0xFE20 0xFE2F) -- Mn  [16] COMBINING LIGATURE LEFT HALF..COMBINING CYRILLIC TITLO RIGHT HALF
        , List.map Char.fromCode (List.range 0xFF9E 0xFF9F) -- Lm   [2] HALFWIDTH KATAKANA VOICED SOUND MARK..HALFWIDTH KATAKANA SEMI-VOICED SOUND MARK
        , [ '𐇽' ] -- Mn       PHAISTOS DISC SIGN COMBINING OBLIQUE STROKE
        , [ '𐋠' ] -- Mn       COPTIC EPACT THOUSANDS MARK
        , List.map Char.fromCode (List.range 0x00010376 0x0001037A) -- Mn   [5] COMBINING OLD PERMIC LETTER AN..COMBINING OLD PERMIC LETTER SII
        , List.map Char.fromCode (List.range 0x00010A01 0x00010A03) -- Mn   [3] KHAROSHTHI VOWEL SIGN I..KHAROSHTHI VOWEL SIGN VOCALIC R
        , List.map Char.fromCode (List.range 0x00010A05 0x00010A06) -- Mn   [2] KHAROSHTHI VOWEL SIGN E..KHAROSHTHI VOWEL SIGN O
        , List.map Char.fromCode (List.range 0x00010A0C 0x00010A0F) -- Mn   [4] KHAROSHTHI VOWEL LENGTH MARK..KHAROSHTHI SIGN VISARGA
        , List.map Char.fromCode (List.range 0x00010A38 0x00010A3A) -- Mn   [3] KHAROSHTHI SIGN BAR ABOVE..KHAROSHTHI SIGN DOT BELOW
        , [ '𐨿' ] -- Mn       KHAROSHTHI VIRAMA
        , List.map Char.fromCode (List.range 0x00010AE5 0x00010AE6) -- Mn   [2] MANICHAEAN ABBREVIATION MARK ABOVE..MANICHAEAN ABBREVIATION MARK BELOW
        , List.map Char.fromCode (List.range 0x00010D24 0x00010D27) -- Mn   [4] HANIFI ROHINGYA SIGN HARBAHAY..HANIFI ROHINGYA SIGN TASSI
        , List.map Char.fromCode (List.range 0x00010F46 0x00010F50) -- Mn  [11] SOGDIAN COMBINING DOT BELOW..SOGDIAN COMBINING STROKE BELOW
        , [ '𑀁' ] -- Mn       BRAHMI SIGN ANUSVARA
        , List.map Char.fromCode (List.range 0x00011038 0x00011046) -- Mn  [15] BRAHMI VOWEL SIGN AA..BRAHMI VIRAMA
        , List.map Char.fromCode (List.range 0x0001107F 0x00011081) -- Mn   [3] BRAHMI NUMBER JOINER..KAITHI SIGN ANUSVARA
        , List.map Char.fromCode (List.range 0x000110B3 0x000110B6) -- Mn   [4] KAITHI VOWEL SIGN U..KAITHI VOWEL SIGN AI
        , List.map Char.fromCode (List.range 0x000110B9 0x000110BA) -- Mn   [2] KAITHI SIGN VIRAMA..KAITHI SIGN NUKTA
        , List.map Char.fromCode (List.range 0x00011100 0x00011102) -- Mn   [3] CHAKMA SIGN CANDRABINDU..CHAKMA SIGN VISARGA
        , List.map Char.fromCode (List.range 0x00011127 0x0001112B) -- Mn   [5] CHAKMA VOWEL SIGN A..CHAKMA VOWEL SIGN UU
        , List.map Char.fromCode (List.range 0x0001112D 0x00011134) -- Mn   [8] CHAKMA VOWEL SIGN AI..CHAKMA MAAYYAA
        , [ '𑅳' ] -- Mn       MAHAJANI SIGN NUKTA
        , List.map Char.fromCode (List.range 0x00011180 0x00011181) -- Mn   [2] SHARADA SIGN CANDRABINDU..SHARADA SIGN ANUSVARA
        , List.map Char.fromCode (List.range 0x000111B6 0x000111BE) -- Mn   [9] SHARADA VOWEL SIGN U..SHARADA VOWEL SIGN O
        , List.map Char.fromCode (List.range 0x000111C9 0x000111CC) -- Mn   [4] SHARADA SANDHI MARK..SHARADA EXTRA SHORT VOWEL MARK
        , List.map Char.fromCode (List.range 0x0001122F 0x00011231) -- Mn   [3] KHOJKI VOWEL SIGN U..KHOJKI VOWEL SIGN AI
        , [ '𑈴' ] -- Mn       KHOJKI SIGN ANUSVARA
        , List.map Char.fromCode (List.range 0x00011236 0x00011237) -- Mn   [2] KHOJKI SIGN NUKTA..KHOJKI SIGN SHADDA
        , [ '\u{1123E}' ] -- Mn       KHOJKI SIGN SUKUN
        , [ '𑋟' ] -- Mn       KHUDAWADI SIGN ANUSVARA
        , List.map Char.fromCode (List.range 0x000112E3 0x000112EA) -- Mn   [8] KHUDAWADI VOWEL SIGN U..KHUDAWADI SIGN VIRAMA
        , List.map Char.fromCode (List.range 0x00011300 0x00011301) -- Mn   [2] GRANTHA SIGN COMBINING ANUSVARA ABOVE..GRANTHA SIGN CANDRABINDU
        , List.map Char.fromCode (List.range 0x0001133B 0x0001133C) -- Mn   [2] COMBINING BINDU BELOW..GRANTHA SIGN NUKTA
        , [ '𑌾' ] -- Mc       GRANTHA VOWEL SIGN AA
        , [ '𑍀' ] -- Mn       GRANTHA VOWEL SIGN II
        , [ '𑍗' ] -- Mc       GRANTHA AU LENGTH MARK
        , List.map Char.fromCode (List.range 0x00011366 0x0001136C) -- Mn   [7] COMBINING GRANTHA DIGIT ZERO..COMBINING GRANTHA DIGIT SIX
        , List.map Char.fromCode (List.range 0x00011370 0x00011374) -- Mn   [5] COMBINING GRANTHA LETTER A..COMBINING GRANTHA LETTER PA
        , List.map Char.fromCode (List.range 0x00011438 0x0001143F) -- Mn   [8] NEWA VOWEL SIGN U..NEWA VOWEL SIGN AI
        , List.map Char.fromCode (List.range 0x00011442 0x00011444) -- Mn   [3] NEWA SIGN VIRAMA..NEWA SIGN ANUSVARA
        , [ '\u{11446}' ] -- Mn       NEWA SIGN NUKTA
        , [ '\u{1145E}' ] -- Mn       NEWA SANDHI MARK
        , [ '𑒰' ] -- Mc       TIRHUTA VOWEL SIGN AA
        , List.map Char.fromCode (List.range 0x000114B3 0x000114B8) -- Mn   [6] TIRHUTA VOWEL SIGN U..TIRHUTA VOWEL SIGN VOCALIC LL
        , [ '𑒺' ] -- Mn       TIRHUTA VOWEL SIGN SHORT E
        , [ '𑒽' ] -- Mc       TIRHUTA VOWEL SIGN SHORT O
        , List.map Char.fromCode (List.range 0x000114BF 0x000114C0) -- Mn   [2] TIRHUTA SIGN CANDRABINDU..TIRHUTA SIGN ANUSVARA
        , List.map Char.fromCode (List.range 0x000114C2 0x000114C3) -- Mn   [2] TIRHUTA SIGN VIRAMA..TIRHUTA SIGN NUKTA
        , [ '𑖯' ] -- Mc       SIDDHAM VOWEL SIGN AA
        , List.map Char.fromCode (List.range 0x000115B2 0x000115B5) -- Mn   [4] SIDDHAM VOWEL SIGN U..SIDDHAM VOWEL SIGN VOCALIC RR
        , List.map Char.fromCode (List.range 0x000115BC 0x000115BD) -- Mn   [2] SIDDHAM SIGN CANDRABINDU..SIDDHAM SIGN ANUSVARA
        , List.map Char.fromCode (List.range 0x000115BF 0x000115C0) -- Mn   [2] SIDDHAM SIGN VIRAMA..SIDDHAM SIGN NUKTA
        , List.map Char.fromCode (List.range 0x000115DC 0x000115DD) -- Mn   [2] SIDDHAM VOWEL SIGN ALTERNATE U..SIDDHAM VOWEL SIGN ALTERNATE UU
        , List.map Char.fromCode (List.range 0x00011633 0x0001163A) -- Mn   [8] MODI VOWEL SIGN U..MODI VOWEL SIGN AI
        , [ '𑘽' ] -- Mn       MODI SIGN ANUSVARA
        , List.map Char.fromCode (List.range 0x0001163F 0x00011640) -- Mn   [2] MODI SIGN VIRAMA..MODI SIGN ARDHACANDRA
        , [ '𑚫' ] -- Mn       TAKRI SIGN ANUSVARA
        , [ '𑚭' ] -- Mn       TAKRI VOWEL SIGN AA
        , List.map Char.fromCode (List.range 0x000116B0 0x000116B5) -- Mn   [6] TAKRI VOWEL SIGN U..TAKRI VOWEL SIGN AU
        , [ '𑚷' ] -- Mn       TAKRI SIGN NUKTA
        , List.map Char.fromCode (List.range 0x0001171D 0x0001171F) -- Mn   [3] AHOM CONSONANT SIGN MEDIAL LA..AHOM CONSONANT SIGN MEDIAL LIGATING RA
        , List.map Char.fromCode (List.range 0x00011722 0x00011725) -- Mn   [4] AHOM VOWEL SIGN I..AHOM VOWEL SIGN UU
        , List.map Char.fromCode (List.range 0x00011727 0x0001172B) -- Mn   [5] AHOM VOWEL SIGN AW..AHOM SIGN KILLER
        , List.map Char.fromCode (List.range 0x0001182F 0x00011837) -- Mn   [9] DOGRA VOWEL SIGN U..DOGRA SIGN ANUSVARA
        , List.map Char.fromCode (List.range 0x00011839 0x0001183A) -- Mn   [2] DOGRA SIGN VIRAMA..DOGRA SIGN NUKTA
        , List.map Char.fromCode (List.range 0x000119D4 0x000119D7) -- Mn   [4] NANDINAGARI VOWEL SIGN U..NANDINAGARI VOWEL SIGN VOCALIC RR
        , List.map Char.fromCode (List.range 0x000119DA 0x000119DB) -- Mn   [2] NANDINAGARI VOWEL SIGN E..NANDINAGARI VOWEL SIGN AI
        , [ '\u{119E0}' ] -- Mn       NANDINAGARI SIGN VIRAMA
        , List.map Char.fromCode (List.range 0x00011A01 0x00011A0A) -- Mn  [10] ZANABAZAR SQUARE VOWEL SIGN I..ZANABAZAR SQUARE VOWEL LENGTH MARK
        , List.map Char.fromCode (List.range 0x00011A33 0x00011A38) -- Mn   [6] ZANABAZAR SQUARE FINAL CONSONANT MARK..ZANABAZAR SQUARE SIGN ANUSVARA
        , List.map Char.fromCode (List.range 0x00011A3B 0x00011A3E) -- Mn   [4] ZANABAZAR SQUARE CLUSTER-FINAL LETTER YA..ZANABAZAR SQUARE CLUSTER-FINAL LETTER VA
        , [ '\u{11A47}' ] -- Mn       ZANABAZAR SQUARE SUBJOINER
        , List.map Char.fromCode (List.range 0x00011A51 0x00011A56) -- Mn   [6] SOYOMBO VOWEL SIGN I..SOYOMBO VOWEL SIGN OE
        , List.map Char.fromCode (List.range 0x00011A59 0x00011A5B) -- Mn   [3] SOYOMBO VOWEL SIGN VOCALIC R..SOYOMBO VOWEL LENGTH MARK
        , List.map Char.fromCode (List.range 0x00011A8A 0x00011A96) -- Mn  [13] SOYOMBO FINAL CONSONANT SIGN G..SOYOMBO SIGN ANUSVARA
        , List.map Char.fromCode (List.range 0x00011A98 0x00011A99) -- Mn   [2] SOYOMBO GEMINATION MARK..SOYOMBO SUBJOINER
        , List.map Char.fromCode (List.range 0x00011C30 0x00011C36) -- Mn   [7] BHAIKSUKI VOWEL SIGN I..BHAIKSUKI VOWEL SIGN VOCALIC L
        , List.map Char.fromCode (List.range 0x00011C38 0x00011C3D) -- Mn   [6] BHAIKSUKI VOWEL SIGN E..BHAIKSUKI SIGN ANUSVARA
        , [ '\u{11C3F}' ] -- Mn       BHAIKSUKI SIGN VIRAMA
        , List.map Char.fromCode (List.range 0x00011C92 0x00011CA7) -- Mn  [22] MARCHEN SUBJOINED LETTER KA..MARCHEN SUBJOINED LETTER ZA
        , List.map Char.fromCode (List.range 0x00011CAA 0x00011CB0) -- Mn   [7] MARCHEN SUBJOINED LETTER RA..MARCHEN VOWEL SIGN AA
        , List.map Char.fromCode (List.range 0x00011CB2 0x00011CB3) -- Mn   [2] MARCHEN VOWEL SIGN U..MARCHEN VOWEL SIGN E
        , List.map Char.fromCode (List.range 0x00011CB5 0x00011CB6) -- Mn   [2] MARCHEN SIGN ANUSVARA..MARCHEN SIGN CANDRABINDU
        , List.map Char.fromCode (List.range 0x00011D31 0x00011D36) -- Mn   [6] MASARAM GONDI VOWEL SIGN AA..MASARAM GONDI VOWEL SIGN VOCALIC R
        , [ '\u{11D3A}' ] -- Mn       MASARAM GONDI VOWEL SIGN E
        , List.map Char.fromCode (List.range 0x00011D3C 0x00011D3D) -- Mn   [2] MASARAM GONDI VOWEL SIGN AI..MASARAM GONDI VOWEL SIGN O
        , List.map Char.fromCode (List.range 0x00011D3F 0x00011D45) -- Mn   [7] MASARAM GONDI VOWEL SIGN AU..MASARAM GONDI VIRAMA
        , [ '\u{11D47}' ] -- Mn       MASARAM GONDI RA-KARA
        , List.map Char.fromCode (List.range 0x00011D90 0x00011D91) -- Mn   [2] GUNJALA GONDI VOWEL SIGN EE..GUNJALA GONDI VOWEL SIGN AI
        , [ '\u{11D95}' ] -- Mn       GUNJALA GONDI SIGN ANUSVARA
        , [ '\u{11D97}' ] -- Mn       GUNJALA GONDI VIRAMA
        , List.map Char.fromCode (List.range 0x00011EF3 0x00011EF4) -- Mn   [2] MAKASAR VOWEL SIGN I..MAKASAR VOWEL SIGN U
        , List.map Char.fromCode (List.range 0x00016AF0 0x00016AF4) -- Mn   [5] BASSA VAH COMBINING HIGH TONE..BASSA VAH COMBINING HIGH-LOW TONE
        , List.map Char.fromCode (List.range 0x00016B30 0x00016B36) -- Mn   [7] PAHAWH HMONG MARK CIM TUB..PAHAWH HMONG MARK CIM TAUM
        , [ '\u{16F4F}' ] -- Mn       MIAO SIGN CONSONANT MODIFIER BAR
        , List.map Char.fromCode (List.range 0x00016F8F 0x00016F92) -- Mn   [4] MIAO TONE RIGHT..MIAO TONE BELOW
        , List.map Char.fromCode (List.range 0x0001BC9D 0x0001BC9E) -- Mn   [2] DUPLOYAN THICK LETTER SELECTOR..DUPLOYAN DOUBLE MARK
        , [ '𝅥' ] -- Mc       MUSICAL SYMBOL COMBINING STEM
        , List.map Char.fromCode (List.range 0x0001D167 0x0001D169) -- Mn   [3] MUSICAL SYMBOL COMBINING TREMOLO-1..MUSICAL SYMBOL COMBINING TREMOLO-3
        , List.map Char.fromCode (List.range 0x0001D16E 0x0001D172) -- Mc   [5] MUSICAL SYMBOL COMBINING FLAG-1..MUSICAL SYMBOL COMBINING FLAG-5
        , List.map Char.fromCode (List.range 0x0001D17B 0x0001D182) -- Mn   [8] MUSICAL SYMBOL COMBINING ACCENT..MUSICAL SYMBOL COMBINING LOURE
        , List.map Char.fromCode (List.range 0x0001D185 0x0001D18B) -- Mn   [7] MUSICAL SYMBOL COMBINING DOIT..MUSICAL SYMBOL COMBINING TRIPLE TONGUE
        , List.map Char.fromCode (List.range 0x0001D1AA 0x0001D1AD) -- Mn   [4] MUSICAL SYMBOL COMBINING DOWN BOW..MUSICAL SYMBOL COMBINING SNAP PIZZICATO
        , List.map Char.fromCode (List.range 0x0001D242 0x0001D244) -- Mn   [3] COMBINING GREEK MUSICAL TRISEME..COMBINING GREEK MUSICAL PENTASEME
        , List.map Char.fromCode (List.range 0x0001DA00 0x0001DA36) -- Mn  [55] SIGNWRITING HEAD RIM..SIGNWRITING AIR SUCKING IN
        , List.map Char.fromCode (List.range 0x0001DA3B 0x0001DA6C) -- Mn  [50] SIGNWRITING MOUTH CLOSED NEUTRAL..SIGNWRITING EXCITEMENT
        , [ '\u{1DA75}' ] -- Mn       SIGNWRITING UPPER BODY TILTING FROM HIP JOINTS
        , [ '\u{1DA84}' ] -- Mn       SIGNWRITING LOCATION HEAD NECK
        , List.map Char.fromCode (List.range 0x0001DA9B 0x0001DA9F) -- Mn   [5] SIGNWRITING FILL MODIFIER-2..SIGNWRITING FILL MODIFIER-6
        , List.map Char.fromCode (List.range 0x0001DAA1 0x0001DAAF) -- Mn  [15] SIGNWRITING ROTATION MODIFIER-2..SIGNWRITING ROTATION MODIFIER-16
        , List.map Char.fromCode (List.range 0x0001E000 0x0001E006) -- Mn   [7] COMBINING GLAGOLITIC LETTER AZU..COMBINING GLAGOLITIC LETTER ZHIVETE
        , List.map Char.fromCode (List.range 0x0001E008 0x0001E018) -- Mn  [17] COMBINING GLAGOLITIC LETTER ZEMLJA..COMBINING GLAGOLITIC LETTER HERU
        , List.map Char.fromCode (List.range 0x0001E01B 0x0001E021) -- Mn   [7] COMBINING GLAGOLITIC LETTER SHTA..COMBINING GLAGOLITIC LETTER YATI
        , List.map Char.fromCode (List.range 0x0001E023 0x0001E024) -- Mn   [2] COMBINING GLAGOLITIC LETTER YU..COMBINING GLAGOLITIC LETTER SMALL YUS
        , List.map Char.fromCode (List.range 0x0001E026 0x0001E02A) -- Mn   [5] COMBINING GLAGOLITIC LETTER YO..COMBINING GLAGOLITIC LETTER FITA
        , List.map Char.fromCode (List.range 0x0001E130 0x0001E136) -- Mn   [7] NYIAKENG PUACHUE HMONG TONE-B..NYIAKENG PUACHUE HMONG TONE-D
        , List.map Char.fromCode (List.range 0x0001E2EC 0x0001E2EF) -- Mn   [4] WANCHO TONE TUP..WANCHO TONE KOINI
        , List.map Char.fromCode (List.range 0x0001E8D0 0x0001E8D6) -- Mn   [7] MENDE KIKAKUI COMBINING NUMBER TEENS..MENDE KIKAKUI COMBINING NUMBER MILLIONS
        , List.map Char.fromCode (List.range 0x0001E944 0x0001E94A) -- Mn   [7] ADLAM ALIF LENGTHENER..ADLAM NUKTA
        , List.map Char.fromCode (List.range 0x0001F3FB 0x0001F3FF) -- Sk   [5] EMOJI MODIFIER FITZPATRICK TYPE-1-2..EMOJI MODIFIER FITZPATRICK TYPE-6
        , List.map Char.fromCode (List.range 0x000E0020 0x000E007F) -- Cf  [96] TAG SPACE..CANCEL TAG
        , List.map Char.fromCode (List.range 0x000E0100 0x000E01EF) -- Mn [240] VARIATION SELECTOR-17..VARIATION SELECTOR-256
        ]
