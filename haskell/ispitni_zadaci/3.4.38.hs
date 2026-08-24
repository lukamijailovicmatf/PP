-- Napisati biblioteku funkcija za obradu stanja robe u magacinu.
-- 1. Definisati tip Artikal, koji se može konstruisati pomoću konstruktora (redom) NaStanju ili Rasprodat. Konstruktor NaStanju prima naziv proizvoda (tipa String) i količinu na
-- stanju (tipa Int), dok konstruktor Rasprodat prima samo naziv proizvoda (tipa String). Podrazumevano instancirati klase Eq i Ord za tip Artikal (artikli se porede prvo po
-- konstruktoru u redosledu definicije konstruktora, dakle NaStanju < Rasprodat, a zatim leksikografski po parametrima konstruktora).
-- 2. Instancirati klasu Show za tip Artikal u sledećem formatu:
-- NaStanju s k → s: k kom
-- Rasprodat s → s: rasprodato
-- 3. Implementirati funkciju pronadjiArtikal, čiji je tip pronadjiArtikal :: String -> [Artikal] -> Either String Int koja za dati naziv proizvoda pretražuje listu artikala. Ako
-- postoji vrednost oblika NaStanju naziv kolicina, vratiti Right kolicina. Ako postoji vrednost oblika Rasprodat naziv, vratiti Left "Rasprodat". Ukoliko se proizvod ne nalazi u
-- listi, vratiti Left "Nepostojeci artikal".
-- 4. Implementirati funkciju sortirajPoKolicini, čiji je tip sortirajPoKolicini :: [Artikal] -> [Artikal] koja sortira artikle rastuće po količini. Smatrati da artikli 
-- konstruisani pomoću Rasprodat imaju količinu jednaku nuli. U slučaju jednake količine koristiti podrazumevani poredak nad tipom Artikal.

import Data.List (sortBy)

data Artikal = NaStanju String Int
             | Rasprodat String
             deriving (Eq, Ord)
             
instance Show Artikal where
    show (NaStanju naziv kolicina) = naziv ++ ": " ++ show kolicina ++ " kom"
    show (Rasprodat naziv) = naziv ++ ": " ++ "rasprodato"
    
pronadjiArtikal :: String -> [Artikal] -> Either String Int
pronadjiArtikal _ [] = Left "Nepostojeci artikal"
pronadjiArtikal naziv (x:xs) = case x of
                                    NaStanju n k
                                        | n == naziv -> Right k
                                    Rasprodat n
                                        | n == naziv -> Left "Rasprodat"
                                    _ -> pronadjiArtikal naziv xs
                                    
sortirajPoKolicini :: [Artikal] -> [Artikal]
sortirajPoKolicini artikli = sortBy (\artikal1 artikal2 -> compare (kolicina artikal1) (kolicina artikal2) <> compare artikal1 artikal2) artikli

kolicina :: Artikal -> Int
kolicina (NaStanju naziv k) = k
kolicina (Rasprodat naziv) = 0
