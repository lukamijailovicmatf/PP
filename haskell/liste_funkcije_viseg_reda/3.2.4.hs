-- Definisati funkciju prefixN l, čiji je tip prefixN :: [Int] -> [Int] koja izdvaja najduži prefiks negativnih elemenata celobrojne liste l

prefixN :: [Int] -> [Int]
prefixN l = takeWhile (< 0) l
