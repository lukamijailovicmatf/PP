-- Definisati tip podataka Oblik koji može biti Kvadrat (karakterisan stranicom a), Pravougaonik (karakterisan dvema stranicama a i b), Krug (karakterisan poluprečnikom r) ili
-- Trougao (karakterisan sa tri stranice a, b i c). Dužine su realni brojevi.

data Oblik = Kvadrat Float
           | Pravougaonik Float Float
           | Krug Float
           | Trougao Float Float Float
           deriving (Show)
