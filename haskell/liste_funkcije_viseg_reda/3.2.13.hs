-- U toku su prijave za plesno takmičenje parova. Pored nagrade za najbolji par, dodeljuju se i pojedinačne nagrade za najboljeg ženskog i muškog takmičara. Da bi žiri
-- jednostavnije beležio poene i odredio nagrade, potrebno je da im se dostave, pored liste parova koji se takmiče, i liste samo muških, tj. samo ženskih takmičara, odvojeno.
-- Napisati funkciju listaUPar lista, čiji je tip listaUPar :: [(String, String)] -> ([String], [String]) koja pretvara listu parova u par dve liste, tako da prva lista sadrži
-- prve elemente svih parova, a druga druge elemente svih parova pod pretpostavkom da je prvi u paru uvek ženska osoba, a drugi muška

-- I nacin
listaUPar :: [(String, String)] -> ([String], [String])
listaUPar [] = ([], [])
listaUPar lista = foldr (\(a,b) (c,d) -> (a:c, b:d)) ([], []) lista


-- II nacin
listaUPar' :: [(String, String)] -> ([String], [String])
listaUPar' l = unzip l


-- III nacin
listaUPar'' :: [(String, String)] -> ([String], [String])
listaUPar'' [] = ([], [])
listaUPar'' ((x,y) : xs) = (x:l1, y:l2)
    where l1 = fst rep
          l2 = snd rep
          rep = listaUPar xs
