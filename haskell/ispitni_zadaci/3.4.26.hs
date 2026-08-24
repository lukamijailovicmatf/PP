-- Podaci o broju poena na ispitu u jednom roku za nekoliko studenata su zadati kao type Poeni = [Double]. 
-- Definisati funkcije:
-- 1. promena :: Poeni -> Double -> Int -> Poeni koja za date podatke o poenima, realan broj d i ceo broj n, dodaje svakom studentu d poena, počev od n-tog studenta u
-- spisku poena. Pretpostaviti da je indeks n ispravno zadat i da se broji od 0 u listi.
-- 2. bolji :: Poeni -> Poeni -> Double -> Poeni koja za poene studenata iz dva ispitna roka menja za d sve poene u onom roku u kom studenti ukupno imaju više poena
-- i vraća novodobijene poene za taj rok. U slučaju da je ukupan broj poena za oba roka isti, modifikovati poene za prvi rok.

type Poeni = [Double]

promena :: Poeni -> Double -> Int -> Poeni
promena [] _ _ = []
promena [x] d _ = [x + d]
promena lst d n = 
    let (preN, posleN) = splitAt n lst
        posleNModifikovano = map (\x -> x + d) posleN
    in preN ++ posleNModifikovano
    
bolji :: Poeni -> Poeni -> Double -> Poeni
bolji lst1 lst2 d = 
    let brojac1 = length [(a, b) | (a, b) <- zip lst1 lst2, a > b]
        brojac2 = length [(a, b) | (a, b) <- zip lst1 lst2, a < b]
    in if brojac1 >= brojac2 then map (\x -> x + d) lst1 else map (\x -> x + d) lst2
