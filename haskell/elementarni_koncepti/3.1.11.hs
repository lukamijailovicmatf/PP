-- Napisati funkciju delioci n, čiji je tip delioci :: Int -> [Int] koja pravi listu svih pravih delioca pozitivnog celog broja n

-- I nacin
delioci :: Int -> [Int]
delioci n
    | n == 1 = [1]
    | otherwise = delioci' n 2
    where delioci' n k
            | k == n = []
            | n `mod` k == 0 = [k] ++ (delioci' n (k + 1))
            | otherwise = delioci' n (k + 1)
            
            
-- II nacin
delioci' :: Int -> [Int]
delioci' n = [k | k <- [2..n-1], n `mod` k == 0]
