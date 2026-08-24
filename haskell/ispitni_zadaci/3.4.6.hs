-- Kreirati biblioteku za serijalizaciju vremenskih podataka u format JSON. Biblioteka treba da omogući serijalizaciju kroz metod ser klase (osobine) Serializable. 
-- Implementirati:
-- 1. tip podataka Point koji predstavlja par realnih koordinata (tipa Float) i koji se konstruiše putem konstruktora MkPoint;
-- 2. tip podataka WeatherInfo koji se sastoji od lokacije (tipa Point) i temperature na datoj lokaciji (tipa Float) i koji se konstruiše putem konstruktora MkWeatherInfo.
-- Instancirati:
-- 1. klasu Serializable za tip Float;
-- 2. klasu Serializable za tip Point kao uredeni par koordinata;
-- 3. klasu Serializable za tip WeatherInfo kao objekat sa atributima loc i temp.

class Serializable a where
    ser :: a -> String
    
data Point = MkPoint Float Float
data WeatherInfo = MkWeatherInfo Point Float

instance Serializable Float where
    ser x = show x
    
instance Serializable Point where
    ser (MkPoint x y) = "(" ++ show x ++ ", " ++ show y ++ ")"

instance Serializable WeatherInfo where
    ser (MkWeatherInfo p t) = "{ 'loc': " ++ ser p ++ ", 'temp': " ++ show t ++ " }"
