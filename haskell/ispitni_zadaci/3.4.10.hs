-- Napisati biblioteku funkcija koja će podržati implementacije raznih kartaških igara. Potrebno je modelirati kartu, skup izvučenih karata (u daljem tekstu ruka), kao i funkcije
-- za rad sa definisanim modelom. Svaka karta se sastoji od znaka (herc, karo, pik, tref ) vrednosti (od 2 do 10 za karte bez slike, dok žandar ima vrednost 12, kraljica 13,
-- kralj 14, a kec 15). Karte se porede po njihovim vrednostima, a u slučaju da su vrednosti iste, onda se posmatraju znakovi po sledećem poretku (od najmanjeg ka najvećem): herc,
-- karo, pik, tref. Na primer, trojka tref je manja od petice herc, ali je trojka herc manja od trojke tref.

-- 1. Svaku kartu posmatrati kao par gde levi element predstavlja celobrojnu vrednost karte a desni predstavlja znak (prvi karakter znaka, dakle: ’H’, ’K’, ’P’, ’T’).
-- Implementirati funkcije:
-- (a) dodaj ruka karta, čiji je tip dodaj :: [(Int, Char)] -> (Int, Char) -> [(Int, Char)] koja u trenutnu sortiranu ruku, dodaje novu kartu tako da je sortirani poredak održan i
-- vraća potencijalno modifikovanu ruku (ako karta već postoji u ruci ne raditi ništa);
-- (b) ukloni ruka karta, čiji je tip ukloni :: [(Int, Char)] -> (Int, Char) -> [(Int, Char)] koja iz ruke uklanja odgovarajuću kartu i vraća potencijalno novu ruku (ako karta ne
-- postoji u ruci ne raditi ništa);
-- (c) uporedi ruka1 ruka2, čiji je tip uporedi :: [(String, Int)] -> [(String, Int)] -> Ordering koja poredi dve ruke i vraća poredak LT ako je prva ruka u leksikografskom
-- poretku pre druge, GT ako je prva ruka u leksikografskom poretku posle druge, ili EQ ukoliko su jednake leksikografski (pretpostaviti da je broj karata u obe ruke jednak).

-- 2. Implementirati:
-- (a) tip podataka Znak koji predstavlja znak karte — može se konstruisati konstruktorima Herc, Karo, Pik ili Tref;
-- (b) prikazivi i jednačivi tip podataka Karta (podrazumevano instancira Show i Eq) sa konstruktorom MkKarta i poljima: vrednost (vrednost karte, ceo broj) i znak (Znak karte);
-- (c) tip podataka Ruka koji predstavlja alias za listu karata;
-- (d) funkciju izlistaj znak ruka, čiji je tip izlistaj :: Znak -> Ruka -> [Karta] koja vraća sve karte iz ruke (ruka) koje su odgovarajućeg znaka (znak);
-- (e) dodaj ruka karta, čiji je tip dodaj :: Ruka -> Karta -> Ruka koja u trenutnu sortiranu ruku dodaje novu kartu tako da je sortirani poredak održan i vraća potencijalno
-- modifikovanu ruku (ako karta već postoji u ruci ne raditi ništa);
-- (f) najjaca ruka, čiji je tip najjaca :: Ruka -> Karta koja vraća najveću kartu (maksimalnu u sortiranom poretku) iz ruke ruka.

import Data.List (insertBy, maximumBy)

-- 1. deo --
dodaj1 :: [(Int, Char)] -> (Int, Char) -> [(Int, Char)]
dodaj1 ruka karta
    | karta `elem` ruka = ruka
    | otherwise = insertBy compareCard karta ruka
    
compareCard :: (Int, Char) -> (Int, Char) -> Ordering
compareCard (v1, z1) (v2, z2)
    | v1 /= v2 = compare v1 v2
    | otherwise = compare (rank z1) (rank z2)
    where rank 'H' = 1
          rank 'K' = 2
          rank 'P' = 3
          rank 'T' = 4
          rank _ = 0
          
ukloni :: [(Int, Char)] -> (Int, Char) -> [(Int, Char)]
ukloni ruka karta = filter (\(broj, znak) -> (fst karta /= broj && snd karta /= znak)) ruka       -- ukloni ruka karta = filter (/= karta) ruka

uporedi :: [(Int, Char)] -> [(Int, Char)] -> Ordering
uporedi ruka1 ruka2 = compare ruka1 ruka2

-- 2. deo --
data Znak = Herc | Karo | Pik | Tref
    deriving (Show, Eq)

data Karta = MkKarta { vrednost :: Int,
                       znak :: Znak
                     } deriving (Show, Eq)
                     
type Ruka = [Karta]

izlistaj :: Znak -> Ruka -> [Karta]
izlistaj trazeniZnak ruka = filter (\karta -> znak karta == trazeniZnak) ruka

dodaj2 :: Ruka -> Karta -> Ruka
dodaj2 ruka karta
    | karta `elem` ruka = ruka
    | otherwise = insertBy compareK karta ruka
    
compareK :: Karta -> Karta -> Ordering
compareK (MkKarta v1 z1) (MkKarta v2 z2)
    | v1 /= v2 = compare v1 v2
    | otherwise = compare (rankZ z1) (rankZ z2)
    
rankZ :: Znak -> Int
rankZ Herc = 1
rankZ Karo = 2
rankZ Pik = 3
rankZ Tref = 4

najjaca :: Ruka -> Karta
najjaca ruka = maximumBy compareK ruka
