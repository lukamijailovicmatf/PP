-- Napisati funkciju sufiksi l, čiji je tip sufiksi :: [a] -> [[a]] koja pravi listu svih sufiksa liste l

sufiksi :: [a] -> [[a]]
sufiksi [] = [[]]
sufiksi (x:xs) = (x:xs) : sufiksi xs
