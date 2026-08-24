-- Napisati biblioteku za pomoć asistentima u arhiviranju i održavanju rezultata ispita. Definisati tipove StepenStudija (osnovne, master, doktorske), Student (karakterisan brojem
-- indeksa, imenom, prezimenom i stepenom studija) i Rezultat (svaki student ima opcioni rezultat predstavljen brojem poena). Obezbediti da se student može ispisati na standardni
-- izlaz i porediti po jednakosti sa ostalim studentima po broju indeksa. 
-- Implementirati funkcije:
-- 1. rezultati studenti, koja konstruiše listu rezultata za date studente, gde je svaki rezultat trenutno prazan,
-- 2. poeni student rezultati, koja vraća broj poena datog studenta iz liste rezultata ili poruku ako se student ne nalazi u istoj,
-- 3. ponisti student rezultati, koja poništava poene za datog studenta iz liste rezultata,
-- 4. ponistiSve rezultati, koja poništava poene za sve studente iz liste rezultata,
-- 5. studije stepenStudija rezultati, koja vraća samo one rezultate za studente sa datog stepena studija,
-- 6. polozeni rezultati, koja vraća samo one rezultate gde je student položio ispit
-- 7. upisi student poeni rezultati, koja upisuje novi rezultat za datog studenta u listu rezultata,
-- 8. najboljih n rezultati, koja vraća n najboljih rezultata (samo broj poena) iz liste rezultata, sortiranih opadajuće

import Data.Maybe
import Data.List as List

data StepenStudija = Osnovne
                   | Master
                   | Doktorske
                   deriving (Eq)
                   
data Student = MkStudent { indeks :: String,
                           ime :: String,
                           prezime :: String,
                           stepen :: StepenStudija
                         }
                         
type Rezultat = (Student, Maybe Int)

instance Show Student where
    show = formatirajStudenta
    
formatirajStudenta :: Student -> String
formatirajStudenta s =
    let indeksStudenta = indeks s
        imePrezimeStudenta = (ime s) ++ " " ++ (prezime s)
    in indeksStudenta ++ " : " ++ imePrezimeStudenta
    
instance Eq Student where
    s1 == s2 = (indeks s1) == (indeks s2)
    
rezultati :: [Student] -> [Rezultat]
rezultati studenti = map (\s -> (s, Nothing)) studenti

poeni :: Student -> [Rezultat] -> Either String (Maybe Int)
poeni student rezultati = 
    case mi of Nothing -> Left (indeks student ++ " ne studira na fakultetu!")
               (Just i) -> Right (snd (rezultati !! i))
    where mi = List.elemIndex student (map fst rezultati)
    
ponisti :: Student -> [Rezultat] -> [Rezultat]
ponisti student rezultati = foldr azuriraj [] rezultati
    where azuriraj rez acc = if (fst rez) == student then (student, Nothing) : acc else rez : acc
        
ponistiSve :: [Rezultat] -> [Rezultat]
ponistiSve rezultati = map (\rez -> (fst rez, Nothing)) rezultati

studije :: StepenStudija -> [Rezultat] -> [Rezultat]
studije stepenStudija rezultati = filter (\(student,_) -> stepen student == stepenStudija) rezultati

polozeni :: [Rezultat] -> [Rezultat]
polozeni rezultati = filter (\(student, mozdaRez) -> (izvuciRez mozdaRez) > 50) rezultati
    where izvuciRez Nothing = 0
          izvuciRez (Just rez) = rez
          
upisi :: Student -> Int -> [Rezultat] -> [Rezultat]
upisi student poeni rezultati = if elem student studenti
                                then foldr azuriraj [] rezultati
                                else (student, Just poeni) : rezultati
    where studenti = map fst rezultati
          azuriraj rez acc = if (fst rez == student) then (student, Just poeni) : acc else rez : acc
          
najboljih :: Int -> [Rezultat] -> [Int]
najboljih n rezultati = take n
                      $ List.sortBy (flip compare)    -- List.sortBy (\_ _ -> GT)
                      $ map (\(Just x) -> x)
                      $ filter (/= Nothing)
                      $ map snd
                      $ rezultati
