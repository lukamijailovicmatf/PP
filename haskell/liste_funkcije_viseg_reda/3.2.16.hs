-- Data je lista l koja sadrži liste ocena raznih učenika osnovne škole. Definisati funkciju prosekOdlicni l, čiji je tip prosekOdlicni :: [Int] -> Double koja računa prosek svih
-- odličnih učenika čije su ocene date u listi l

    prosekOdlicni :: [[Int]] -> Double
    prosekOdlicni l = prosek (filter (>= 4.5) (map prosek l))
        where prosek xs = realToFrac (sum xs) / realToFrac (length xs)
