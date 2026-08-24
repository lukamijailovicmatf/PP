izbaci3(N, _) :- \+ integer(N), write('Argument mora biti ceo broj.'), nl, fail.
izbaci3(N, _) :- N < 0, write('Broj mora biti pozitivan.'), nl, fail.
izbaci3(N, X) :- obradi(N, X).

obradi(0, 0).
obradi(N, X) :- N > 0, Cifra is N mod 10, Cifra < 3, N1 is N div 10, obradi(N1, X).
obradi(N, X) :- N > 0, Cifra is N mod 10, Cifra >= 3, N1 is N div 10, obradi(N1, X1), X is X1 * 10 + Cifra.
