kompresuj([], []).
kompresuj([X], [X]).
kompresuj([X,X|R], KL) :- kompresuj([X|R], KL).
kompresuj([X,Y|R], [X|KLR]) :- X \= Y, kompresuj([Y|R], KLR).
