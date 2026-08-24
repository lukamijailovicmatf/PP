resenje(Deca) :-
    length(Deca, 5),

    clan(dete(_, _, 2), Deca),
    clan(dete(_, _, 3), Deca),
    clan(dete(_, _, 4), Deca),
    clan(dete(_, _, 5), Deca),
    clan(dete(_, _, 6), Deca),

    clan(dete(kata, _, GK), Deca),
    clan(dete(lazar, jankovic, _), Deca),
    clan(dete(marko, _, GM), Deca),
    clan(dete(nevenka, _, GN), Deca),
    clan(dete(ognjen, _, GO), Deca),

    clan(dete(_, filipovic, GF), Deca),
    clan(dete(_, grbovic, _), Deca),
    clan(dete(_, hadzic, GH), Deca),
    clan(dete(_, ivanovic, GI), Deca),

    GK is GI + 1,
    GI is GN + 1,
    GF is GM + 3,
    GO is 2 * GH.
    
clan(X, [X|_]).
clan(X, [_|R]) :- clan(X, R).
