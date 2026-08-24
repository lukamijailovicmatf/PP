spoji([], L2, L2).
spoji(L1, [], L1).
spoji([G1|R1], [G2|R2], [G1|R]) :- G1 =< G2, spoji(R1, [G2|R2], R).
spoji([G1|R1], [G2|R2], [G2|R]) :- G1 > G2, spoji([G1|R1], R2, R).
