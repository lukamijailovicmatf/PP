-- Napisati biblioteku funkcija koje pružaju podršku za obradu predatih seminarskih radova.
-- 1. Definisati tip SeminarskiRad, koji se konstruiše konstruktorima PredatNaVreme i PredatSaKasnjenjem. Konstruktor PredatNaVreme prima ime studenta tipa String i broj poena
-- tipa Int. Konstruktor PredatSaKasnjenjem prima ime studenta tipa String, broj poena tipa Int i broj dana kašnjenja tipa Int. Podrazumevano instancirati klase Eq i Ord.
-- 2. Instancirati klasu Show za tip SeminarskiRad. Radovi se prikazuju u formatima "ime: p poena" i "ime: p poena (k dana kasnjenja)".
-- 3. najslabijiSeminarskiRad radovi, čiji je tip najslabijiSeminarskiRad :: [SeminarskiRad] -> Maybe String koja vraća ime studenta čiji seminarski rad ima najmanji
-- efektivni broj poena. Efektivni broj poena za radove predate sa kašnjenjem dobija se oduzimanjem dva poena za svaki dan kašnjenja, pri čemu rezultat ne može biti manji od nule.
-- Za praznu listu vratiti Nothing. Ako više studenata ima isti efektivni broj poena, vratiti leksikografski najmanje ime.
-- 4. sortirajRadovePoEfektivnimPoenima radovi, čiji je tip sortirajRadovePoEfektivnimPoenima :: [SeminarskiRad] -> [SeminarskiRad] koja sortira radove rastuće po efektivnom broju
-- poena. Efektivni broj poena za radove predate sa kašnjenjem dobija se oduzimanjem dva poena za svaki dan kašnjenja, pri čemu rezultat ne može biti manji od nule. Ako dva rada
-- imaju isti efektivni broj poena, koristiti podrazumevani poredak za tip SeminarskiRad.

import Data.List (sortBy)

data SeminarskiRad = PredatNaVreme String Int
                   | PredatSaKasnjenjem String Int Int
                   deriving (Eq, Ord)

instance Show SeminarskiRad where
    show (PredatNaVreme ime poeni) = ime ++ ": " ++ show poeni ++ " poena"
    show (PredatSaKasnjenjem ime poeni kasnjenje) = ime ++ ": " ++ show poeni ++ " poena " ++ "(" ++ show kasnjenje ++ " dana kasnjenja)"
    
najslabijiSeminarskiRad :: [SeminarskiRad] -> Maybe String
najslabijiSeminarskiRad [] = Nothing
najslabijiSeminarskiRad (r:rs) = Just (imeStudenta (najslabiji r rs))
    where najslabiji rad [] = rad
          najslabiji rad (x:xs)
                | efektivniPoeni x < efektivniPoeni rad = najslabiji x xs
                | efektivniPoeni x == efektivniPoeni rad && imeStudenta x < imeStudenta rad = najslabiji x xs
                | otherwise = najslabiji rad xs
                
imeStudenta :: SeminarskiRad -> String
imeStudenta (PredatNaVreme ime poeni) = ime
imeStudenta (PredatSaKasnjenjem ime poeni kasnjenje) = ime

efektivniPoeni :: SeminarskiRad -> Int
efektivniPoeni (PredatNaVreme ime poeni) = poeni
efektivniPoeni (PredatSaKasnjenjem ime poeni kasnjenje) = max 0 (poeni - 2 * kasnjenje)

sortirajRadovePoEfektivnimPoenima :: [SeminarskiRad] -> [SeminarskiRad]
sortirajRadovePoEfektivnimPoenima radovi = sortBy (\r1 r2 -> compare (efektivniPoeni r1) (efektivniPoeni r2) <> compare r1 r2) radovi
