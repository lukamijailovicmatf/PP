-- Definisati funkciju qsort l, čiji je tip qsort :: Ord a => [a] -> [a] sortira listu l u rastućem poretku koristeći algoritam quick sort. Zapivot uzeti prvi element liste

qsort :: Ord a => [a] -> [a]
qsort [] = []
qsort (x:xs) =
    let manji = qsort [a | a <- xs, a <= x]
        veci = qsort [a | a <- xs, a > x]
    in manji ++ [x] ++ veci
