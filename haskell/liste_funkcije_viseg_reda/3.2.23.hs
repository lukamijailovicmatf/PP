-- Napisati funkciju ukloniDuplikate l, čiji je tip ukloniDuplikate :: [a] -> [a] koja uklanja sve duplikate iz liste l

ukloniDuplikate :: Eq a => [a] -> [a]
ukloniDuplikate [] = []
ukloniDuplikate l = foldr (\x acc -> x : filter (/= x) acc) [] l
