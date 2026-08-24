-- Dat je spisak bodova studenata sa više kolokvijuma. Napisati funkcije:
-- 1. saberiKolokvijume :: [[Int]] -> [Int] koja za svakog studenta sabira bodove sa svih kolokvijuma;
-- 2. maksimum :: [Int] -> Int koja vraća najveći broj bodova u listi, ili 0 ako je lista prazna;
-- 3. normalizuj :: [Int] -> [Float] koja normalizuje bodove tako da se izraze kao procenat u odnosu na najveći broj bodova. Ako je maksimalan broj bodova 0, svi rezultati su 0;
-- 4. boljiOdProcentualno :: [Int] -> [Float] koja za svakog studenta vraća procenat studenata koje je on nadmašio po ukupnim bodovima. Ako je lista prazna, vraća praznu listu;
-- 5. prilagodiPoene :: [Int] -> [Float] koja za svakog studenta prilagodjava njegove ukupne bodove po sledećoj krivoj:
-- • Prvo se za svaki rezultat izračuna kvadratni koren, što znači da se niži rezultati ”pojačavaju”, a viši se blago smanjuju u odnosu na originalnu skalu.
-- • Nakon toga se svi rezultati skaliraju tako da najveći rezultat postane 100, a ostali se proporcionalno prilagodjavaju.
-- • Ako je lista prazna ili svi rezultati su 0, vraća se prazna lista.

saberiKolokvijume :: [[Int]] -> [Int]
saberiKolokvijume lst = map (\l -> sum l) lst

maksimum :: [Int] -> Int
maksimum [] = 0
maksimum lst = foldl (\acc x -> if x > acc then x else acc) 0 lst       -- maksimum xs = maximum xs

normalizuj :: [Int] -> [Float]
normalizuj lst = 
    let m = maksimum lst
    in if m == 0 then replicate (length lst) 0 else map (\x -> (fromIntegral x / fromIntegral m) * 100) lst
    
boljiOdProcentualno :: [Int] -> [Float]
boljiOdProcentualno lst = 
    let n = length lst
    in map (\x -> let cnt = length (filter (\y -> y < x) lst) in (fromIntegral cnt / fromIntegral n) * 100) lst
    
prilagodiPoene :: [Int] -> [Float]
prilagodiPoene [] = []
prilagodiPoene lst = 
    let koreni = map (\x -> sqrt (fromIntegral x)) lst
        m = maximum koreni
    in if m == 0 then [] else map (\x -> x / m * 100) koreni
