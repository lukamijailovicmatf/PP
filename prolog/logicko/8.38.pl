form(N, []) :- N =< 1.
form(N, [N1|R]) :- N > 1, N1 is N - 1, N1 mod 5 =:= 0, form(N1, R).
form(N, R) :- N > 1, N1 is N - 1, N1 mod 5 =\= 0, form(N1, R).
