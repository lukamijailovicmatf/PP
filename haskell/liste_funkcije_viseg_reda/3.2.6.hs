-- Napisati funkciju harm n, čiji je tip harm :: Int -> [Double] koja prima pozitivan ceo broj n i pravi listu prvih n elemenata harmonijskog reda

-- Harmonijski red: 1 + 1/2 + 1/3 + 1/4 + ...
harm :: Int -> [Double]
harm n = [1 / fromIntegral k | k <- [1..n]]
