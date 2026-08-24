-- Napisati biblioteku funkcija za rad sa log porukama. Implementirati:
-- 1. Tip LogPoruka, koji se konstruiše konstruktorima Debug, Info, Warn i Error. Svaki konstruktor prima sadržaj poruke tipa String. Podrazumevano instancirati 
-- klase Eq i Ord. Poruke se porede prvo po nivou, redom Debug < Info < Warn < Error, a zatim leksikografski po sadržaju.
-- 2. Instancirati klasu Show za tip LogPoruka. Poruke se prikazuju u formatu "[DEBUG] s", "[INFO] s", "[WARN] s" i "[ERROR] s".
-- 3. greska poruke, čiji je tip greska :: [LogPoruka] -> Maybe String koja vraća sadržaj poslednje greške u listi poruke, posmatrano prema rastuće sortiranom poretku. 
-- Ako lista ne sadrži greške, vratiti Nothing.
-- 4. sortirajPoDuzini poruke, čiji je tip sortirajPoDuzini :: [LogPoruka] -> [LogPoruka] koja sortira poruke rastuće po dužini sadržaja. Ako dve poruke
-- imaju istu dužinu sadržaja, koristiti podrazumevani poredak za tip LogPoruka.

import Data.List (sort, sortBy)

data LogPoruka = Debug String
               | Info String
               | Warn String
               | Error String
               deriving (Eq, Ord)
               
instance Show LogPoruka where
    show (Debug poruka) = "[DEBUG] " ++ poruka
    show (Info poruka) = "[INFO] " ++ poruka
    show (Warn poruka) = "[WARN] " ++ poruka
    show (Error poruka) = "[ERROR] " ++ poruka
    
greska :: [LogPoruka] -> Maybe String
greska poruke = case [poruka | Error poruka <- sort poruke] of
                     [] -> Nothing
                     greske -> Just (last greske)
                     
sortirajPoDuzini :: [LogPoruka] -> [LogPoruka]
sortirajPoDuzini poruke = sortBy (\p1 p2 -> compare (length (sadrzaj p1)) (length (sadrzaj p2)) <> compare p1 p2) poruke

sadrzaj :: LogPoruka -> String
sadrzaj (Debug poruka) = poruka
sadrzaj (Info poruka) = poruka
sadrzaj (Warn poruka) = poruka
sadrzaj (Error poruka) = poruka
