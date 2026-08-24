-- Nemanji je potrebna pomoć oko kompresovanja i dekompresovanja matrica koje su mu potrebe za njegov projekat. Matrice sa kojima on radi sadrže pretežno nule ali su neki elementi
-- brojevi koji su stepen broja 2. Svaka matrica dimenzije m × n predstavljena je listom koja sadrži m listi brojeva (svaki broj je 0 ili stepen broja 2) dužine n (npr. jedna
-- matrica dimenzije 2 × 3 je predstavljena sa [[0,0,8],[16,0,4]]). Matrica se kompresuje na sledeći način: svaka vrsta (podlista) se zamenjuje listom parova (pozicija, stepen)
-- gde pozicija predstavlja poziciju na kojoj se nalazi element koji nije nula u toj vrsti a stepen je broj koji govori koji stepen dvojke je taj element (npr. ako se u odredjenoj
-- vrsti na drugoj poziciji nalazi element 8 njemu će odgovarati ureden par (2,3)). 
-- Napisati funkcije:
-- 1. kompresuj :: [[Int]] -> [[(Int, Int)]] koja kao argument dobija nekompresovanu matricu, a kao rezultat vraća kompresovanu matricu
-- 2. dekompresuj :: [[(Int, Int)]] -> Int-> [[Int]] koja kao argument dobija kompresovanu matricu i dimenziju vrste, a kao rezultat vraća nekompresovanu matricu.

kompresuj :: [[Int]] -> [[(Int, Int)]]
kompresuj lst = map kompresujRed lst
    where kompresujRed red = [(i, stepen x) | (i, x) <- zip [0..] red, x /= 0]
          stepen x = round (logBase 2 (fromIntegral x))
          
dekompresuj :: [[(Int, Int)]] -> Int -> [[Int]]
dekompresuj lst n = map (dekompresujRed n) lst
    where dekompresujRed len red = [vrednostZaPoziciju i red | i <- [0..len-1]]
          vrednostZaPoziciju i red = case lookup i red of
                               Just p -> 2 ^ p
                               Nothing -> 0

dekompresuj' :: [[(Int, Int)]] -> Int -> [[Int]]
dekompresuj' lst n = map (dekompresujRed n) lst
    where dekompresujRed len red = [vrednostZaPoziciju i red | i <- [0..len-1]]
          vrednostZaPoziciju i red = if null poklapanja then 0 else 2 ^ head poklapanja
            where poklapanja = [p | (pos, p) <- red, pos == i]
