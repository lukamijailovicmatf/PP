-- Napisati funckije glava i rep koje bezbedno vraćaju glavu i rep liste, koristeći tip koji reprezentuje dve mogućnosti — vrednost glave liste, ili poruku o grešci (u primeru
-- ispod leva vrednost označava grešku, dok desna označava validnu vrednost).

glava :: [a] -> Either String a
glava [] = Left "Prazna lista"
glava (x:_) = Right x

rep :: [a] -> Either String [a]
rep [] = Left "Prazna lista"
rep (_:xs) = Right xs
