clan(X, [X|_]).
clan(X, [_|R]) :- clan(X, R).

% a)
duplikati([], []).
duplikati([G|R], L1) :- clan(G, R), !, duplikati(R, L1).
duplikati([G|R], [G|L1]) :- duplikati(R, L1).

% b)
unija([], L2, L2).
unija([G|R], L2, L) :- clan(G, L2), !, unija(R, L2, L).
unija([G|R], L2, [G|L]) :- unija(R, L2, L).

% c)
presek([], _, []).
presek([G|R], L2, [G|L]) :- clan(G, L2), !, presek(R, L2, L).
presek([_|R], L2, L) :- presek(R, L2, L).

% d)
razlika([], _, []).
razlika([G|R], L2, L) :- clan(G, L2), !, razlika(R, L2, L).
razlika([G|R], L2, [G|L]) :- razlika(R, L2, L).
