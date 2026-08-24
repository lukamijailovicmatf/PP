ime(petra).
ime(milica).
ime(lenka).
ime(jovana).

isto_slovo(petra, peric).
isto_slovo(milica, mikic).
isto_slovo(lenka, lazic).
isto_slovo(jovana, jovic).

svi_razliciti([]).
svi_razliciti([G|R]) :- \+ member(G, R), svi_razliciti(R).

resi_zagonetku(Porodice) :-
    Porodice = [
        porodica(M1, peric, D1),
        porodica(M2, mikic, D2),
        porodica(M3, lazic, D3),
        porodica(M4, jovic, D4)
    ],
    ime(M1), ime(M2), ime(M3), ime(M4),
    svi_razliciti([M1, M2, M3, M4]),
    ime(D1), ime(D2), ime(D3), ime(D4),
    svi_razliciti([D1, D2, D3, D4]),
    \+ isto_slovo(M1, peric),
    \+ isto_slovo(M2, mikic),
    \+ isto_slovo(M3, lazic),
    \+ isto_slovo(M4, jovic),
    \+ isto_slovo(D1, peric),
    \+ isto_slovo(D2, mikic),
    \+ isto_slovo(D3, lazic),
    \+ isto_slovo(D4, jovic),
    M1 \= D1,
    M2 \= D2,
    M3 \= D3,
    M4 \= D4,
    member(porodica(milica, _, MilicinaCerka), Porodice), M1 = MilicinaCerka,
    member(porodica(lenka, _, petra), Porodice).
