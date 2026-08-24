-- Napisati funkciju spoji l, čiji je tip spoji :: [[a]] -> [a] koja spaja listu listi istog tipa l u jednu listu

-- I nacin
spoji :: [[a]] -> [a]
spoji [] = []
spoji lista = [x | podlista <- lista, x <- podlista]


-- II nacin
spoji' :: [[a]] -> [a]
spoji' [] = []
spoji' (x:xs) = x ++ spoji' xs
