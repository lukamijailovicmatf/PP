-- Formacija igre kolo je polukrug sa istaknutom ulogom prvog i poslednjeg igrača. Napisati funkciju ucesljaj mIgraci zIgraci, čiji je tip ucesljaj :: [String] -> [String] ->
-- [String] koja pravi jednu formaciju za kolo naizmeničnim učešljavanjem igrača iz date grupe muških (mIgraci) i ženskih (zIgraci) igrača, redom

ucesljaj :: [String] -> [String] -> [String]
ucesljaj [] lista = lista
ucesljaj lista [] = lista
ucesljaj (x:xs) (y:ys) = [x] ++ [y] ++ (ucesljaj xs ys)
