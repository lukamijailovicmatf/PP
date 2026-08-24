-- Definisati tipove podataka Krug, Prav i Kvadrat. Tip Krug sadrži poluprečnik, Prav širinu i visinu, dok Kvadrat sadrži dužinu stranice. Zatim definisati klasu Oblik koja
-- opisuje geometrijske oblike, i sastoji se od funkcija: povrsina :: a -> Double i obim :: a -> Double. Instancirati klasu Oblik za tipove Krug, Prav i Kvadrat.

data Krug = MkKrug Double
data Prav = MkPrav Double Double
data Kvadrat = MkKvadrat Double

class Oblik a where
    povrsina :: a -> Double
    obim :: a -> Double
    
instance Oblik Krug where
    povrsina (MkKrug r) = r * r * pi     -- r ^ 2 * pi
    obim (MkKrug r) = 2 * r * pi
    
instance Oblik Prav where
    povrsina (MkPrav a b) = a * b
    obim (MkPrav a b) = 2 * (a + b)
    
instance Oblik Kvadrat where
    povrsina (MkKvadrat a) = a * a    -- a ^ 2
    obim (MkKvadrat a) = 4 * a
