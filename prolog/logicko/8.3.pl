/* losa implementacija - za pozitivne brojeve izvrsava oba pravila */
abs1(X, Y) :- X >= 0, Y is X.
abs1(X, Y) :- Y is -X.

/* dobra implementacija */
abs2(X, Y) :- X >= 0, Y is X.
abs2(X, Y) :- X < 0, Y is -X.

/* dobra implementacija - koriscenje operatora "cut", oznaka "!" */
abs3(X, Y) :- X >= 0, Y is X, !.
abs3(X, Y) :- Y is -X.
