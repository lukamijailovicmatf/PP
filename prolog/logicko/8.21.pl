interval(X, Y, []) :- X > Y.
interval(X, Y, [X|R]) :- X =< Y, X1 is X + 1, interval(X1, Y, R).
