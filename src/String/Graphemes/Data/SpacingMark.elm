module String.Graphemes.Data.SpacingMark exposing (chars, match)

{-| Hey, this module was generated automatically. Please don't edit it.

Run `make src/String/Graphemes/Data/SpacingMark.elm` instead!

-}

import String.Graphemes.Data as Data
import String.Graphemes.RangeDict as RangeDict exposing (RangeDict)
import String.Graphemes.RangeDict.Range as Range exposing (Range)


match : Char -> Bool
match c =
    RangeDict.member c chars


chars : RangeDict Char Data.Class
chars =
    (Result.withDefault RangeDict.empty << Data.parser Data.SpacingMark)
        "1ः1ऻ2ाी2ॉौ2ॎॏ2ংঃ2িী2েৈ2োৌ1ਃ2ਾੀ1ઃ2ાી1ૉ2ોૌ2ଂଃ1ୀ2େୈ2ୋୌ1ி2ுூ2ெை2ொௌ2ఁః2ుౄ2ಂಃ1ಾ2ೀು2ೃೄ2ೇೈ2ೊೋ2ംഃ2ിീ2െൈ2ൊൌ2ංඃ2ැෑ2ෘෞ2ෲෳ1ำ1ຳ2༾༿1ཿ1ေ2ျြ2ၖၗ1ႄ1ា2ើៅ2ះៈ2ᤣᤦ2ᤩᤫ2ᤰᤱ2ᤳᤸ2ᨙᨚ1ᩕ1ᩗ2ᩭᩲ1ᬄ1ᬻ2ᬽᭁ2ᭃ᭄1ᮂ1ᮡ2ᮦᮧ1᮪1ᯧ2ᯪᯬ1ᯮ2᯲᯳2ᰤᰫ2ᰴᰵ1᳡1᳷2ꠣꠤ1ꠧ2ꢀꢁ2ꢴꣃ2ꥒ꥓1ꦃ2ꦴꦵ2ꦺꦻ2ꦾ꧀2ꨯꨰ2ꨳꨴ1ꩍ1ꫫ2ꫮꫯ1ꫵ2ꯣꯤ2ꯦꯧ2ꯩꯪ1꯬1𑀀1𑀂1𑂂2𑂰𑂲2𑂷𑂸1𑄬2𑅅𑅆1𑆂2𑆳𑆵2𑆿𑇀2𑈬𑈮2𑈲𑈳1𑈵2𑋠𑋢2𑌂𑌃1𑌿2𑍁𑍄2𑍇𑍈2𑍋𑍍2𑍢𑍣2𑐵𑐷2𑑀𑑁1𑑅2𑒱𑒲1𑒹2𑒻𑒼1𑒾1𑓁2𑖰𑖱2𑖸𑖻1𑖾2𑘰𑘲2𑘻𑘼1𑘾1𑚬2𑚮𑚯1𑚶2𑜠𑜡1𑜦2𑠬𑠮1𑠸2𑧑𑧓2𑧜𑧟1𑧤1𑨹2𑩗𑩘1𑪗1𑰯1𑰾1𑲩1𑲱1𑲴2𑶊𑶎2𑶓𑶔1𑶖2𑻵𑻶2𖽑𖾇1𝅦1𝅭"