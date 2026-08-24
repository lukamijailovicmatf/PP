-- Napisati biblioteku koja pruža dodatne operacije za rad sa listama:
-- 1. funkciju takeCycled n lst, čiji je tip takeCycled :: Int -> [a] -> [a] koja vraća prvih n elemenata liste dobijene cikličnim ponavljanjem liste lst;
-- 2. funkciju dropUntil p lst, čiji je tip dropUntil :: (a -> Bool) -> [a] -> [a] koja uklanja elemente sa početka liste sve dok se ne zadovolji predikat p;
-- 3. funkciju sumLst lst, čiji je tip sumLst :: Num a => [a] -> a koja vraća sumu liste lst bez korišćenja rekurzije;
-- 4. funkciju split sep str, čiji je tip split :: Char -> String -> [String] koja vraća listu podniski niske str razdvojene na mestima pojavljivanja karaktera (separatora) sep;
-- 5. funkciju join sep lst, čiji je tip join :: String -> [String] -> [String] koja vraća nisku dobijenu nadovezivanjem niski iz liste lst sa separatorom sep umetnutim izmedu
-- svaka dva elementa (inverz split funkcije).

takeCycled :: Int -> [a] -> [a]
takeCycled _ [] = []
takeCycled n lst = take n (cycle lst)

dropUntil :: (a -> Bool) -> [a] -> [a]
dropUntil _ [] = []
dropUntil p (x:xs)
    | p x = x:xs
    | otherwise = dropUntil p xs
    
sumLst :: Num a => [a] -> a
sumLst lst = foldl (+) 0 lst

split :: Char -> String -> [String]
split _ "" = [""]
split sep (c:cs)
    | c == sep = "" : rest
    | otherwise = (c : head rest) : tail rest
    where
        rest = split sep cs
        
join :: String -> [String] -> String
join _ [] = ""
join _ [x] = x
join sep (x:xs) = x ++ sep ++ join sep xs
