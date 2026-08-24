-- Napisati funkciju parni n, čiji je tip parni :: Int -> [Int] koja prima pozitivan ceo broj n i pravi listu prvih n parnih prirodnih brojeva

-- I nacin
parni :: Int -> [Int]
parni n = take n (filter (\x -> x `mod` 2 == 0) [1..])


-- II nacin
parni' :: Int -> [Int]
parni' n = take n (filter even [1..])
