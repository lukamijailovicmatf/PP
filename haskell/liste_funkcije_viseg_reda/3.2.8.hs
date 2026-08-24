-- Napisati funkciju savrseni n, čiji je tip savrseni :: Int -> [Int] koja pravi listu savršenih brojeva manjih od n. Broj n je savršen ukoliko je jednak sumi svojih faktora
-- (delilaca) manjih od n

savrseni :: Int -> [Int]
savrseni n = [x | x <- [1..n-1], sum (faktori x) == x]
    where faktori x = [i | i <- [1..x-1], x `mod` i == 0]
