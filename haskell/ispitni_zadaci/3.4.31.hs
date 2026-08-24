-- Napisati biblioteku funkcija za rad sa rezervacijama učionica. Svaka rezervacija je uredjena trojka (sala, početak, trajanje), tipa (String, Int, Int). Vrednost početak
-- predstavlja sat u kom rezervacija počinje, a trajanje broj sati koliko rezervacija traje. 
-- Implementirati:
-- 1. rezervacijeSale sala rezervacije, čiji je tip rezervacijeSale :: String -> [(String, Int, Int)] -> [(String, Int, Int)] koja iz liste rezervacije uklanja 
-- sve rezervacije koje nisu vezane za salu sala.
-- 2. ukupnoTrajanje rezervacije, čiji je tip ukupnoTrajanje :: [(String, Int, Int)] -> Int koja vraća ukupan broj sati zauzetosti sala.
-- 3. rasporedSala rezervacije, čiji je tip rasporedSala :: [(String, Int, Int)] -> [(String, [(Int, Int)])] koja grupiše rezervacije po salama. Rezultat je lista parova
-- (sala, [(početak, trajanje)]), sortirana rastuće po oznaci sale. Redosled rezervacija unutar svake sale odgovara redosledu pojavljivanja u ulaznoj listi.
-- 4. najzauzetijaSala rezervacije, čiji je tip najzauzetijaSala :: [(String, Int, Int)] -> Maybe String koja odreduje salu čije rezervacije imaju najveće ukupno
-- trajanje. Za praznu listu vratiti Nothing. Ako više sala ima isto najveće ukupno trajanje, vratiti leksikografski najmanju oznaku sale.
-- 5. kompresujRezervacije rezervacije, čiji je tip kompresujRezervacije :: [(String, Int, Int)] -> [(String, Int, Int, Int)] koja uzastopne identične rezervacije 
-- grupiše u četvorke oblika (sala, početak, trajanje, broj_ponavljanja).

import Data.List (sort, nub, sortBy, maximumBy, group)
import Data.Ord (comparing)

rezervacijeSale :: String -> [(String, Int, Int)] -> [(String, Int, Int)]
rezervacijeSale sala rezervacije = filter (\(s,p,t) -> sala == s) rezervacije

ukupnoTrajanje :: [(String, Int, Int)] -> Int
ukupnoTrajanje rezervacije = foldl (\acc (sala,pocetak,trajanje) -> acc + trajanje) 0 rezervacije

rasporedSala :: [(String, Int, Int)] -> [(String, [(Int, Int)])]
rasporedSala [] = []
rasporedSala rezervacije = [(sala, [(pocetak, trajanje) | (sala', pocetak, trajanje) <- rezervacije, sala' == sala]) | sala <- sort (nub [sala | (sala, _, _) <- rezervacije])]

najzauzetijaSala :: [(String, Int, Int)] -> Maybe String
najzauzetijaSala [] = Nothing
najzauzetijaSala rezervacije = Just imeNajzauzetije
    where grupisano = rasporedSala rezervacije
          zbirovi = izracunajZbirSnd grupisano
          (imeNajzauzetije, _) = maximumBy (comparing snd) zbirovi

izracunajZbirSnd :: [(String, [(Int, Int)])] -> [(String, Int)]
izracunajZbirSnd lst = map (\(oznaka, parovi) -> (oznaka, sum (map snd parovi))) lst

kompresujRezervacije :: [(String, Int, Int)] -> [(String, Int, Int, Int)]
kompresujRezervacije [] = []
kompresujRezervacije rezervacije = 
    let listaPodlistiSala = group (map (\p -> izvuciPrvi p) rezervacije)            -- npr. ["A1","A1","B1"] -> [["A1","A1"],["B1"]]
        listaPodlistiPocetaka = group (map (\p -> izvuciDrugi p) rezervacije)       -- npr. [8,8,10] -> [[8,8],[10]]
        listaPodlistiTrajanja = group (map (\p -> izvuciTreci p) rezervacije)       -- npr. -||-
        brojPonavljanja = map (\podlista -> length podlista) listaPodlistiSala      -- npr. [["A1","A1"],["B1"]] -> [2,1]
        sale = map (\podlista -> head podlista) listaPodlistiSala                   -- npr. [["A1","A1"],["B1"]] -> ["A1","B1"]
        poceci = map (\podlista -> head podlista) listaPodlistiPocetaka             -- npr. [[8,8],[10]] -> [8,10]
        trajanja = map (\podlista -> head podlista) listaPodlistiTrajanja           -- npr. -||-
    in zip4 sale poceci trajanja brojPonavljanja

izvuciPrvi :: (String, Int, Int) -> String
izvuciPrvi (x1, x2, x3) = x1

izvuciDrugi :: (String, Int, Int) -> Int
izvuciDrugi (x1, x2, x3) = x2

izvuciTreci :: (String, Int, Int) -> Int
izvuciTreci (x1, x2, x3) = x3

zip4 :: [String] -> [Int] -> [Int] -> [Int] -> [(String, Int, Int, Int)]
zip4 [] [] [] [] = []
zip4 (s:ss) (p:ps) (t:ts) (b:bs) = (s, p, t, b) : zip4 ss ps ts bs
