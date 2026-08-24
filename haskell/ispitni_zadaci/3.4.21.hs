-- Definisati tip DnevniPodaci koji predstavlja podatke o jednom danu: temperatura :: Int i padavine :: Int. Napisati funkcije:
-- 1. suviDani :: [DnevniPodaci] -> [Int] koja vraća temperature svih dana bez padavina;
-- 2. rasponSuvihDana :: [DnevniPodaci] -> Int koja vraca razliku u temperaturi izmedu najtoplijeg i najhladnijeg dana koji nemaju padavine, ili 0 ako nema takvih dana;
-- 3. topliPadavniDani :: [DnevniPodaci] -> Int -> [DnevniPodaci] koja vraca sve dane sa padavinama čija temperatura je iznad zadate granice;
-- 4. stvarniOsecaj :: [DnevniPodaci] -> [DnevniPodaci] koja vraca listu dana sa istom vrednošću padavina, ali sa temperaturom prilagodjenom prema formuli stvarnog osećaja. Za
-- svaki dan računamo: T_osećaj = ⌊ T_temperatura − 0.3 · P_padavine ⌋

data DnevniPodaci = DnevniPodatak { temperatura :: Int,
                                    padavine :: Int
                                  } deriving (Show)
                    
suviDani :: [DnevniPodaci] -> [Int]
suviDani lst = map temperatura (filter (\d -> padavine d == 0) lst)

rasponSuvihDana :: [DnevniPodaci] -> Int
rasponSuvihDana lst = 
    let sviSuvi = suviDani lst
        maxTemp = maximum sviSuvi
        minTemp = minimum sviSuvi
    in if null sviSuvi then 0 else maxTemp - minTemp
    
topliPadavniDani :: [DnevniPodaci] -> Int -> [DnevniPodaci]
topliPadavniDani lst t = filter (\d -> padavine d > 0 && temperatura d > t) lst

stvarniOsecaj :: [DnevniPodaci] -> [DnevniPodaci]
stvarniOsecaj lst = map (\d -> let t = temperatura d
                                   p = padavine d
                                   newT = floor (fromIntegral t - 0.3 * fromIntegral p)
                               in DnevniPodatak newT p) lst
