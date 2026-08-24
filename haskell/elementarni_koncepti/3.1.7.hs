-- Napisati funkciju izDekadne x osnova, čiji je tip izDekadne :: Int -> Int -> Int koja prebacuje ceo broj x iz dekadne u osnovu osnova;
-- i funkciju uDekadnu x osnova, čiji je tip uDekadnu :: Int -> Int -> Int koja prebacuje ceo broj x iz osnove osnova u dekadnu osnovu. Pretpostaviti da je 1 < osnova < 10

izDekadne :: Int -> Int -> Int
izDekadne x osn = 
    if x == 0 then 0
    else izDekadne (x `div` osn) osn * 10 + (x `mod` osn)
    
    
uDekadnu :: Int -> Int -> Int
uDekadnu x osn = 
    if x == 0 then 0
    else uDekadnu (x `div` 10) osn * osn + (x `mod` 10)
