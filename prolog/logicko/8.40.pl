svi_razliciti([]).
svi_razliciti([G|R]) :- \+ member(G, R), svi_razliciti(R).

pre(A, B, [A|R]) :- member(B, R).
pre(A, B, [_|R]) :- pre(A, B, R).

muz(marko).
muz(vasa).
muz(pera).
muz(laza).

m_kostim(medved).
m_kostim(princ).
m_kostim(pajapatak).
m_kostim(betmen).

zena(bojana).
zena(marija).
zena(ana).
zena(ivana).

z_kostim(macka).
z_kostim(vestica).
z_kostim(ciganka).
z_kostim(snezana).

resi_maskenbal(Parovi) :-
    Parovi = [
        par(M1, MK1, Z1, ZK1),
        par(M2, MK2, Z2, ZK2),
        par(M3, MK3, Z3, ZK3),
        par(M4, MK4, Z4, ZK4)
    ],
    muz(M1), muz(M2), muz(M3), muz(M4), svi_razliciti([M1, M2, M3, M4]),
    M3 = marko,
    M1 \= vasa,
    zena(Z1), zena(Z2), zena(Z3), zena(Z4), svi_razliciti(Z1, Z2, Z3, Z4),
    member(PLaza, Parovi), PLaza = par(laza, _, _, _),
    member(PMarija, Parovi), PMarija = par(_, _, marija, _),
    member(PBojana, Parovi), pBojana = par(_, _, bojana, _),
    pre(PLaza, PMarija, Parovi),
    pre(PMarija, PBojana, Parovi),
    z_kostim(ZK1), z_kostim(ZK2), z_kostim(ZK3), z_kostim(ZK4), svi_razliciti([ZK1, ZK2, ZK3, ZK4]),
    ZK3 = macka,
    member(PIvana, Parovi), PIvana = par(_, _, ivana, _),
    member(PSnezana, Parovi), PSnezana = par(_, _, _, snezana),
    pre(PIvana, PSnezana, Parovi),
    member(par(pera, _, ZVestica, vestica), Parovi), ZVestica \= bojana,
    member(PCiganka, Parovi), PCiganka = par(_, _, ZKCiganka, ciganka),
    member(PAna, Parovi), PAna = par(_, _, ana, _),
    pre(PCiganka, PAna, Parovi),
    m_kostim(MK1), m_kostim(MK2), m_kostim(MK3), m_kostim(MK4), svi_razliciti([MK1, MK2, MK3, MK4]),
    member(par(pera, pajapatak, _, _), Parovi),
    member(par(_, medved, _, _), Parovi),
    member(PPrinc, Parovi), PPrinc = par(_, princ, _, _),
    pre(par(M1, MK1, Z1, ZK1), PPrinc, Parovi),
    % todo...
