-- Napisati funkciju ceoDeo x, čiji je tip ceoDeo :: Int -> Int koja računa ceo deo korena pozitivnog celog broja x (bez korišćenja ugradenih funkcija za koren i/ili stepen)

ceoDeo :: Int -> Int
ceoDeo x = ceoDeo' x 1
    where ceoDeo' x i
            | (i * i) > x = (i - 1)
            | otherwise = ceoDeo' x (i + 1)
