-- Napisati predikat prost n, čiji je tip prost :: Integer -> Bool koji testira da li je pozitivan ceo broj n prost

-- I nacin
prost :: Integer -> Bool
prost n = prostTest n 2
    where prostTest n k
            | n == 1 = False
            | n == k = True
            | n `mod` k == 0 = False
            | otherwise = prostTest n (k + 1)
           
           
-- II nacin
prost' :: Integer -> Bool
prost' n = null (listaDelilaca n)
    where listaDelilaca n = [x | x <- [2..n-1], n `mod` x == 0]
