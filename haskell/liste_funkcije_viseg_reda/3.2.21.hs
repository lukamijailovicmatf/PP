-- Napisati funkciju ubaci k e l, čiji je tip ubaci :: Int -> a -> [a] -> [a] koja ubacuje u listu l na poziciju k element e. U slučaju da je zadata neispravna pozicija
-- u listi, dodati element e na kraj liste

-- I nacin
ubaci :: Int -> a -> [a] -> [a]
ubaci _ e [] = [e]
ubaci k e l = if (k < (length l) - 1 || k > (length l) - 1) 
              then l ++ [e] 
              else (foldr (\(i,x) acc -> if i == k then e:x:acc else x:acc) [] (zip [0..] l))
            
              
-- II nacin
ubaci' :: Int -> a -> [a] -> [a]
ubaci' 0 e l = e:l
ubaci' k e [] = [e]
ubaci' k e (x:xs) = x : (ubaci' (k-1) e xs)
