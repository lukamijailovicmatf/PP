-- Napisati biblioteku funkcija koje pružaju korisniku podršku za rad sa geometrijskim oblicima. 
-- Implementirati:
-- 1. tip podataka Oblik koji se može konstruisati pomoću konstruktora (bez geter funkcija za polja):
-- (a) Krug r — predstavlja krug poluprečnika r;
-- (b) Trougao a — predstavja jednakostranični trougao stranice a;
-- (c) Prav a b — predstavja pravougaonik sa stranicama a i b;
-- (d) Kvadrat a — predstavja kvadrat stranice a.
-- (Dužine stranica modelovati tipom Float)
-- 2. podrazumevano instanciranje klase Show za Oblik;
-- 3. klasu PlanarniOblik koja se sastoji od funkcija obim i povrsina;
-- 4. instanciranje klase PlanarniOblik za Oblik tako da funkcije obim i povrsina vrate ispravne vrednosti za odgovarajuće vrste Oblik-a (Krug, Trougao itd. );
-- 5. funkciju ukupnaP lst, čiji je tip ukupnaP :: (PlanarniOblik a) => [a] -> Float koja vraća ukupnu površinu svih oblika iz liste lst

data Oblik = Krug Float
           | Trougao Float
           | Prav Float Float
           | Kvadrat Float
           deriving (Show)
           
class PlanarniOblik a where
    obim :: a -> Float
    povrsina :: a -> Float
    
instance PlanarniOblik Oblik where
    obim (Krug r) = 2 * r * pi
    obim (Trougao a) = 3 * a
    obim (Prav a b) = 2 * (a + b)
    obim (Kvadrat a) = 4 * a
    povrsina (Krug r) = r ^ 2 * pi
    povrsina (Trougao a) = a ^ 2 * sqrt(3) / 4
    povrsina (Prav a b) = a * b
    povrsina (Kvadrat a) = a ^ 2
    
ukupnaP :: (PlanarniOblik a) => [a] -> Float
ukupnaP [] = 0.0
ukupnaP lst = sum (map povrsina lst)
