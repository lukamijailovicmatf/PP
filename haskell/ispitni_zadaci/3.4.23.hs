-- U prodavnici se dobija broj koji služi za čekanje u redu (što manji broj bićete pre usluženi). Svaka osoba opisuje se svojim imenom i dobijenim brojem.
-- U redu već stoji nekoliko ljudi (ne znamo da li poštuju redosled brojeva). U prodavnicu može da dode osoba koja uzme svoj broj ali ga ne poštuje i staje u red na poziciju na
-- koju ona želi. Takode, može da dode osoba koja zna da u redu ne poštuju svi svoj broj ali koja staje tačno na mesto na kojem bi njen broj trebao biti (kada bi red bio sortiran,
-- staje na poziciju koja odgovara dobijenom broju prilikom sortiranja). Dešava se i da u prodavnicu ude više ljudi odjednom i da svako stane gde želi.
-- Napisati funkcije za održavanje reda (liste) kupaca:
-- 1. ubaciNaPoz :: [(String,Int)] -> Int -> (String,Int) -> [(String,Int)] koja u red dodaje novog kupca (3. argument) koji želi na poziciju k (brojeći od 0, 2. argument) 
-- iako to možda nije pozicija na kojoj bi trebao biti. Pretpostaviti da je k ispravno zadat;
-- 2. ubaciURed :: [(String,Int)] -> (String,Int) -> [(String,Int)] koja u red dodaje novog kupca (2. argument) na poziciju na kojoj bi on trebao da bude da svi poštuju red;
-- 3. ubaciVise :: [(String,Int)] -> [Int] -> [(String,Int)] -> [(String,Int)] koja u red koji je zadat kao prvi argument ubacuje više novih kupaca koji ne poštuju red, tako da
-- i-ti element druge liste odgovara poziciji na koju treba ubaciti i-tog po redu novog kupca iz treće liste. Pretpostaviti da su argumenti ispravni i druga i treća lista istih
-- dimenzija.

ubaciNaPoz :: [(String, Int)] -> Int -> (String, Int) -> [(String, Int)]
ubaciNaPoz lst k x =
    let (a, b) = splitAt k lst
    in a ++ [x] ++ b
    
ubaciURed :: [(String, Int)] -> (String, Int) -> [(String, Int)]
ubaciURed [] x = [x]
ubaciURed (y:ys) (ime, br)
    | br <= snd y = (ime, br) : y : ys
    | otherwise = y : ubaciURed ys (ime, br)
    
ubaciVise :: [(String, Int)] -> [Int] -> [(String, Int)] -> [(String, Int)]
ubaciVise lst [] [] = lst
ubaciVise lst (k:ks) (x:xs) = ubaciVise (ubaciNaPoz lst k x) ks xs
ubaciVise lst _ _ = lst
