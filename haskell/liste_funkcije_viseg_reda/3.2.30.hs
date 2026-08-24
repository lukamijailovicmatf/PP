-- Aleksa i Luka žele da komuniciraju preko šifrovanih poruka koje predstavljaju listom niski. Aleksa šifruje željene podatke na sledeći način:
-- ukoliko se niska koju šalje sastoji samo od cifara, na njen početak i kraj dodaje karakter C, ako se sastoji samo od malih slova, na njen početak i kraj dodaje karakter S, a
-- inače na njen početak i kraj dodaje karakter O. Definisati sledeće funkcije koje pomažu Aleksi da pošalje Luki šifrovanu poruku:

-- 1. broj s, čiji je tip broj :: String -> Bool koja za datu nisku s proverava da li su svi njeni karakteri cifre;

-- 2. mala s, čiji je tip mala :: String -> Bool koja za datu nisku s proverava da li su svi njeni karakteri mala slova;

-- 3. sifruj ls, čiji je tip sifruj :: [String] -> [String] koja datu listu niski ls transformiše na sledeći način: ukoliko se niska koju šalje sastoji samo od cifara, na njen
-- početak i kraj dodaje karakter C, ako se sastoji samo od malih slova, na njen početak i kraj dodaje karakter M, a inače na njen početak i kraj dodaje karakter O.

import Data.Char (isDigit, isLower)

broj :: String -> Bool
broj s = all isDigit s

mala :: String -> Bool
mala s = all isLower s

sifruj :: [String] -> [String]
sifruj ls = map kodiraj ls
    where kodiraj s
            | broj s = 'C' : s ++ "C"
            | mala s = 'M' : s ++ "M"
            | otherwise = 'O' : s ++ "O"
