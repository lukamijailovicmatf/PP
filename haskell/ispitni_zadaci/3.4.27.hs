-- Kreirati tip podataka Student koji se može konstruisati putem konstruktora MkStudent i sadrži dva atributa ime (String) i poeni (Int), kao i funkcije ime i poeni koje
-- omogućavaju pristup poljima ime i poeni. Za kreirani tip instancirati klasu Show (podrazumevano) i klasu Ord tako da se studenti porede po broju ostvarenih poena.
-- Implementirati funkcije:
-- 1. rangLista :: [Student] -> [Student] koja na ulazu dobija listu studenata i sortira je opadajuće po broju poena koje je student ostvario na ispitu.
-- 2. poeniStudenata :: [Student] -> [(String, Maybe Int)] koja na ulazu dobija listu studenata i za svakog od njih u slučaju položenog ispita vraća ime i poene, 
-- a inače ime i praznu vrednost.

import Data.List (sortBy)

data Student = MkStudent { ime :: String,
                           poeni :: Int
                         } deriving (Show)
                         
instance Eq Student where
    (MkStudent _ poeni1) == (MkStudent _ poeni2) = poeni1 == poeni2
                         
instance Ord Student where
    compare (MkStudent _ poeni1) (MkStudent _ poeni2) = compare poeni1 poeni2
    
rangLista :: [Student] -> [Student]
rangLista lst = reverse (sortBy compare lst)

poeniStudenata :: [Student] -> [(String, Maybe Int)]
poeniStudenata lst = map (\s -> if poeni s >= 51 then (ime s, Just (poeni s)) else (ime s, Nothing)) lst
