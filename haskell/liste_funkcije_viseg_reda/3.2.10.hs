-- Napisati funkciju zbirPar n, čiji je tip zbirPar :: Int -> [(Int, Int)] koja pravi listu parova (a, b) takvih da su a i b prirodni brojevi čiji je zbir jednak n

-- I nacin
zbirPar :: Int -> [(Int, Int)]
zbirPar n = [(a,b) | a <- [1..n], b <- [1..n], a + b == n]


-- II nacin
zbirPar' :: Int -> [(Int, Int)]
zbirPar' n = [(a,b) | a <- [1..n], b <- [n-a], b /= 0]
