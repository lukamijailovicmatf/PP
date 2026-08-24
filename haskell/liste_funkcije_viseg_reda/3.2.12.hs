-- Nakon još jedne košarkaške sezone, potrebno je sumirati rezultate svih igrača. Svaki igrač ima jedinstveni redni broj, pod kojim se u bazi, u listi prezimena, čuva njegovo
-- prezime, a u listi pogodaka, ostvaren broj poena u sezoni. Uparivanjem odgovarajućih podataka, napraviti za svakog igrača jedinstveni par oblika (prezime, poeni).
-- Napisati funkciju parOdListi lista1 lista2, čiji je tip parOdListi :: [String] -> [Int] -> [(String, Int)] koja pravi listu parova od dve liste, liste prezimena i liste
-- pogodaka, tako da prvi element svakog para bude iz prve liste, a drugi element svakog para bude iz druge liste

-- I nacin
parOdListi :: [String] -> [Int] -> [(String, Int)]
parOdListi [] _ = []
parOdListi _ [] = []
parOdListi (x:xs) (y:ys) = (x,y) : (parOdListi xs ys)


-- II nacin
parOdListi' :: [String] -> [Int] -> [(String, Int)]
parOdListi' l1 l2 = zip l1 l2
