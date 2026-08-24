-- Podaci o temperaturama za narednih nekoliko dana u gradu su zadati kao alias: type Temperature = [Double]. 
-- Definisati funkcije:
-- 1. promena :: Temperature -> Double -> Int -> Temperature koja za date podatke o temperaturama, realan broj d i ceo broj n menja temperature dana za d stepeni 
-- počev od n-tog. Pretpostaviti da je indeks n ispravno zadat i da se broji od 0 u listi.
-- 2. topliji :: Temperature -> Temperature -> Double -> Temperature koja menja temperature svih dana iz grada u kom ima više toplijih dana za d stepeni i vraća 
-- novodobijene temperature za taj grad. Pretpostaviti da u datim listama, podaci na istim pozicijama odgovaraju istim danima i da su liste jednakih dužina. U 
-- slučaju da je broj toplijih dana isti, modifikovati temperature za prvi grad.

type Temperature = [Double]

promena :: Temperature -> Double -> Int -> Temperature
promena [] _ _ = []
promena [x] d _ = [x + d]
promena lst d n =
    let (preN, posleN) = splitAt n lst
        posleNModifikovano = map (\x -> x + d) posleN
    in preN ++ posleNModifikovano
    
topliji :: Temperature -> Temperature -> Double -> Temperature
topliji lst1 lst2 d = 
    let brojac1 = length [(a, b) | (a, b) <- zip lst1 lst2, a > b]
        brojac2 = length [(a, b) | (a, b) <- zip lst1 lst2, a < b]
    in if brojac1 >= brojac2 then map (\x -> x + d) lst1 else map (\x -> x + d) lst2
