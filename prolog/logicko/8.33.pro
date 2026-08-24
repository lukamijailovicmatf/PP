uzastopni(X, Y, Z, [X,Y,Z|_]).
uzastopni(X, Y, Z, [_|R]) :- uzastopni(X, Y, Z, R).
