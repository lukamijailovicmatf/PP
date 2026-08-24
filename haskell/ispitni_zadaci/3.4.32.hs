-- Napisati biblioteku funkcija za rad sa terminima nastave i provera znanja. 
-- Implementirati:
-- 1. Tip Termin, koji se konstruiše konstruktorima Predavanje, Vezbe, Kolokvijum i Ispit. Svaki konstruktor prima oznaku sale tipa String i trajanje termina u satima tipa Int.
-- Podrazumevano instancirati klase Eq i Ord. Termini se porede redom Predavanje < Vezbe < Kolokvijum < Ispit; za iste konstruktore porede se oznaka sale, pa trajanje.
-- 2. Instancirati klasu Show za tip Termin. Termini se prikazuju u formatu "[PREDAVANJE] s th", "[VEZBE] s th", "[KOLOKVIJUM] s th" i "[ISPIT] s th".
-- 3. poslednjiIspit termini, čiji je tip poslednjiIspit :: [Termin] -> Maybe (String, Int) koja vraća salu i trajanje poslednjeg ispita nakon rastućeg sortiranja liste prema
-- poretku za tip Termin. Ako lista ne sadrži ispit, vratiti Nothing.
-- 4. sortirajPoTrajanju termini, čiji je tip sortirajPoTrajanju :: [Termin] -> [Termin] koja sortira termine rastuće po trajanju. Ako dva termina imaju isto trajanje, koristiti
-- podrazumevani poredak za tip Termin.

import Data.List (sort, sortBy)

data Termin = Predavanje String Int
            | Vezbe String Int
            | Kolokvijum String Int
            | Ispit String Int
            deriving (Eq, Ord)
            
instance Show Termin where
    show (Predavanje sala trajanje) = "[PREDAVANJE] " ++ sala ++ " " ++ show trajanje ++ "h"
    show (Vezbe sala trajanje) = "[VEZBE] " ++ sala ++ " " ++ show trajanje ++ "h"
    show (Kolokvijum sala trajanje) = "[KOLOKVIJUM] " ++ sala ++ " " ++ show trajanje ++ "h"
    show (Ispit sala trajanje) = "[ISPIT] " ++ sala ++ " " ++ show trajanje ++ "h"
    
poslednjiIspit :: [Termin] -> Maybe (String, Int)
poslednjiIspit termini = case [(sala, trajanje) | Ispit sala trajanje <- sort termini] of
                              [] -> Nothing
                              ispiti -> Just (last ispiti)
                              
sortirajPoTrajanju :: [Termin] -> [Termin]
sortirajPoTrajanju termini = sortBy (\t1 t2 -> compare (trajanjeTermina t1) (trajanjeTermina t2) <> compare t1 t2) termini

trajanjeTermina :: Termin -> Int
trajanjeTermina (Predavanje _ trajanje) = trajanje
trajanjeTermina (Vezbe _ trajanje) = trajanje
trajanjeTermina (Kolokvijum _ trajanje) = trajanje
trajanjeTermina (Ispit _ trajanje) = trajanje
