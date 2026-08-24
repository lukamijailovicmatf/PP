-- Napisati funkciju nzd a b, čiji je tip nzd :: Int -> Int -> Int koja prima pozitivne cele brojeve a i b i računa najveći zajednički delilac brojeva a i b 
-- (koristiti Euklidov algoritam)

nzd :: Int -> Int -> Int
nzd a b
    | b == 0 = a
    | otherwise = nzd b (a `mod` b)
