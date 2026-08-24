-- Napisati biblioteku koja pomaže pri radu sa oblicima u 2D ravni.
-- Implementirati:
-- 1. tip podataka Point2D koji se može konstruisati putem konstruktora MkPoint i sadrži dva atributa x i y, tipa Float, kao i funkcije x i y koje služe kao 
-- geteri za polja x i y;
-- 2. prikaz i poredenje — podrazumevano instancirati Show i Eq nad tipom Point2D;
-- 3. funkciju point p, čiji je tip point :: (Float, Float) -> Point2D koja pravi tačku od prosledenog para koordinata
-- 4. funkciju line p1 p2, čiji je tip line :: Point2D -> Point2D -> (Float, Float) koja vraća par (k,n) gde su k i n parametri prave y = kx + n koja prolazi krož tačke p1 i p2
-- (pretpostaviti da rezultat neće biti prava sa beskonačnim koeficijentom pravca);
-- 5. funkciju dist p1 p2, čiji je tip dist :: Point2D -> Point2D -> Float koja vraća euklidsko rastojanje izmedu tačaka p1 i p2;
-- 6. funkciju maxP f lst, čiji je tip maxP :: (Point2D -> Float) -> [Point2D] -> Float koja vraća maksimalnu vrednost od svih vrednosti dobijenih primenom funkcije f na tačke iz
-- neprazne liste lst.

data Point2D = MkPoint Float Float
    deriving (Show, Eq)
    
x :: Point2D -> Float
x (MkPoint a _) = a

y :: Point2D -> Float
y (MkPoint _ b) = b

point :: (Float, Float) -> Point2D
point (a, b) = MkPoint a b

line :: Point2D -> Point2D -> (Float, Float)
line p1 p2 = let k = (y p2 - y p1) / (x p2 - x p1)
                 n = y p1 - k * x p1
             in (k, n)
             
dist :: Point2D -> Point2D -> Float
dist p1 p2 = sqrt ((y p2 - y p1)^2 + (x p2 - x p1)^2)

maxP :: (Point2D -> Float) -> [Point2D] -> Float
maxP f lst = maximum (map f lst)
