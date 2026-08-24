-- Napisati biblioteku funkcija koje pružaju korisniku rad sa prozorima — tzv. menadžer prozora. Menadžer prozora treba da pruži korisniku mogućnost otvaranja novog prozora,
-- selektovanja aktivnog prozora, zatvaranja prozora, kao i cikličnog pomeranja kroz prozore. Prozori se čuvaju u listi i reprezentuju se kao par (id_prozora, naslov_prozora).
-- Aktivni prozor držati u glavi liste prozora zarad efikasnog pristupa/zamene.
-- Implementirati funkcije (sve funkcije vraćaju ažuriranu listu prozora):
-- 1. aktivni lst, čiji je tip aktivni :: [(Int, String)] -> String koja vraća naslov trenutno aktivnog prozora u listi lst;
-- 2. otvori x str lst, čiji je tip otvori :: Int -> String -> [(Int, String)] -> [(Int, String)] koja novootvoreni prozor sa identifikatorom x i naslovom str dodaje u listu
-- prozora lst i postavlja taj prozor kao trenutno aktivni prozor. Ako se prozor sa datim identifikatorom već nalazi u listi, ne raditi ništa;
-- 3. zatvori x lst, čiji je tip zatvori :: Int -> [(Int, String)] -> [(Int, String)] koja iz liste prozora lst uklanja prozor sa identifikatorom x;
-- 4. tabUnapred n lst, čiji je tip tabUnapred :: Int -> [(Int, String)] -> [(Int, String)] koja ciklično pomera listu aktivnih prozora za n mesta ulevo, tako da prozor na mestu n
-- postane aktivni prozor;
-- 5. zatvoriSve str lst, čiji je tip zatvoriSve :: String -> [(Int, String)] -> [(Int, String)] koja iz liste prozora lst uklanja sve prozore koji u svom naslovu sadrže nisku str
-- (bez obzira na mala/velika slova);
-- 6. fokusiraj x lst, čiji je tip fokusiraj :: Int -> [(Int, String)] -> [(Int, String)] koja pomera prozor sa identifikatorom x iz liste prozora lst na mesto aktivnog prozora.
-- Redosled ostalih prozora ostaje isti. Ako se x ne nalazi u listi prozora, ne raditi ništa.

import Data.Char (toLower)
import Data.List (isInfixOf)

aktivni :: [(Int, String)] -> String
aktivni [] = ""
aktivni lst = snd (head lst)

otvori :: Int -> String -> [(Int, String)] -> [(Int, String)]
otvori x str lst
    | any (\(i, _) -> i == x) lst = lst
    | otherwise = (x, str) : lst
    
zatvori :: Int -> [(Int, String)] -> [(Int, String)]
zatvori x lst = filter (\(i, _) -> i /= x) lst

tabUnapred :: Int -> [(Int, String)] -> [(Int, String)]
tabUnapred n lst = 
    let k = n `mod` length lst
    in drop k lst ++ take k lst
    
zatvoriSve :: String -> [(Int, String)] -> [(Int, String)]
zatvoriSve str lst = filter (\(_, s) -> not (map toLower str `isInfixOf` map toLower s)) lst

fokusiraj :: Int -> [(Int, String)] -> [(Int, String)]
fokusiraj x lst = case break (\(i, _) -> i == x) lst of
                       (_, []) -> lst
                       (before, (x:after)) -> x : before ++ after
