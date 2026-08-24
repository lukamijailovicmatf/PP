-- Definisati tip podataka OList a koji implementira jednostruko povezanu listu elemenata tipa a. Definisati konstruktore End (za konstrukciju prazne liste) i (:/:) x xs za
-- nadovezivanje elementa x (tipa a) na listu xs (tipa OList a. Konstruktor (:/:) implementirati kao infiksni binarni operator. Instancirati klase Show (sa formatom kao u test
-- primerima ispod), Eq, i Foldable za tip OList. Definisati infiksni operator (+/+), čiji je tip OList a -> OList a -> OList a, koji spaja dve liste tipa OList a.

infixr 7 :/:

data OList a = End
             | (:/:) a (OList a)

instance Show a => Show (OList a) where
    show xs = ":" ++ show (toList xs) ++ ":"
        where toList End = []
              toList (x :/: xs) = x : toList xs
              
instance Eq a => Eq (OList a) where
    End == End = True
    (x :/: xs) == (y :/: ys) = x == y && xs == ys
    _ == _ = False
    
instance Foldable OList where
    foldr f init End = init
    foldr f init (x :/: xs) = f x (foldr f init xs)
    
(+/+) :: OList a -> OList a -> OList a
End +/+ ys = ys
(x :/: xs) +/+ ys = x :/: (xs +/+ ys) 
