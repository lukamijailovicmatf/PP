-- Napisati funkciju nadovezi n l1 l2, čiji je tip nadovezi :: Int -> [a] -> [a] -> [a] koja prima pozitivan ceo broj n i n puta nadovezuje listu l2 na listu l1

nadovezi :: Int -> [a] -> [a] -> [a]
nadovezi n l1 l2 = l1 ++ rep
    where rep = concat (replicate n l2)
