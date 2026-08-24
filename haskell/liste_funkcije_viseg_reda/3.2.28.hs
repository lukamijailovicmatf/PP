-- Definisati funkciju varijacije l k, čiji je tip varijacije :: [a] -> Int -> [[a]] koja generiše listu koja sadrži sve varijacije sa ponavljanjem elemenata date 
-- liste l dužine k

varijacije :: [a] -> Int -> [[a]]
varijacije l 0 = [[]]
varijacije l k = concat (map (\x -> map (x:) ys) l)
    where ys = varijacije l (k-1)
