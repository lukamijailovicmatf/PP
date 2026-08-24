-- Napisati funkciju proizvodPrvihN n, čiji je tip proizvodPrvihN :: Integer -> Integer koja prima pozitivan ceo broj n i vraća n! (faktorijel broja n)

proizvodPrvihN :: Integer -> Integer
proizvodPrvihN n
    | n < 1 = 0
    | n == 1 = 1
    | otherwise = n * proizvodPrvihN (n - 1)
