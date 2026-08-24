-- Definisati tip podataka UList a koji implementira jednostruko povezanu listu elemenata tipa a. Definisati konstruktore Empty (za konstrukciju prazne liste) i Cons x xs za
-- nadovezivanje elementa x (tipa a) na listu xs (tipa UList a. Instancirati klase Show (sa formatom kao u test primerima ispod), Eq, i Foldable za tip UList

data UList a = Empty | Cons a (UList a)

instance Show a => Show (UList a) where
    show xs = "<" ++ show (toList xs) ++ ">"
        where toList Empty = []
              toList (Cons x xs) = x : toList xs
              
instance Eq a => Eq (UList a) where
    Empty == Empty = True
    Cons x xs == Cons y ys = x == y && xs == ys
    _ == _ = False
    
instance Foldable UList where
    foldr f init Empty = init
    foldr f init (Cons x xs) = f x (foldr f init xs)
