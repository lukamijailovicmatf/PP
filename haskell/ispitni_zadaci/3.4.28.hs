-- Napraviti Haskell biblioteku koja pomaže kupcima pri kupovini u supermarketu.
-- 1. Napisati funkciju unesiProizvod :: (String, Float) -> [(String, Float)] -> [(String, Float)] koja u listu proizvoda sortiranu po ceni rastuće unosi novi
-- proizvod na odgovarajuće mesto.
-- 2. Napisati funkciju ukloniProizvod :: String -> [(String, Float)] -> [(String, Float)] koja iz liste proizvoda uklanja dati proizvod.
-- 3. Napisati funkciju primeniPopust :: [(String, Float)] -> [(String, Float)] koja na sve proizvode čija je cena veća od 1000 dinara primenjuje popust od 10% i 
-- vraća listu proizvoda sa ažuriranim cenama.
-- 4. Kreirati tip podataka Proizvod koji se može konstruisati putem konstruktora MkProizvod i sadrži dva atributa naziv (String) i cena (Float), kao i funkcije naziv 
-- i cena koje omogućavaju pristup poljima naziv i cena. Za kreirani tip instancirati klasu Show (podrazumevano).
-- 5. Napisati funkciju izbaciSkupeProizvode :: Float -> [Proizvod] -> [Proizvod] koja prima odredjenu cenu i listu proizvoda, i vraća listu proizvoda čije cene ne 
-- prelaze zadatu cenu.
-- 6. Napisati funkciju pronadjiProizvod :: String -> [Proizvod] -> Either String Proizvod koja nalazi proizvod sa zadatim nazivom u listi proizvoda i vraća proizvod 
-- ukoliko on postoji u listi, a inače poruku greške.

unesiProizvod :: (String, Float) -> [(String, Float)] -> [(String, Float)]
unesiProizvod x [] = [x]
unesiProizvod (ime, cena) (y:ys)
    | cena <= snd y = (ime, cena) : y : ys
    | otherwise = y : unesiProizvod (ime, cena) ys
    
ukloniProizvod :: String -> [(String, Float)] -> [(String, Float)]
ukloniProizvod imeProizvoda lst = filter (\(ime, cena) -> ime /= imeProizvoda) lst

primeniPopust :: [(String, Float)] -> [(String, Float)]
primeniPopust lst = map (\(ime, cena) -> if cena > 1000 then (ime, cena - 0.1 * cena) else (ime, cena)) lst

data Proizvod = MkProizvod { naziv :: String,
                             cena :: Float
                           } deriving (Show)
                           
izbaciSkupeProizvode :: Float -> [Proizvod] -> [Proizvod]
izbaciSkupeProizvode maxCena lst = filter (\p -> cena p <= maxCena) lst

pronadjiProizvod :: String -> [Proizvod] -> Either String Proizvod
pronadjiProizvod nazivProizvoda lst = case filter (\p -> naziv p == nazivProizvoda) lst of
                                           (x:_) -> Right x
                                           [] -> Left ("Proizvod sa nazivom " ++ nazivProizvoda ++ " nije pronadjen.")
