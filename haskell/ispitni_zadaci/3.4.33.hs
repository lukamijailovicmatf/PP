-- Napisati biblioteku funkcija za rad sa hemijskim elementima. Svaki element je uredjen par (simbol, atomski_broj), tipa (String, Int). 
-- Implementirati:
-- 1. odrediPeriode elementi, čiji je tip odrediPeriode :: [(String, Int)] -> [(String, Int)] koja za svaki element odreduje periodu na osnovu atomskog broja. Perioda je 1 za
-- atomske brojeve iz intervala [1, 2], 2 za [3, 10], 3 za [11, 18], 4 za [19, 36], 5 za [37, 54], 6 za [55, 86], a 7 za atomske brojeve veće ili jednake 87.
-- 2. brojRadioaktivnih elementi, čiji je tip brojRadioaktivnih :: [(String, Int)] -> Int koja vraća broj elemenata čiji je atomski broj veći ili jednak 83.
-- 3. grupisiPoPeriodi elementi, čiji je tip grupisiPoPeriodi :: [(String, Int)] -> [(Int, [String])] koja grupiše elemente po periodi. Rezultat je lista parova (perioda, simboli)
-- sortirana rastuće po periodi. Redosled simbola u svakoj grupi odgovara redosledu pojavljivanja u ulaznoj listi.
-- 4. najcescaPerioda elementi, čiji je tip najcescaPerioda :: [(String, Int)] -> Maybe Int koja odreduje periodu koja se pojavljuje najviše puta. Za praznu listu vratiti Nothing.
-- Ako više perioda ima isti maksimalan broj pojavljivanja, vratiti najmanju periodu.
-- 5. kompresuj elementi, čiji je tip kompresuj :: [(String, Int)] -> [(String, Int, Int)] koja uzastopne identične elemente grupiše u trojke oblika 
-- (simbol, atomski_broj, broj_ponavljanja).

import Data.List (sort, nub, group)

odrediPeriode :: [(String, Int)] -> [(String, Int)]
odrediPeriode elementi = map (\(simbol, atomskiBroj) -> (simbol, odrediPeriodu atomskiBroj)) elementi

odrediPeriodu :: Int -> Int
odrediPeriodu atomskiBroj
    | (atomskiBroj >= 1 && atomskiBroj <= 2) = 1
    | (atomskiBroj >= 3 && atomskiBroj <= 10) = 2
    | (atomskiBroj >= 11 && atomskiBroj <= 18) = 3
    | (atomskiBroj >= 19 && atomskiBroj <= 36) = 4
    | (atomskiBroj >= 37 && atomskiBroj <= 54) = 5
    | (atomskiBroj >= 55 && atomskiBroj <= 86) = 6
    | otherwise = 7
    
brojRadioaktivnih :: [(String, Int)] -> Int
brojRadioaktivnih elementi = foldl (\acc p -> if snd p >= 83 then acc + 1 else acc) 0 elementi

grupisiPoPeriodi :: [(String, Int)] -> [(Int, [String])]
grupisiPoPeriodi elementi = [(perioda, [simbol | (simbol, atomskiBroj) <- elementi, odrediPeriodu atomskiBroj == perioda])
                            | perioda <- sort (nub [odrediPeriodu atomskiBroj | (_, atomskiBroj) <- elementi])
                            ]
                            
najcescaPerioda :: [(String, Int)] -> Maybe Int
najcescaPerioda [] = Nothing
najcescaPerioda elementi = 
    let periodaElementiPeriode = grupisiPoPeriodi elementi
        periodaIBrojSimbola = [(perioda, length simboli) | (perioda, simboli) <- periodaElementiPeriode]
        maxBrojSimbola = maximum (map (\p -> snd p) periodaIBrojSimbola)
        listaMaybeVrednosti = map (\p -> if snd p == maxBrojSimbola then Just (fst p) else Nothing) periodaIBrojSimbola
        listaSamoJustVrednost = filter (\x -> x /= Nothing) listaMaybeVrednosti
    in head listaSamoJustVrednost
    
kompresuj :: [(String, Int)] -> [(String, Int, Int)]
kompresuj elementi = 
    let listaGrupisanihSimbola = group (map (\p -> fst p) elementi)
        listaGrupisanihAtomskihBrojeva = group (map (\p -> snd p) elementi)
        brojPonavljanja = map (\podlista -> length podlista) listaGrupisanihSimbola
        dekompresovanaListaSimbola = map (\podlista -> head podlista) listaGrupisanihSimbola
        dekompresovanaListaAtomskihBrojeva = map (\podlista -> head podlista) listaGrupisanihAtomskihBrojeva
    in zip3 dekompresovanaListaSimbola dekompresovanaListaAtomskihBrojeva brojPonavljanja
