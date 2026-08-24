-- Definisati funkciju prefiksi l, čiji je tip prefiksi :: [a] -> [[a]] koja pravi listu svih prefiksa liste l

prefiksi :: [a] -> [[a]]
prefiksi [] = [[]]
prefiksi (x:xs) = [] : map (x:) (prefiksi xs)
