-- Suzana uči brojanje i razlikovanje boja koristeći kutiju punu jednobojnih kuglica. Ona prvo žmureći iz kutije izvuče odredeni broj kuglica i poreda ih u niz u redosledu
-- izvlačenja. Zatim izabere proizvoljnu boju i odredi na kojoj se sve poziciji u nizu izvučenih kuglica nalazi kuglica željene boje. Napisati funkciju pozicije k l, čiji je tip -- pozicije :: String -> [String] -> [Int] koja vraća listu pozicija kuglice k u listi l

pozicije :: String -> [String] -> [Int]
pozicije x [] = []
pozicije x lista = [i | (x1, i) <- zip lista [0..], x == x1]
