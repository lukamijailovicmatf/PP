-- Napisati biblioteku funkcija za rad sa bojama. Svaka boja se opisuje pomoću tri cela broja u opsegu [0, 255] koji opisuju crvenu, zelenu i plavu komponentu boje.
-- Napomena: Komponenta k se u funkcijama ispod zadaje kao karakter ’r’, ’g’ ili ’b’. Sve ostale karaktere tretirati kao nevalidne komponente. Pretpostaviti da su na ulazu samo
-- mala slova. Za nevalidne komponente vratiti vrednost 0.
-- Implementirati funkcije:
-- 1. komponenta k b, čiji je tip komponenta :: Char -> (Int, Int, Int) -> Int koja vraća vrednost komponente k boje b;
-- 2. ponisti k b, čiji je tip ponisti :: Char -> (Int, Int, Int) -> (Int, Int, Int) koja poništava komponentu k boje b (postavlja njenu vrednost na 0, za nevalidne komponente
-- vratiti neizmenjen argument);
-- 3. pomesaj b1 b2, čiji je tip pomesaj :: (Int, Int, Int) -> (Int, Int, Int) -> (Int, Int, Int) koja formira novu boju tako što sabere odgovarajuće vrednosti komponenti boja b1
-- i b2 (ukoliko komponente u zbiru prelaze maksimalnu vrednost za komponentu boje, rezultat njihovog zbira je maksimalna vrednost komponente);
-- 4. dodaj k v b, čiji je tip dodaj :: Char -> Int -> (Int, Int, Int) -> (Int, Int, Int) koja dodaje vrednost v na komponentu k boje b (ukoliko komponente u zbiru prelaze
-- maksimalnu vrednost za komponentu boje, rezultat njihovog zbira je maksimalna vrednost komponente; za nevalidne komponente vratiti neizmenjen argument);
-- 5. lbFilter k v boje, čiji je tip lbFilter :: Char -> Int -> [(Int, Int, Int)] -> [(Int, Int, Int)] koja iz liste boja uklanja one boje (održavajući originalni redosled) čija
-- je vrednost komponente k manja od v (za nevalidne komponente vratiti neizmenjen argument).
-- Pretpostaviti da su argumenti funkcija koji predstavljaju boje ispravni, tj. da su vrednosti za komponente boje u opsegu [0, 255]. Rezultat rada funkcija mora biti boja koja
-- takodje zadovoljava ovo svojstvo.

komponenta :: Char -> (Int, Int, Int) -> Int
komponenta k (x1, x2, x3)
    | k == 'r' = x1
    | k == 'g' = x2
    | k == 'b' = x3
    | otherwise = 0
    
ponisti :: Char -> (Int, Int, Int) -> (Int, Int, Int)
ponisti k (x1, x2, x3)
    | k == 'r' = (0, x2, x3)
    | k == 'g' = (x1, 0, x3)
    | k == 'b' = (x1, x2, 0)
    | otherwise = (x1, x2, x3)
    
pomesaj :: (Int, Int, Int) -> (Int, Int, Int) -> (Int, Int, Int)
pomesaj (r1, g1, b1) (r2, g2, b2) = (min (r1 + r2) 255, min (g1 + g2) 255, min (b1 + b2) 255)

dodaj :: Char -> Int -> (Int, Int, Int) -> (Int, Int, Int)
dodaj k v (x1, x2, x3)
    | k == 'r' = (min (x1 + v) 255, x2, x3)
    | k == 'g' = (x1, min (x2 + v) 255, x3)
    | k == 'b' = (x1, x2, min (x3 + v) 255)
    | otherwise = (x1, x2, x3)
    
lbFilter :: Char -> Int -> [(Int, Int, Int)] -> [(Int, Int, Int)]
lbFilter k v boje = filter (\b -> komponenta k b >= v) boje
