-- Napisati biblioteku funkcija koje pružaju podršku za obradu predatih seminarskih radova. Svaki zapis o predatom seminarskom radu je uredjena trojka (student, poeni, kasnjenje),
-- tipa (String, Int, Int), gde su poeni nenegativan ceo broj, a kasnjenje broj dana kašnjenja. 
-- Implementirati:
-- 1. validniSeminarskiRadovi maxKasnjenje radovi, čiji je tip validniSeminarskiRadovi :: Int -> [(String, Int, Int)] -> [(String, Int)] koja zadržava u listi samo one radove čije
-- kašnjenje nije veće od maxKasnjenje. Za svaki zadržani rad umanjiti poene za dva poena po danu kašnjenja, ali ne ispod nule. Rezultat treba da sadrži parove
-- (student, noviPoeni).
-- 2. ukupnoPoenaBezKasnjenja radovi, čiji je tip ukupnoPoenaBezKasnjenja :: [(String, Int, Int)] -> Int koja vraća ukupan broj poena samo iz radova bez kašnjenja.
-- 3. poeniPoStudentu radovi, čiji je tip poeniPoStudentu :: [(String, Int, Int)] -> [(String, Int)] koja za svakog studenta računa ukupan broj poena. Rezultat
-- treba da bude sortiran leksikografski po imenu studenta.
-- 4. najboljiStudent radovi, čiji je tip najboljiStudent :: [(String, Int, Int)] -> Maybe String koja vraća ime studenta sa najvećim ukupnim brojem poena,
-- ako takav postoji. Ako više studenata ima isti broj poena, vratiti leksikografski najmanje ime.
-- 5. kompresujSeminarskeRadove radovi, čiji je tip kompresujSeminarskeRadove :: [(String, Int, Int)] -> [(String, Int, Int, Int)] koja uzastopne identične zapise o seminarskim
-- radovima grupiše u četvorke (student, poeni, kasnjenje, brojPonavljanja).

import Data.List (sort, groupBy, group)

validniSeminarskiRadovi :: Int -> [(String, Int, Int)] -> [(String, Int)]
validniSeminarskiRadovi maxKasnjenje radovi = 
    let zadovoljavajuKasnjenje = filter (\(ime, poeni, kasnjenje) -> kasnjenje <= maxKasnjenje) radovi
    in map (\(ime, poeni, kasnjenje) -> if (poeni >= 2 * kasnjenje) then (ime, poeni - 2 * kasnjenje) else (ime, poeni)) zadovoljavajuKasnjenje
    
ukupnoPoenaBezKasnjenja :: [(String, Int, Int)] -> Int
ukupnoPoenaBezKasnjenja radovi = 
    let radoviBezKasnjenja = filter (\(ime, poeni, kasnjenje) -> kasnjenje == 0) radovi
    in foldl (\acc (ime, poeni, kasnjenje) -> acc + poeni) 0 radoviBezKasnjenja
    
poeniPoStudentu :: [(String, Int, Int)] -> [(String, Int)]
poeniPoStudentu radovi = 
    let sortiraniRadovi = sort radovi
        grupisaniPoImenu = groupBy (\(ime1, poeni1, kasnjenje1) (ime2, poeni2, kasnjenje2) -> ime1 == ime2) sortiraniRadovi
        listaPoena = map (\podlista -> foldl (\acc (ime, poeni, kasnjenje) -> acc + poeni) 0 podlista) grupisaniPoImenu
        listaParovaStudenata = map (\podlista -> head podlista) grupisaniPoImenu
        listaImenaStudenata = map (\(ime, poeni, kasnjenje) -> ime) listaParovaStudenata
    in zip listaImenaStudenata listaPoena
    
najboljiStudent :: [(String, Int, Int)] -> Maybe String
najboljiStudent [] = Nothing
najboljiStudent radovi = 
    let poeni = poeniPoStudentu radovi
        maxPoeni = maximum [zbirPoena | (ime, zbirPoena) <- poeni]
        najboljiStudenti = [student | (student, zbir) <- poeni, zbir == maxPoeni]
    in Just (minimum najboljiStudenti)
    
kompresujSeminarskeRadove :: [(String, Int, Int)] -> [(String, Int, Int, Int)]
kompresujSeminarskeRadove [] = []
kompresujSeminarskeRadove radovi = 
    let listaGrupisanihStudenata = group radovi                                 -- [("Ana",20,0),("Ana",20,0),("Marko",15,2)] -> [[("Ana",20,0),("Ana",20,0)],[("Marko",15,2)]]
        brojPonavljanja = map (\podlista -> length podlista) listaGrupisanihStudenata      -- [[("Ana",20,0),("Ana",20,0)],[("Marko",15,2)]] -> [2,1]
        kompresovanaImena = map (\podlista -> map (\(ime, _, _) -> ime) podlista) listaGrupisanihStudenata
        kompresovaniPoeni = map (\podlista -> map (\(_, poeni, _) -> poeni) podlista) listaGrupisanihStudenata
        kompresovanaKasnjenja = map (\podlista -> map (\(_, _, kasnjenja) -> kasnjenja) podlista) listaGrupisanihStudenata
        dekompresovanaImena = map (\podlista -> head podlista) kompresovanaImena    -- [["Ana","Ana"],["Marko"]] -> ["Ana","Marko"]
        dekompresovaniPoeni = map (\podlista -> head podlista) kompresovaniPoeni    --  [[20,20],[15]] -> [20,15]
        dekompresovanaKasnjenja = map (\podlista -> head podlista) kompresovanaKasnjenja    -- [[("Ana",20,0),("Ana",20,0)],[("Marko",15,2)]] -> [[0,0],[2]]
    in zip4 dekompresovanaImena dekompresovaniPoeni dekompresovanaKasnjenja brojPonavljanja
    
zip4 :: [String] -> [Int] -> [Int] -> [Int] -> [(String, Int, Int, Int)]
zip4 [] [] [] [] = []
zip4 (s:ss) (p:ps) (k:ks) (b:bs) = (s, p, k, b) : zip4 ss ps ks bs
