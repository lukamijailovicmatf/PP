-- Napisati funkciju brojDelilaca n, čiji je tip brojDelilaca :: Int -> Int koja prima pozitivan ceo broj n i vraća broj pravih delilaca broja n

brojDelilaca :: Int -> Int
brojDelilaca n = length [x | x <- [2..n-1], n `mod` x == 0]
