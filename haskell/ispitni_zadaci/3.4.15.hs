-- Napisati biblioteku funkcija koje pružaju korisniku rad sa prozorima — tzv. menadžer prozora. Potrebno je isporučiti tip Prozor i tip Prozori, kao i funkciju za 
-- otvaranje novog prozora.
-- Implementirati:
-- 1. tip podataka Prozor sa konstruktorom MkProzor i poljima: ind (predstavlja indeks prozora) i naziv (predstavlja naziv prozora); postarati se da postoje funkcije ind i naziv
-- koje vraćaju vrednosti polja objekta tipa Prozor;
-- 2. tip Prozori koji predstavlja listu prozora (tipa Prozor);
-- 3. klasu Ord za tip Prozor tako da se prozori porede po indeksu;
-- 4. klasu Show za tip Prozor tako da se prozor prikaže u formatu [indeks]: naziv;
-- 5. funkciju otvori str lst, čiji je tip otvori :: String -> Prozori -> Prozori koja kreira Prozor sa naslovom str i prvim slobodnim pozitivnim indeksom koji nije zauzet (prozor
-- sa tim indeksom se ne nalazi u listi lst) i postavlja ga kao aktivni prozor. Funkcija vraća izmenjenu listu prozora.

data Prozor = MkProzor { ind :: Int,
                         naziv :: String
                       }
                       
type Prozori = [Prozor]

-- mora da se i Eq instancira za Prozor inace ako se instancira samo Ord za Prozor bez Eq ghci se buni i javlja gresku
instance Eq Prozor where
    (MkProzor i1 _) == (MkProzor i2 _) = i1 == i2

instance Ord Prozor where
    compare (MkProzor i1 _) (MkProzor i2 _) = compare i1 i2
    
instance Show Prozor where
    show (MkProzor i n) = "[" ++ show i ++ "]: " ++ n
    
otvori :: String -> Prozori -> Prozori
otvori str lst = 
    let ids = map ind lst
        newInd = prviSlobodan 1 ids
    in MkProzor newInd str : lst
    
-- pomocna funkcija koja pronalazi prvi sledeci indeks prozora kojeg trenutno nema u listi prozora
prviSlobodan :: Int -> [Int] -> Int
prviSlobodan n ids
    | n `elem` ids = prviSlobodan (n + 1) ids
    | otherwise = n
