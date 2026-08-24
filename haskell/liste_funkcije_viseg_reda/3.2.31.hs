-- Za razliku od Alekse i Luke, Ana i Milica imaju problem dešifrovanja podataka. Da bi Ana dešifrovala podatke koje joj Milica pošalje potrebno je da svaku nisku iz dobijene
-- liste transformiše na sledeći način: 
-- ukoliko dobijena niska počinje cifrom, sa njenog početka izbaciti onoliko karaktera koliko ta niska ima cifara, a ukoliko dobijena niska počinje malim slovom, sa njenog početka
-- izbaciti onoliko karaktera koliko ta niska ima malih slova. Pretpostaviti da će ovakvim dešifrovanjem Ana uvek dobiti ispravne izvorne podatke. Definisati sledeće funkcije koje
-- pomažu Ani da dešifruje Miličine poruke:

-- 1. cifre s, čiji je tip cifre :: String -> Int koja za datu nisku s vraća broj karaktera niske koji su cifre;

-- 2. mala s, čiji je tip mala :: String -> Int koja za datu nisku s vraća broj karaktera niske koji su mala slova;

-- 3. desifruj ls, čiji je tip desifruj :: [String] -> [String] koja datu listu niski ls transformiše na sledeći način: ukoliko niska počinje cifrom, sa njenog početka izbacuje
-- onoliko karaktera koliko ta niska ima cifara, a ukoliko dobijena niska počinje malim slovom, sa njenog početka izbacuje onoliko karaktera koliko ta niska ima malih slova.

import Data.Char (isDigit, isLower)

cifre :: String -> Int
cifre s = length (filter isDigit s)

mala :: String -> Int
mala s = length (filter isLower s)

desifruj :: [String] -> [String]
desifruj ls = map obradi ls
    where obradi [] = []
          obradi s@(x:_)
            | isDigit x = drop (cifre s) s
            | isLower x = drop (mala s) s
            | otherwise = s
