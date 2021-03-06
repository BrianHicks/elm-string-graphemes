module String.Graphemes.Data.LVT exposing (chars, match)

{-| Hey, this module was generated automatically. Please don't edit it.

Run `make src/String/Graphemes/Data/LVT.elm` instead!

-}

import String.Graphemes.Data as Data
import String.Graphemes.RangeDict as RangeDict exposing (RangeDict)
import String.Graphemes.RangeDict.Range as Range exposing (Range)


match : Char -> Bool
match c =
    RangeDict.member c chars


chars : RangeDict Char Data.Class
chars =
    (Result.withDefault RangeDict.empty << Data.parser Data.LVT)
        "2각갛2객갷2갹걓2걕걯2걱겋2겍겧2격곃2곅곟2곡곻2곽괗2괙괳2괵굏2굑굫2국궇2궉궣2궥궿2귁귛2귝귷2극긓2긕긯2긱깋2깍깧2깩꺃2꺅꺟2꺡꺻2꺽껗2껙껳2껵꼏2꼑꼫2꼭꽇2꽉꽣2꽥꽿2꾁꾛2꾝꾷2꾹꿓2꿕꿯2꿱뀋2뀍뀧2뀩끃2끅끟2끡끻2끽낗2낙낳2낵냏2냑냫2냭넇2넉넣2넥넿2녁녛2녝녷2녹놓2놕놯2놱뇋2뇍뇧2뇩눃2눅눟2눡눻2눽뉗2뉙뉳2뉵늏2늑늫2늭닇2닉닣2닥닿2댁댛2댝댷2댹덓2덕덯2덱뎋2뎍뎧2뎩돃2독돟2돡돻2돽됗2됙됳2됵둏2둑둫2둭뒇2뒉뒣2뒥뒿2듁듛2득듷2듹딓2딕딯2딱땋2땍땧2땩떃2떅떟2떡떻2떽뗗2뗙뗳2뗵똏2똑똫2똭뙇2뙉뙣2뙥뙿2뚁뚛2뚝뚷2뚹뛓2뛕뛯2뛱뜋2뜍뜧2뜩띃2띅띟2띡띻2락랗2랙랳2략럏2럑럫2럭렇2렉렣2력렿2롁롛2록롷2롹뢓2뢕뢯2뢱룋2룍룧2룩뤃2뤅뤟2뤡뤻2뤽륗2륙륳2륵릏2릑릫2릭맇2막맣2맥맿2먁먛2먝먷2먹멓2멕멯2멱몋2몍몧2목뫃2뫅뫟2뫡뫻2뫽묗2묙묳2묵뭏2뭑뭫2뭭뮇2뮉뮣2뮥뮿2믁믛2믝믷2믹밓2박밯2백뱋2뱍뱧2뱩벃2벅벟2벡벻2벽볗2볙볳2복봏2봑봫2봭뵇2뵉뵣2뵥뵿2북붛2붝붷2붹뷓2뷕뷯2뷱븋2븍븧2븩빃2빅빟2빡빻2빽뺗2뺙뺳2뺵뻏2뻑뻫2뻭뼇2뼉뼣2뼥뼿2뽁뽛2뽝뽷2뽹뾓2뾕뾯2뾱뿋2뿍뿧2뿩쀃2쀅쀟2쀡쀻2쀽쁗2쁙쁳2쁵삏2삑삫2삭샇2색샣2샥샿2섁섛2석섷2섹셓2셕셯2셱솋2속솧2솩쇃2쇅쇟2쇡쇻2쇽숗2숙숳2숵쉏2쉑쉫2쉭슇2슉슣2슥슿2싁싛2식싷2싹쌓2쌕쌯2쌱썋2썍썧2썩쎃2쎅쎟2쎡쎻2쎽쏗2쏙쏳2쏵쐏2쐑쐫2쐭쑇2쑉쑣2쑥쑿2쒁쒛2쒝쒷2쒹쓓2쓕쓯2쓱씋2씍씧2씩앃2악앟2액앻2약얗2얙얳2억엏2엑엫2역옇2옉옣2옥옿2왁왛2왝왷2왹욓2욕욯2욱웋2웍웧2웩윃2윅윟2육윻2윽읗2읙읳2익잏2작잫2잭쟇2쟉쟣2쟥쟿2적젛2젝젷2젹졓2졕졯2족좋2좍좧2좩죃2죅죟2죡죻2죽줗2줙줳2줵쥏2쥑쥫2쥭즇2즉즣2즥즿2직짛2짝짷2짹쨓2쨕쨯2쨱쩋2쩍쩧2쩩쪃2쪅쪟2쪡쪻2쪽쫗2쫙쫳2쫵쬏2쬑쬫2쬭쭇2쭉쭣2쭥쭿2쮁쮛2쮝쮷2쮹쯓2쯕쯯2쯱찋2찍찧2착챃2책챟2챡챻2챽첗2척첳2첵쳏2쳑쳫2쳭촇2촉촣2촥촿2쵁쵛2쵝쵷2쵹춓2축춯2춱췋2췍췧2췩츃2츅츟2측츻2츽칗2칙칳2칵캏2캑캫2캭컇2컉컣2컥컿2켁켛2켝켷2켹콓2콕콯2콱쾋2쾍쾧2쾩쿃2쿅쿟2쿡쿻2쿽퀗2퀙퀳2퀵큏2큑큫2큭킇2킉킣2킥킿2탁탛2택탷2탹턓2턕턯2턱텋2텍텧2텩톃2톅톟2톡톻2톽퇗2퇙퇳2퇵툏2툑툫2툭퉇2퉉퉣2퉥퉿2튁튛2튝튷2특틓2틕틯2틱팋2팍팧2팩퍃2퍅퍟2퍡퍻2퍽펗2펙펳2펵폏2폑폫2폭퐇2퐉퐣2퐥퐿2푁푛2푝푷2푹풓2풕풯2풱퓋2퓍퓧2퓩픃2픅픟2픡픻2픽핗2학핳2핵햏2햑햫2햭헇2헉헣2헥헿2혁혛2혝혷2혹홓2확홯2홱횋2획횧2횩훃2훅훟2훡훻2훽휗2휙휳2휵흏2흑흫2흭힇2힉힣"