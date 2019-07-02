module String.Graphemes.Data.LV exposing (chars, match, parser)

{-| Hey, this module was generated automatically. Please don't edit it.

Run `make src/String/Graphemes/Data/LV.elm` instead!

-}

import Parser exposing (Parser)
import String.Graphemes.Data as Data
import String.Graphemes.RangeDict as RangeDict exposing (RangeDict)
import String.Graphemes.RangeDict.Range as Range exposing (Range)


parser : Parser ()
parser =
    Parser.chompIf match


match : Char -> Bool
match c =
    RangeDict.member c chars


chars : RangeDict Char
chars =
    (Result.withDefault RangeDict.empty << Parser.run Data.parser)
        "1가1개1갸1걔1거1게1겨1계1고1과1괘1괴1교1구1궈1궤1귀1규1그1긔1기1까1깨1꺄1꺠1꺼1께1껴1꼐1꼬1꽈1꽤1꾀1꾜1꾸1꿔1꿰1뀌1뀨1끄1끠1끼1나1내1냐1냬1너1네1녀1녜1노1놔1놰1뇌1뇨1누1눠1눼1뉘1뉴1느1늬1니1다1대1댜1댸1더1데1뎌1뎨1도1돠1돼1되1됴1두1둬1뒈1뒤1듀1드1듸1디1따1때1땨1떄1떠1떼1뗘1뗴1또1똬1뙈1뙤1뚀1뚜1뚸1뛔1뛰1뜌1뜨1띄1띠1라1래1랴1럐1러1레1려1례1로1롸1뢔1뢰1료1루1뤄1뤠1뤼1류1르1릐1리1마1매1먀1먜1머1메1며1몌1모1뫄1뫠1뫼1묘1무1뭐1뭬1뮈1뮤1므1믜1미1바1배1뱌1뱨1버1베1벼1볘1보1봐1봬1뵈1뵤1부1붜1붸1뷔1뷰1브1븨1비1빠1빼1뺘1뺴1뻐1뻬1뼈1뼤1뽀1뽜1뽸1뾔1뾰1뿌1뿨1쀄1쀠1쀼1쁘1쁴1삐1사1새1샤1섀1서1세1셔1셰1소1솨1쇄1쇠1쇼1수1숴1쉐1쉬1슈1스1싀1시1싸1쌔1쌰1썌1써1쎄1쎠1쎼1쏘1쏴1쐐1쐬1쑈1쑤1쒀1쒜1쒸1쓔1쓰1씌1씨1아1애1야1얘1어1에1여1예1오1와1왜1외1요1우1워1웨1위1유1으1의1이1자1재1쟈1쟤1저1제1져1졔1조1좌1좨1죄1죠1주1줘1줴1쥐1쥬1즈1즤1지1짜1째1쨔1쨰1쩌1쩨1쪄1쪠1쪼1쫘1쫴1쬐1쬬1쭈1쭤1쮀1쮜1쮸1쯔1쯰1찌1차1채1챠1챼1처1체1쳐1쳬1초1촤1쵀1최1쵸1추1춰1췌1취1츄1츠1츼1치1카1캐1캬1컈1커1케1켜1켸1코1콰1쾌1쾨1쿄1쿠1쿼1퀘1퀴1큐1크1킈1키1타1태1탸1턔1터1테1텨1톄1토1톼1퇘1퇴1툐1투1퉈1퉤1튀1튜1트1틔1티1파1패1퍄1퍠1퍼1페1펴1폐1포1퐈1퐤1푀1표1푸1풔1풰1퓌1퓨1프1픠1피1하1해1햐1햬1허1헤1혀1혜1호1화1홰1회1효1후1훠1훼1휘1휴1흐1희1히"