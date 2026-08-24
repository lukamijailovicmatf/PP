-- Napisati biblioteku funkcija za rad sa hemijskim elementima. 
-- Implementirati:
-- 1. Tip Element, koji se konstruiše konstruktorima Metal, Nemetal, Gas i Radioaktivan. Svaki konstruktor prima naziv elementa tipa String i valencu tipa Int. 
-- Podrazumevano instancirati klase Eq i Ord.
-- 2. Instancirati klasu Show za tip Element. Elementi se prikazuju u formatu "[METAL] s (v)", "[NEMETAL] s (v)", "[GAS] s (v)" i "[RADIOAKTIVAN] s (v)"
-- 3. pronadjiRadioaktivan elementi, čiji je tip pronadjiRadioaktivan :: [Element] -> Maybe String koja vraća naziv poslednjeg radioaktivnog elementa u listi, 
-- posmatrano prema rastuće sortiranom poretku. Ako lista ne sadrži radioaktivne elemente, vratiti Nothing.
-- 4. sortirajPoValenci elementi, čiji je tip sortirajPoValenci :: [Element] -> [Element] koja sortira elemente rastuće po valenci. Ako dva elementa imaju istu valencu,
-- koristiti podrazumevani poredak za tip Element.

import Data.List (sort, sortBy)

data Element = Metal String Int
             | Nemetal String Int
             | Gas String Int
             | Radioaktivan String Int
             deriving (Eq, Ord)
             
instance Show Element where
    show (Metal naziv valenca) = "[METAL] " ++ naziv ++ " (" ++ show valenca ++ ")"
    show (Nemetal naziv valenca) = "[NEMETAL] " ++ naziv ++ " (" ++ show valenca ++ ")"
    show (Gas naziv valenca) = "[GAS] " ++ naziv ++ " (" ++ show valenca ++ ")"
    show (Radioaktivan naziv valenca) = "[RADIOAKTIVAN] " ++ naziv ++ " (" ++ show valenca ++ ")"
    
pronadjiRadioaktivan :: [Element] -> Maybe String
pronadjiRadioaktivan elementi = case [naziv | Radioaktivan naziv _ <- sort elementi] of
                                     [] -> Nothing
                                     radioaktivni -> Just (last radioaktivni)
                                     
sortirajPoValenci :: [Element] -> [Element]
sortirajPoValenci elementi = sortBy (\e1 e2 -> compare (dohvatiValencu e1) (dohvatiValencu e2) <> compare e1 e2) elementi

dohvatiValencu :: Element -> Int
dohvatiValencu (Metal _ valenca) = valenca
dohvatiValencu (Nemetal _ valenca) = valenca
dohvatiValencu (Gas _ valenca) = valenca
dohvatiValencu (Radioaktivan _ valenca) = valenca
