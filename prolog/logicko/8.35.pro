prefiksi(_, []).
prefiksi([G|R], [G|PR]) :- prefiksi(R, PR).
