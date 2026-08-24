-- Napisati funkciju sumaPrvihN n, čiji je tip sumaPrvihN :: Int -> Int koja prima pozitivan ceo broj n i vraća sumu prvih n prirodnih brojeva

-- I nacin
sumaPrvihN :: Int -> Int
sumaPrvihN n = 
    if n == 0 then 0
    else n + sumaPrvihN (n - 1)
    
    
-- II nacin
sumaPrvihN' :: Int -> Int
sumaPrvihN' n
    | n == 0 = 0
    | otherwise = n + sumaPrvihN' (n - 1)
    

-- III nacin
sumaPrvihN'' :: Int -> Int
sumaPrvihN'' n = sum [1..n]
