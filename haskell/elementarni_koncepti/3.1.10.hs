-- Napisati funkciju sumaKvadrata n, čiji je tip sumaKvadrata :: Int -> Int koja prima pozitivan ceo broj n i računa sumu kvadrata prvih n prirodnih brojeva 
-- (bez korišćenja formule)

-- I nacin
sumaKvadrata :: Int -> Int
sumaKvadrata n = sum (map (^2) [1..n])


-- II nacin
sumaKvadrata' :: Int -> Int
sumaKvadrata' n = sum $ map (^2) $ [1..n]
