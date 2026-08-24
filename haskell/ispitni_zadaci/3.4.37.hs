-- Napisati biblioteku funkcija za obradu stanja robe u magacinu. Stanje magacina predstavlja se listom uredjenih parova (proizvod, kolicina), tipa [(String, Int)].
-- 1. Implementirati funkciju ukupnoArtikala čiji je tip ukupnoArtikala :: [(String, Int)] -> Int. Funkcija prima kao argument artikli i vraća ukupan broj artikala čija je
-- količina strogo veća od nule.
-- 2. Implementirati funkciju azurirajKolicinu, čiji je tip azurirajKolicinu :: String -> Int -> [(String, Int)] -> [(String, Int)]. Funkcija prima kao argumente proizvod promena
-- artikli i uvećava količinu zadatog proizvoda za vrednost promena. Ako proizvod ne postoji u stanju stanje, dodati ga samo ako je promena strogo pozitivna. Posle izmene ukloniti
-- proizvode čija količina nije strogo pozitivna. Rezultat treba da bude sortiran leksikografski po nazivu proizvoda.
-- 3. Implementirati funkciju proizvodiNaStanju, čiji je tip proizvodiNaStanju :: [(String, Int)] -> [String]. Funkcija prima kao argument artikle i vraća nazive proizvoda
-- čija je količina strogo veća od nule, sortirane leksikografski.
-- 4. Implementirati funkciju nedostajuciProizvodi, čiji je tip nedostajuciProizvodi :: [String] -> [(String, Int)] -> [String]. Funkcija prima kao argumente trazeni artikli i
-- vraća proizvode iz liste trazeni koji ne postoje u magacinu ili im je količina jednaka nuli. Redosled rezultata treba da prati redosled iz liste trazeni.
-- 5. Implementirati funkciju najzastupljeniji, čiji je tip najzastupljeniji :: [(String, Int)] -> Maybe String. Funkcija prima kao argument artikli i vraća proizvod sa najvećom
-- količinom. Za praznu listu vratiti Nothing. Ako više proizvoda ima istu količinu, vratiti leksikografski najmanji naziv.

import Data.List (sort)

ukupnoArtikala :: [(String, Int)] -> Int
ukupnoArtikala artikli = foldl (\acc artikal -> if snd artikal >= 0 then acc + snd artikal else acc) 0 artikli

azurirajKolicinu :: String -> Int -> [(String, Int)] -> [(String, Int)]
azurirajKolicinu proizvod promena artikli = 
    let izmenjeniProizvodi = if (any (\p -> fst p == proizvod) artikli) then (map (\p -> if fst p == proizvod then (fst p, snd p + promena) else (fst p, snd p)) artikli) 
        else ((proizvod, promena) : artikli)
        strogoPozitivnaKolicina = filter (\p -> snd p > 0) izmenjeniProizvodi
    in sort strogoPozitivnaKolicina
    
proizvodiNaStanju :: [(String, Int)] -> [String]
proizvodiNaStanju artikli = 
    let jesuNaStanju = filter (\p -> snd p > 0) artikli
        naziviDostupnih = map (\p -> fst p) jesuNaStanju
    in sort naziviDostupnih
    
nedostajuciProizvodi :: [String] -> [(String, Int)] -> [String]
nedostajuciProizvodi trazeni artikli = 
    let naStanju proizvod = any (\p -> fst p == proizvod && snd p > 0) artikli
    in filter (\p -> not (naStanju p)) trazeni
    
najzastupljeniji :: [(String, Int)] -> Maybe String
najzastupljeniji [] = Nothing
najzastupljeniji artikli = 
    let maxKolicina = maximum (map (\p -> snd p) artikli)
        najzastupljenijiProizvodi = [proizvod | (proizvod, kolicina) <- artikli, kolicina == maxKolicina]
    in Just (minimum najzastupljenijiProizvodi)
