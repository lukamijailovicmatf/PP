-- Definisati tip podataka Zivotinja koji može biti Pas, Macka ili Papagaj. Zatim definisati tip Ljubimac karakterisan imenom, godinama i tipom životinje.

data Zivotinja = Pas | Macka | Papagaj
    deriving (Show)

data Ljubimac = MkLjubimac { ime :: String,
                             godine :: Int,
                             tip :: Zivotinja
                           } deriving (Show)
