-- Napisati funckije glava i rep koje bezbedno vraćaju glavu i rep liste, koristeći tip koji enkapsulira opcionu vrednost.

glava :: [a] -> Maybe a
glava [] = Nothing
glava (x:_) = Just x

rep :: [a] -> Maybe [a]
rep [] = Nothing
rep (_:xs) = Just xs
