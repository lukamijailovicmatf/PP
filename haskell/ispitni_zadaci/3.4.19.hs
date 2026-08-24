-- Napisati biblioteku funkcija za rad sa bojama. Svaka boja se opisuje pomoću tri cela broja u opsegu [0, 255] koji opisuju crvenu, zelenu i plavu komponentu boje.
-- Implementirati:
-- 1. implicitno prikazivi i jednačivi suma tip Komponenta (podrazumevano instancira Show i Eq) sa konstruktorima R, G i B (konstruktori nemaju argumente);
-- 2. implicitno prikazivi i jednačivi tip Boja (podrazumevano instancira Show i Eq) sa poljima polja r, g i b (tipa Int) i ternarnim konstruktorom MkBoja koji prima celobrojne
-- vrednosti za crvenu, zelenu i plavu komponentu boje, redom;
-- 3. funkciju komponenta k b, čiji je tip komponenta :: Komponenta -> Boja -> Int koja vraća vrednost komponente k boje b;
-- 4. funkciju ponisti k b, čiji je tip ponisti :: Komponenta -> Boja -> Boja koja poništava komponentu k boje b (postavlja njenu vrednost na 0);
-- 5. funkciju pomesaj b1 b2, čiji je tip pomesaj :: Boja -> Boja -> Maybe Boja koja formira novu boju tako što sabere odgovarajuće vrednosti komponenti boja b1 i b2, a praznu
-- vrednost ukoliko se desilo prekoračenje opsega za bilo koju od komponenti;
-- 6. funkciju maska komponente boja, čiji je tip maska :: [Komponenta] -> Boja -> Boja koja iz boje b poništava komponente (postavlja im vrednosti na 0) koje se ne nalaze u listi
-- komponente.
-- Pretpostaviti da su argumenti funkcija koji predstavljaju boje ispravni, tj. da su vrednosti za komponente boje u opsegu [0, 255]. Rezultat rada funkcija mora biti boja koja
-- takode zadovoljava ovo svojstvo.

data Komponenta = R | G | B
    deriving (Show, Eq)
    
data Boja = MkBoja { r :: Int,
                     g :: Int,
                     b :: Int
                   } deriving (Show, Eq)
                   
komponenta :: Komponenta -> Boja -> Int
komponenta R (MkBoja r g b) = r
komponenta G (MkBoja r g b) = g
komponenta B (MkBoja r g b) = b

ponisti :: Komponenta -> Boja -> Boja
ponisti R (MkBoja r g b) = (MkBoja 0 g b)
ponisti G (MkBoja r g b) = (MkBoja r 0 b)
ponisti B (MkBoja r g b) = (MkBoja r g 0)

pomesaj :: Boja -> Boja -> Maybe Boja
pomesaj (MkBoja r1 g1 b1) (MkBoja r2 g2 b2)
    | any (>255) [r1 + r2, g1 + g2, b1 + b2] = Nothing
    | otherwise = Just (MkBoja (r1 + r2) (g1 + g2) (b1 + b2))

maska :: [Komponenta] -> Boja -> Boja
maska komponente (MkBoja r g b) = MkBoja (if R `elem` komponente then r else 0)
                                         (if G `elem` komponente then g else 0)
                                         (if B `elem` komponente then b else 0)
