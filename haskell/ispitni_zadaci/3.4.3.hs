-- Napisati biblioteku dodatnih funkcija za rad sa listama. Implementirati funkcije:
-- 1. funkciju maxl lst, čiji je tip maxl :: Ord a => [a] -> a koja vraća maksimalni element neprazne liste lst;
-- 2. funkciju ind x lst, čiji je tip ind :: Eq a => [a] -> a -> Int koja vraća indeks elementa x u listi lst (indeks se broji od 1), a inače −1 ukoliko 
-- se x ne nalazi u listi lst;
-- 3. funkciju presek lst1 lst2, čiji je tip presek :: Eq a => [a] -> [a] -> [a] koja vraća presek dve liste (listu elemenata koji se nalaze u obe liste), pritom u 
-- listama nema ponavljanja elemenata;
-- 4. funkciju umetni lst x, čiji je tip umetni :: [a] -> a -> [a] koja umeće element x izmedu svaka dva elementa liste lst.

maxl :: Ord a => [a] -> a
maxl lst = foldl1 max lst       -- maxl lst = foldl max (head lst) lst

ind :: Eq a => [a] -> a -> Int
ind lst x = case lookup True (zip (map (== x) lst) [1..]) of
                 Just i -> i
                 Nothing -> -1
                 
presek :: Eq a => [a] -> [a] -> [a]
presek lst1 lst2 = filter (`elem` lst2) lst1        -- presek lst1 lst2 = filter (\x -> x `elem` lst2) lst1

umetni :: [a] -> a -> [a]
umetni [] _ = []
umetni [x] _ = [x]
umetni (x:xs) y = x : y : umetni xs y 
