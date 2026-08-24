-- Napisati funkciju fib n, čiji je tip fib :: Integer -> Integer koja prima pozitivan ceo broj n i računa n-ti element Fibonačijevog niza

fib :: Integer -> Integer
fib 0 = 0
fib 1 = 1
fib n
    | n > 0 = fib (n - 1) + fib (n - 2)
    | otherwise = 0
