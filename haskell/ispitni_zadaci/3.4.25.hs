-- U svakom krugu igre Muzička stolica ispada po jedan učesnik. Učesnici igre se čuvaju u vidu liste imena gde redni broj učesnika odgovara njegovoj poziciji u listi 
-- (pozicije se broje od 0). Napisati funkcije koje odredjuju preostale učesnike nakon odredjenog broja krugova igre Muzička stolica ili rekonstruišu podatke o učesnicima:
-- 1. izbaci :: [[Char]] -> Int -> [[Char]] koja iz liste učesnika izbacuje k-tog (brojeći od 0). Pretpostaviti da je lista učesnika neprazna i da je drugi argument k 
-- ispravno zadat.  
-- 2. izbaciVise :: [[Char]] -> [Int] -> [[Char]] koja iz liste učesnika koja je zadata kao prvi argument izbacuje one čije su početne pozicije date kao elementi opadajuće
-- liste zadate kao drugi argument. Pretpostaviti da su argumenti ispravni.
-- 3. rekonstruisi :: [[Char]] -> [[Char]] -> [Int] -> [[Char]] koja na osnovu liste učesnika koji su preostali koja je zadata kao prvi argument i liste učesnika koji 
-- su izbačeni do sada, zajedno sa pozicijama (rastuća lista) sa kojih su izbačeni, zadati kao drugi i treći argument redom, rekonstruiše listu učesnika sa početka igre.
-- Pretpostaviti da su argumenti ispravni.

izbaci :: [[Char]] -> Int -> [[Char]]
izbaci [] _ = []
izbaci [x] _ = []
izbaci lst k = filter (\x -> x /= lst !! k) lst

izbaciVise :: [[Char]] -> [Int] -> [[Char]]
izbaciVise lst ks = foldl izbaci lst ks

rekonstruisi :: [[Char]] -> [[Char]] -> [Int] -> [[Char]]
rekonstruisi preostali izbaceni pozicije = foldl (\acc (p,x) -> let (a,b) = splitAt p acc in a ++ [x] ++ b) preostali (zip pozicije izbaceni)
