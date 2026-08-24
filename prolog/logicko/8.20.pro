ogledalo(L1, L2) :- obrni(L2, [], L1).

obrni([], Akumulator, Akumulator).
obrni([G|R], Akumulator, Rezultat) :- obrni(R, [G|Akumulator], Rezultat).
