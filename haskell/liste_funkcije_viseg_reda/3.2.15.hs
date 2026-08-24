-- Definisati funkciju svi p l, čiji je tip svi :: (a -> Bool) -> [a] -> Bool koja proverava da li svi elementi liste l zadovoljavaju dati predikat p

svi :: (a -> Bool) -> [a] -> Bool
svi p l = and (map p l)
