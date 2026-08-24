opadajuce(0, []).
opadajuce(N, [N|R]) :- N > 0, N1 is N - 1, opadajuce(N1, R).
