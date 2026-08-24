-- Napisati funkciju zavisnoY a b, čiji je tip zavisnoY :: Int -> Int -> [(Int, Int)] koja generiše listu parova celih brojeva (x, y), za koje x pripada segmentu [a, b], a y
-- pripada segmentu [x, b]

zavisnoY :: Int -> Int -> [(Int, Int)]
zavisnoY a b = [(x,y) | x <- [a..b], y <- [x..b]]
