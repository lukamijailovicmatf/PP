-- Napisati funkciju poslednji l, čiji je tip poslednji :: [a] -> a koja odreduje poslednji element neprazne liste l

-- I nacin
poslednji :: [a] -> a
poslednji l = l !! pozicija
    where pozicija = (length l) - 1
    
    
-- II nacin
poslednji' :: [a] -> a
poslednji' l = last l
