-- Napisati biblioteku za rad sa tačkama u ravni. Definisati tipove Tacka (alias za par, gde su koordinate realni brojevi) i Putanja (alias za listu tačaka).
-- Implementirati funkcije:
-- 1. tacka x y, koja konstruiše tačku sa datim koordinatama x i y,
-- 2. putanja ts, koja konstruiše putanju od date liste tačaka ts,
-- 3. duzinaPutanje p, koja vraća dužinu putanje p,
-- 4. translirajTacku t dx dy, koja translira tacku t za vektor (dx, dy),
-- 5. rastojanje t1 t2, koja vraća rastojanje izmedu tačaka t1 i t2,
-- 6. uKrugu r ts, koja iz liste tačaka ts vraća one koje se nalaze u krugu poluprečnika r od tačke (0,0),
-- 7. translirajPutanju p dx dy, koja translira sve tačke putanje p za vektor (dx, dy),
-- 8. nadovezi t p, koja nadovezuje tačku t na kraj putanje p,
-- 9. spojiPutanje p1 p2, koja spaja putanje p1 i p2 i vraća novu putanju,
-- 10. centroid ts, koja vraća centroid liste tačaka ts,
-- 11. kvadrantTacke t, koja vraća kvadrant tačke t (broj u intervalu [1, 4], 0 ako je u pitanju koordinatni početak),
-- 12. kvadrantPutanje p, koja vraća kvadrant u kom se nalazi putanja p ako je ona u celosti sadržana u nekom od njih, 0 inače,
-- 13. tackeUKvadrantu kv ts, koja iz liste tačaka ts vraća samo one koje se nalaze u kvadrantu kv,
-- 14. tackeVanKvadranta kv ts, koja iz liste tačaka ts vraća one koje se nalaze van kvadranta kv, i
-- 15. maksimumi ts, koja vraća uredjeni par koji predstavlja maksimume x i y koordinata tačaka liste ts

type Tacka = (Float, Float)
type Putanja = [Tacka]

tacka :: Float -> Float -> Tacka
tacka x y = (x,y)

putanja :: [Tacka] -> Putanja
putanja ts = ts        -- putanja = id

duzinaPutanje :: Putanja -> Int
duzinaPutanje p = length p

translirajTacku :: Tacka -> Float -> Float -> Tacka
translirajTacku (x,y) dx dy = tacka (x + dx) (y + dy)

rastojanje :: Tacka -> Tacka -> Float
rastojanje (x1,y1) (x2,y2) = sqrt ((x1-x2)^2 + (y1-y2)^2)

o :: Tacka
o = (0.0,0.0)

uKrugu :: Float -> [Tacka] -> [Tacka]
uKrugu r ts = [t | t <- ts, rastojanje o t < r]

translirajPutanju :: Putanja -> Float -> Float -> Putanja
translirajPutanju p dx dy = map (\t -> translirajTacku t dx dy) p

nadovezi :: Tacka -> Putanja -> Putanja
nadovezi t p = p ++ [t]        -- nadovezi t p = reverse (t : (reverse p))

spojiPutanje :: Putanja -> Putanja -> Putanja
spojiPutanje p1 p2 = p1 ++ p2

centroid :: [Tacka] -> Tacka
centroid ts = tacka prosekX prosekY
    where prosekX = prosek (map fst ts)
          prosekY = prosek (map snd ts)
          prosek lts = (sum lts) / (fromIntegral (length lts))
          
kvadrantTacke :: Tacka -> Int
kvadrantTacke (x,y)
    | x > 0 && y > 0 = 1
    | x < 0 && y > 0 = 2
    | x < 0 && y < 0 = 3
    | x > 0 && y < 0 = 4
    | otherwise = 0
    
kvadrantPutanje :: Putanja -> Int
kvadrantPutanje p = if istiKvadranti then (head kvadranti) else 0
    where kvadranti = map kvadrantTacke p
          istiKvadranti = all (== head kvadranti) (tail kvadranti)
          
tackeUKvadrantu :: Int -> [Tacka] -> [Tacka]
tackeUKvadrantu kv ts =  filter (\t -> kvadrantTacke t == kv) ts

tackeVanKvadranta :: Int -> [Tacka] -> [Tacka]
tackeVanKvadranta kv ts = filter (\t -> kvadrantTacke t /= kv) ts   

maksimumi :: [Tacka] -> (Float, Float)
maksimumi lst = (maksimum (map fst lst), maksimum (map snd lst))
    where maksimum (x:xs) = foldl (\acc e -> if e > acc then e else acc) x xs
