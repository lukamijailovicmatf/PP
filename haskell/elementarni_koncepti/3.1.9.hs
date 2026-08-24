-- Napisati funkciju parMax p, čiji je tip parMax :: (Double, Double) -> Double koja odreduje veći element iz para realnih brojeva p

-- I nacin
parMax :: (Double, Double) -> Double
parMax p
    | fst p <= snd p = snd p
    | otherwise = fst p
    
    
-- II nacin
parMax' :: (Double, Double) -> Double
parMax' p = max (fst p) (snd p)


-- III nacin
parMax'' :: (Double, Double) -> Double
parMax'' (l, r) = max l r
