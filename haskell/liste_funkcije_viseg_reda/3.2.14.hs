-- Definisati funkciju obrni l, čiji je tip obrni :: [a] -> [a] za obrtanje liste l

obrni :: [a] -> [a]
obrni l = foldl (flip (:)) [] l
