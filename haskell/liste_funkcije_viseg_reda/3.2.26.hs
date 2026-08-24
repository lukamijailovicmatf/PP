-- Napisati funkciju broj lista, čiji je tip broj :: [Int] -> Int koja vraća broj odreden ciframa koje se nalaze u listi čitajući ih sa početka ka kraju liste i funkciju broj’
-- lista, čiji je tip broj’ :: [Int] -> Int koja vraća broj odreden ciframa koje se nalaze u listi čitajući ih sa kraja ka početku liste


broj' :: [Int] -> Int
broj' [] = 0
broj' (x:xs) = (broj' xs) * 10 + x


-- I nacin
broj :: [Int] -> Int
broj [] = 0
broj lista = broj' (reverse lista)


-- II nacin
broj'' :: [Int] -> Int
broj'' [] = 0
broj'' (x:xs) = x * 10 ^ (length xs) + broj'' xs
