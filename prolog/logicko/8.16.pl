maxEl([X], M) :- M is X.
maxEl([G|R], X) :- maxEl(R, Y), G < Y, X is Y.
maxEl([G|R], X) :- maxEl(R, Y), G >= Y, X is G.
