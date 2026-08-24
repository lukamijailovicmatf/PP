-- Napisati biblioteku funkcija za olakšavanje rada s niskama. Neke od čestih operacija uključuju umanjivanje karaktera unutar niske, razdvajanje i spajanje niski u odnosu na
-- karakter ili nisku koja predstavlja separator.
-- Implementirati funkcije:
-- 1. najduza lst, čiji je tip najduza :: [String] -> String koja pronalazi najdužu nisku iz liste lst. Ako je više niski jednake dužine, vratiti prvu. Pretpostaviti da lista lst
-- ima barem jedan element;
-- 2. umanji str, čiji je tip umanji :: String -> String koja vraća nisku koja sadrži transformisane karaktere niske str — velika slova prebacuje u mala, dok ostale karaktere ne
-- modifikuje;
-- 3. razdvoj sep str, čiji je tip razdvoj :: Char -> String -> [String] koja vraća listu podniski niske str razdvojene na mestima pojavljivanja karaktera (separatora) sep;
-- 4. spoj sep lst, čiji je tip spoj :: String -> [String] -> String koja vraća nisku dobijenu nadovezivanjem niski iz liste lst sa separatorom sep umetnutim izmedu svaka dva
-- elementa (inverz razdvoj funkcije).

import Data.Char (toLower)

najduza :: [String] -> String
najduza lst = foldl1 (\a b -> if length a >= length b then a else b) lst

umanji :: String -> String
umanji str = map toLower str

razdvoj :: Char -> String -> [String]
razdvoj _ "" = [""]
razdvoj sep (c:cs)
    | c == sep = "" : rest
    | otherwise = (c : head rest) : tail rest
    where rest = razdvoj sep cs
    
spoj :: String -> [String] -> String
spoj _ [] = ""
spoj _ [x] = x
spoj sep (x:xs) = x ++ sep ++ spoj sep xs
