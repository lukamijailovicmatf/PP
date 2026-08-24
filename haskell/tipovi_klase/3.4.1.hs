-- Napisati biblioteku funkcija za rad sa bankarskim računima. Račun posmatrati kao par (broj računa, iznos), tipa (String, Int).
-- Implementirati funkcije:
-- 1. otvori b br, čiji je tip otvori :: [(String, Int)] -> otvoriString -> [(String, Int)] koja otvara račun u banci dodavanjem računa sa brojem br i iznosom 0 na početak liste računa
-- b, i vraća potencijalno modifikovanu listu računa (račun se ne otvara ukoliko drugi račun sa istim brojem već postoji u banci);
-- 2. zatvori b br, čiji je tip zatvori :: [(String, Int)] -> String -> [(String, Int)] koja zatvara račun u banci uklanjanjem računa sa brojem br iz liste računa b, i vraća
-- potencijalno modifikovanu listu računa;
-- 3. uplati b br iznos, čiji je tip uplati :: [(String, Int)] -> String -> Int -> [(String, Int)] koja uplaćuje iznos na račun br iz liste računa b i vraća potencijalno
-- modifikovanu listu računa.

type Racun = (String, Int)

otvori :: [Racun] -> String -> [Racun]
otvori b br
    | any (\(x, _) -> x == br) b = b
    | otherwise = (br, 0) : b
    
zatvori ::  [Racun] -> String -> [Racun]
zatvori b br = filter (\(x, _) -> x /= br) b

uplati :: [Racun] -> String -> Int -> [Racun]
uplati b br iznos = map (\(x, y) -> if x == br then (x, y + iznos) else (x, y)) b
