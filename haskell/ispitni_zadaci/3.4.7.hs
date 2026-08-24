-- Napisati biblioteku koja pruža dodatne operacije za rad sa listama, implementirajući funkcije:
-- 1. safeHead lst, čiji je tip safeHead :: [a] -> Maybe a koja vraća glavu liste lst ili Nothing ukoliko nije moguće izvući glavu liste;
-- 2. safeTail lst, čiji je tip safeTail :: [a] -> Either [a] String koja vraća rep liste lst ili nisku "Empty" ukoliko nije moguće izvući rep liste;
-- 3. find e lst, čiji je tip find :: Eq a => a -> [a] -> Either Int String koja vraća indeks elementa e u listi lst (počev od 1) ili nisku "404" ako se e ne nalazi u lst;
-- 4. foldf acc fs lst, čiji je tip foldf :: b -> [(b -> a -> b)] -> [a] -> b koja akumulira listu lst tako što primenjuje funkcije iz liste fs redom na trenutnu vrednost
-- akumulatora i trenutni element liste, i vraća finalnu vrednost akumulatora (ukoliko je broj elemenata listi fs i lst različit, broj operacija je jednak dužini kraće liste).

safeHead :: [a] -> Maybe a
safeHead [] = Nothing
safeHead (x:_) = Just x

safeTail :: [a] -> Either [a] String
safeTail [] = Right "Empty"
safeTail (_:xs) = Left xs

find :: Eq a => a -> [a] -> Either Int String
find e lst = case lookup True (zip (map (== e) lst) [1..]) of
                  Just i -> Left i
                  Nothing -> Right "404"
                  
foldf :: b -> [(b -> a -> b)] -> [a] -> b
foldf acc fs lst = foldl (\a (f, x) -> f a x) acc (zip fs lst)
