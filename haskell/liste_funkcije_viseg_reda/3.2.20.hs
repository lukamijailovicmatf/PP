-- Napisati funkciju izbaci k l, čiji je tip izbaci :: Int -> [a] -> [a] koja izbacuje k-ti element iz liste l. U slučaju da je zadata neispravna pozicija u listi, funkcija vraća
-- nepromenjenu listu

-- I nacin
izbaci :: Int -> [a] -> [a]
izbaci _ [] = []
izbaci k l = foldr (\(i,x) acc -> if i == k then acc else x:acc) [] (zip [0..] l)


-- II nacin
izbaci' :: Int -> [a] -> [a]
izbaci' _ [] = []
izbaci' k l = reverse (foldl (\acc (i,x) -> if i == k then acc else x:acc) [] (zip [0..] l))


-- III nacin
izbaci'' :: Int -> [a] -> [a]
izbaci'' _ [] = []
izbaci'' 0 (_:xs) = xs
izbaci'' k (x:xs) = x : (izbaci'' (k-1) xs)
