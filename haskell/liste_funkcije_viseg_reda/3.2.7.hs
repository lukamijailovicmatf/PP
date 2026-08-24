-- Napisati funkciju fibLista n, čiji je tip fibLista :: Int -> [Int] koja prima pozitivan ceo broj n i pravi listu prvih n elemenata Fibonačijevog niza

fibLista :: Int -> [Int]
fibLista n = take n (fibs)
    where fibs = 1 : 1 : zipWith (+) fibs (tail fibs)
