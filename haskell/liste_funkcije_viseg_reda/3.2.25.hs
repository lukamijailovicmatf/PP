-- Kasirka Mica mora da ručno kuca artikle na kasi jer se pokvario skener barkodova. Pomozite Mici da taj posao obavi što brže grupisanjem artikala iste vrste na pokretnoj traci.
-- Napisati funkciju grupisi l, čiji je tip grupisi :: [String] -> [[String]] koja grupiše sva uzastopna ponavljanja nekog elementa liste l u podlistu tako da rezultat bude lista
-- listi

grupisi :: [String] -> [[String]]
grupisi [] = []
grupisi (x:xs) = let (isti, ostali) = span (==x) xs
                 in (x : isti) : grupisi ostali
