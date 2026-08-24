-- Napisati funkciju lista a b, čiji je tip lista :: Int -> Int -> [Int] koja pravi listu celih brojeva iz segmenta [a, b]. U slučaju da granice segmenta nisu ispravne, 
-- rezultat je prazna lista

lista :: Int -> Int -> [Int]
lista a b = [a..b]
