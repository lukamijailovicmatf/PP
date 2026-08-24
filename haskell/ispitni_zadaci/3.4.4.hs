-- Napisati biblioteku dodatnih funkcija za rad sa stekom. Stek može sadržati proizvoljno mnogo elemenata odredenog tipa, i potrebno je pružiti sledeće funkcionalnosti:
-- 1. alias Stek a za strukturu podataka koji svoje elemente čuva unutar liste, gde je glava liste vrh steka;
-- 2. funkciju push s x, čiji je tip push :: Stek a -> a -> Stek a koja ubacuje element x na vrh steka s;
-- 3. funkciju top s, čiji je tip top :: Stek a -> Maybe a koja vraća vrh steka s ako stek nije prazan, a inače praznu vrednost;
-- 4. funkciju pop s, čiji je tip pop :: Stek a -> (Maybe a, Stek a) koja vraća par (vrh steka s, stek s bez vrha), dok ukoliko je stek prazan vraća se 
-- prazna vrednost za vrh steka;
-- 5. funkciju stMap s f, čiji je tip stMap :: Stek a -> (a -> b) -> Stek b koja primenjuje funkciju f na sve elemente steka s;
-- 6. funkciju proredi, čiji je tip proredi :: Stek a -> Stek a koja uklanja svaki element sa neparnim indeksom (indeksi elemenata liste se broje od 0).

type Stek a = [a]

push :: Stek a -> a -> Stek a
push s x = x : s

top :: Stek a -> Maybe a
top [] = Nothing
top (x:_) = Just x

pop :: Stek a -> (Maybe a, Stek a)
pop [] = (Nothing, [])
pop (x:xs) = (Just x, xs)

stMap :: Stek a -> (a -> b) -> Stek b
stMap s f = map f s

proredi :: Stek a -> Stek a
proredi s = map snd (filter (\x -> even (fst x)) (zip [0..] s))
