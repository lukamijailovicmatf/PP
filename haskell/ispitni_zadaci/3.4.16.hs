-- Napisati biblioteku funkcija koje pružaju korisniku podršku za rad sa prostim brojevima. 
-- Implementirati funkcije:
-- 1. delioci n, čiji je tip delioci :: Int -> [Int] koja vraća rastuće sortiranu listu pravih delilaca broja n;
-- 2. prost n, čiji je tip prost :: Int -> Bool koja vraća True ukoliko je n prost, a False inače;
-- 3. generisiProste n, čiji je tip generisiProste :: Int -> [Int] koja generiše proste brojeve u intervalu [2..n];
-- 4. sumaProstih a b, čiji je tip sumaProstih :: Int -> Int -> Int koja vraća sumu prostih brojeva u intervalu [a..b];
-- 5. faktori n, čiji je tip faktori :: Int -> [(Int, Int)] koja vraća listu uredjenih parova koji predstavjaju proste faktore broja n kao i broj njihovih ponavljanja.

delioci :: Int -> [Int]
delioci n = [x | x <- [2..n-1], n `mod` x == 0]

prost :: Int -> Bool
prost n = n > 1 && null (delioci n)

generisiProste :: Int -> [Int]
generisiProste n = filter prost [2..n]

sumaProstih :: Int -> Int -> Int
sumaProstih a b = sum (filter prost [a..b])

faktori :: Int -> [(Int, Int)]
faktori n = [(p, prebroj p n) | p <- generisiProste n, n `mod` p == 0]

prebroj p n
    | n `mod` p == 0 = 1 + prebroj p (n `div` p)
    | otherwise = 0
