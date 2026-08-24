-- U okviru jednog programskog rešenja su identifikovane česte operacije nad listama: pronalazak maksimuma, traženje indeksa elementa u listi i slično. Osim toga, u okviru
-- projekta se umesto stekova koriste obične liste. Primećena je mogućnost generalizacije pomenutih koncepata u jednu zasebnu biblioteku koja bi se koristila kroz projekat i
-- korisnicima pružila transparentni interfejs za rad sa listama ili stekovima. 
-- Implementirati:
-- 1. funkciju maxl lst, čiji je tip maxl :: Ord a => [a] -> a koja vraća maksimalni element liste lst;
-- 2. funkciju ind x lst, čiji je tip ind :: Eq a => a -> [a] -> Int koja vraća indeks elementa x u listi lst (indeks se broji od 1), a inače −1 ukoliko se x ne nalazi u listi
-- lst;
-- 3. funkciju presek lst1 lst2, čiji je tip presek :: Ord a => [a] -> [a] -> [a] koja vraća sortiranu listu koja predstavlja presek dve sortirane liste (elemenata koji se nalaze
-- u obe liste), pritom u listama lst1 i lst2 nema ponavljanja elemenata;
-- 4. tip podataka (dozvoljen je i alias) Stek a koji će svoje elemente čuvati unutar liste, glava liste će biti vrh steka;
-- 5. funkciju push s x, čiji je tip push :: Stek a -> a -> Stek a koja ubacuje element x na vrh steka s’
-- 6. funkciju top s, čiji je tip top :: Stek a -> Maybe a koja vraća vrh steka s ako stek nije prazan, a inače praznu vrednost;
-- 7. funkciju pushMP lst1 lst2 s, čiji je tip pushMP :: Ord a => [a] -> [a] -> Stek a -> Stek a koja maksimalni element preseka sortiranih listi lst1 i lst2 gura na vrh steka s,
-- pritom u listama lst1 i lst2 nema ponavljanja elemenata.

maxl :: Ord a => [a] -> a
maxl lst = foldl1 (\x y -> if x > y then x else y) lst      -- maxl = foldl1 max

ind :: Eq a => a -> [a] -> Int
ind x lst = case lookup True (zip (map (== x) lst) [1..]) of
                 Just i -> i
                 Nothing -> -1
                 
presek :: Ord a => [a] -> [a] -> [a]
presek _ [] = []
presek [] _ = []
presek (x:xs) (y:ys)
    | x == y = x : presek xs ys
    | x < y = presek xs (y:ys)
    | otherwise = presek (x:xs) ys
    
type Stek a = [a]

push :: Stek a -> a -> Stek a
push s x = x : s

top :: Stek a -> Maybe a
top [] = Nothing
top s = Just (head s)       -- top (x:_) = Just x

pushMP :: Ord a => [a] -> [a] -> Stek a -> Stek a
pushMP lst1 lst2 s = 
    let p = presek lst1 lst2
    in if null p then s else push s (maximum p)
