izdvojPoslednji([G], G, []).
izdvojPoslednji([G|R], X, [G|R1]) :- izdvojPoslednji(R, X, R1).

pretvori([], 0).
pretvori(L, X) :- izdvojPoslednji(L, Poslednji, Ostatak), pretvori(Ostatak, Y), X is Poslednji + 10 * Y.
