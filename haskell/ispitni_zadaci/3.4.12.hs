-- Napisati biblioteku funkcija za pretragu karaktera u niskama. Potrebno je isporučiti tip Poklapanje koji će predstavljati jedno pojavljivanje karaktera u nisci i sadržati u
-- sebi informaciju o poziciji karaktera. Nad ovim tipom je neophodno implementirati dodatne funkcije zapretragu.
-- Implementirati:
-- 1. prikazivi tip podataka Poklapanje (podrazumevano instancira Show) sa konstruktorom Od i poljima: kar (predstavlja karakter) i poz (predstavlja poziciju karaktera u nisci);
-- postarati se da postoje funkcije kar i poz koje vraćaju vrednosti polja objekta tipa Poklapanje
-- 2. funkciju poklapanjeShow p, čiji je tip poklapanjeShow :: Poklapanje -> String koja vraća nisku u formatu karakter (pozicija) za dato poklapanje p, npr: "k (12)";
-- 3. funkciju poklapanjeM i str, čiji je tip poklapanjeM :: Int -> String -> Maybe Poklapanje koja vraća poklapanje karaktera na indeksu i u nisci str ukoliko je i unutar granica
-- niske str, a inače praznu vrednost;
-- 4. funkciju poklapanjeE i str, čiji je tip poklapanjeE :: Int -> String -> Either String Poklapanje koja vraća poklapanje karaktera na indeksu i u nisci str ukoliko je i unutar
-- granica niske str, a inače vraća nisku: "Index error";
-- 5. funkciju pronadjiM p str, čiji je tip pronadjiM :: Poklapanje -> String -> Maybe Bool koja, ukoliko je pozicija karaktera iz poklapanja p u granicama niske str, vraća
-- indikator da li se taj poklapanje nalazi na poziciji iz poklapanja p u nisci str, a inače praznu vrednost;
-- 6. funkciju pronadjiE p str, čiji je tip pronadjiE :: Poklapanje -> String -> Either String Bool koja, ukoliko je pozicija karaktera iz poklapanja p u granicama
-- niske str, vraća indikator da li se taj karakter nalazi na poziciji iz poklapanja p u nisci str, a inače vraća nisku: "Index error".

data Poklapanje = Od { kar :: Char,
                       poz :: Int
                     } deriving (Show)
                     
poklapanjeShow :: Poklapanje -> String
poklapanjeShow (Od c p) = [c] ++ " (" ++ show p ++ ")"

poklapanjeM :: Int -> String -> Maybe Poklapanje
poklapanjeM i str
    | (i < 0 || i >= length str) = Nothing
    | otherwise = Just (Od (str !! i) i)
    
poklapanjeE :: Int -> String -> Either String Poklapanje
poklapanjeE i str
    | (i < 0 || i > length str) = Left "Index error"
    | otherwise = Right (Od (str !! i) i)
    
pronadjiM :: Poklapanje -> String -> Maybe Bool
pronadjiM (Od c p) str
    | (p < 0 || p >= length str) = Nothing
    | otherwise = Just (str !! p == c)
    
pronadjiE :: Poklapanje -> String -> Either String Bool
pronadjiE (Od c p) str
    | (p < 0 || p >= length str) = Left "Index error"
    | otherwise = Right (str !! p == c)
