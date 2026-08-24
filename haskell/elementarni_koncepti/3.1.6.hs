-- Napisati funkciju tipJednacine a b c, čiji je tip tipJednacine :: Int -> Int -> Int -> String koja vraća tip kvadratne jednačine ax^2 + bx + c = 0. Tip može biti: Degenerisana,
-- Jedno resenje, Dva resenja, ili Bez resenja. Koeficijenti kvadratne jednačine su celi brojevi

tipJednacine :: Int -> Int -> Int -> String
tipJednacine a b c
    | a == 0 = "Degenerisana"
    | (b*b - 4*a*c) == 0 = "Jedno resenje"
    | (b*b - 4*a*c) > 0 = "Dva resenja"
    | otherwise = "Nema resenja"
