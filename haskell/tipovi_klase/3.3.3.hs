-- Definisati tip podataka Prav karakterisan dvema realnim stranicama a i b. Postarati se da se pravougaonici mogu porediti po jednakosti i prikazati u formatu [a x b]

data Prav = MkPrav { a :: Float,
                     b :: Float
                   }
                   
instance Show Prav where
    show (MkPrav a b) = "[" ++ show a ++ " x " ++ show b ++ "]"
    
instance Eq Prav where
    (==) (MkPrav a1 b1) (MkPrav a2 b2) = (a1 == a2 && b1 == b2 || a1 == b2 && b1 == a2)
