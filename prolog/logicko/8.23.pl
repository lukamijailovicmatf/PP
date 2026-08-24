sortirana(L) :- rastuca(L).
sortirana(L) :- opadajuca(L).

rastuca([]).
rastuca([_]).
rastuca([G1,G2|R]) :- G1 =< G2, rastuca([G2|R]).

opadajuca([]).
opadajuca([_]).
opadajuca([G1,G2|R]) :- G1 >= G2, opadajuca([G2|R]).
