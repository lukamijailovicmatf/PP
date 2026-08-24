-- Napisati biblioteku funkcija za rad sa log porukama. Svaka log poruka se predstavlja uredjenim parom (tip_poruke, poruka), tipa (Int, String). Tip poruke može biti debug
-- (vrednost 0), info (vrednost 1), warn (vrednost 2), ili error (vrednost 3). Implementirati:
-- 1. izdvojNivo n poruke, čiji je tip izdvojNivo :: Int -> [(Int, String)] -> [(Int, String)] koja iz liste poruke uklanja sve poruke nivoa različitog od n.
-- 2. brojGresaka poruke, čiji je tip brojGresaka :: [(Int, String)] -> Int koja vraća broj poruka koje predstavljaju greške
-- 3. grupisi poruke, čiji je tip grupisi :: [(Int, String)] -> [(Int, [String])] koja grupiše poruke istog nivoa. Rezultat je lista parova (nivo, poruke) sortirana rastuće po
-- nivou. Redosled poruka u okviru jednog nivoa odgovara redosledu njihovog pojavljivanja u ulaznoj listi
-- 4. najcesciNivo poruke, čiji je tip najcesciNivo :: [(Int, String)] -> Maybe Int koja odreduje nivo poruke koji se pojavljuje najviše puta. Za praznu listu vratiti Nothing. 
-- Ako više nivoa ima isti maksimalan broj pojavljivanja, vratiti najmanji nivo.
-- 5. kompresuj poruke, čiji je tip kompresuj :: [(Int, String)] -> [(Int, String, Int)] koja uzastopne identične poruke grupiše u trojke oblika (nivo, sadržaj, broj_ponavljanja).

import Data.List (sort, nub, group)

izdvojNivo :: Int -> [(Int, String)] -> [(Int, String)]
izdvojNivo n poruke = filter (\p -> fst p == n) poruke

brojGresaka :: [(Int, String)] -> Int
brojGresaka poruke = 
    let listaPorukaGreske = filter (\p -> fst p == 3) poruke
    in length listaPorukaGreske
    
grupisi :: [(Int, String)] -> [(Int, [String])]
grupisi poruke = [(nivo, [poruka | (nivo', poruka) <- poruke, nivo' == nivo]) | nivo <- sort (nub [nivo | (nivo, _) <- poruke])]

najcesciNivo :: [(Int, String)] -> Maybe Int
najcesciNivo [] = Nothing
najcesciNivo poruke = 
    let grupe = grupisi poruke          -- npr. [(0,"a"), (3,"x"), (3,"y"), (1,"z")] -> [(0, ["a"]), (3, ["x", "y"]), (1, ["z"])]
        nivoIBrojPoruka = [(nivo, length porukeNivoa) | (nivo, porukeNivoa) <- grupe]           -- npr. [(0,1), (3,2), (1,1)]
        maxBrojPoruka = maximum (map (\p -> snd p) nivoIBrojPoruka)             -- npr. (3,2) -> 2
        listaMaybeVrednosti = map (\p -> if snd p == maxBrojPoruka then Just (fst p) else Nothing) nivoIBrojPoruka      -- [Nothing, Just 3, Nothing]
        listaSamoJustVrednost = filter (\x -> x /= Nothing) listaMaybeVrednosti          -- [Just 3]
    in head listaSamoJustVrednost           -- Just 3
    
kompresuj :: [(Int, String)] -> [(Int, String, Int)]
kompresuj [] = []
kompresuj poruke = 
    let listaPodlistiNivoa = group (map (\p -> fst p) poruke)       -- npr. [(1,"ok"),(1,"ok"),(3,"fail"),(3,"fail"),(3,"fail")] -> [[1,1],[3,3,3]]
        listaPodlistiPoruka = group (map (\p -> snd p) poruke)      -- npr. [(1,"ok"),(1,"ok"),(3,"fail"),(3,"fail"),(3,"fail")] -> [["ok","ok"],["fail","fail","fail"]]
        duzinaPodlistiNivoa = map (\podlista -> length podlista) listaPodlistiNivoa       -- npr. [[1,1],[3,3,3]] -> [2,3]
        duzinaPodlistiPoruka = map (\podlista -> length podlista) listaPodlistiPoruka     -- npr. [["ok","ok"],["fail","fail","fail"]] -> [2,3]
        dekompresovanaListaPodlistiNivoa = map (\podlista -> head podlista) listaPodlistiNivoa      -- npr. [[1,1],[3,3,3]] -> [1,3]
        dekompresovanaListaPodlistiPoruka = map (\podlista -> head podlista) listaPodlistiPoruka    -- npr. [["ok","ok"],["fail","fail","fail"]] -> ["ok","fail"]
    in zip3 dekompresovanaListaPodlistiNivoa dekompresovanaListaPodlistiPoruka duzinaPodlistiNivoa
