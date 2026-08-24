sadrzi(X, [X|_]) :- !.
sadrzi(X, [G|R]) :- G \== X, sadrzi(X, R).

duzina([], 0).
duzina([_|R], L) :- duzina(R, L1), L is L1 + 1.

suma([], 0).
suma([G|R], S) :- number(G), suma(R, S1), S is S1 + G.

arsr([], 0).
arsr(L, A) :- duzina(L, D), D =\= 0, suma(L, S), A is S / D.

ucitaj(N, _) :- N < 0, !.
ucitaj(0, []).
ucitaj(N, [G|R]) :- N >= 1, write('unesi element '), read(G), nl, M is N - 1, ucitaj(M, R).
