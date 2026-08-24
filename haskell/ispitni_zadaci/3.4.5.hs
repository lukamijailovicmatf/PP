-- Napisati biblioteku za pojednostavljenu serijalizacijua osnovnih struktura podataka u format JSON. Implementirati funkcije:
-- 1. tupJ t, čiji je tip tupJ :: (Show a, Show b) => (a,b) -> String koja vraća JSON reprezentaciju para t (pretpostaviti da serijalizacija elementa e para t 
-- odgovara pozivu:show e);
-- 2. lstJ lst, čiji je tip lstJ :: Show a => [a] -> String koja vraća JSON reprezentaciju liste lst (pretpostaviti da serijalizacija elementa e liste lst 
-- odgovara pozivu: show e);
-- 3. flstJ p lst, čiji je tip flstJ :: Show a => ([a] -> Bool) -> [[a]] -> [String] koja vraća listu serijalizovanih listi liste lst za koje važi predikat p;
-- 4. zipJ lst, čiji je tip zipJ :: Show a => [a] -> [(a, String)] koja serijalizuje svaki element e liste lst u nisku json i vraća listu parova (e, json) 
-- (pretpostaviti da serijalizacija elementa e liste lst odgovara pozivu: show e).

tupJ :: (Show a, Show b) => (a, b) -> String
tupJ (a, b) = "(" ++ show a ++ ", " ++ show b ++ ")"

lstJ :: Show a => [a] -> String
lstJ lst = show lst

flstJ :: Show a => ([a] -> Bool) -> [[a]] -> [String]
flstJ p lst = map lstJ (filter p lst)

zipJ :: Show a => [a] -> [(a, String)]
zipJ lst = map (\x -> (x, show x)) lst
