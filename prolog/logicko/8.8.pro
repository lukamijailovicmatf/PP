ucenik(1, 'Petar Petrovic', 'III-1').
ucenik(2, 'Marko Markovic', 'III-1').
ucenik(3, 'Ana Anic', 'III-2').
ucenik(4, 'Jovana Jovic', 'III-2').

predmet(101, 'Matematika', 4).
predmet(102, 'Fizika', 3).
predmet(103, 'Informatika', 2).

ocene(1, 101, 5).
ocene(1, 102, 5). 
ocene(2, 101, 5). 
ocene(3, 101, 4). 
ocene(3, 103, 5). 
ocene(4, 102, 5).

bar2PeticeSifra(S) :- ocene(S, P1, 5), ocene(S, P2, 5), P1 \= P2.

bar2PeticeIme(X) :- bar2PeticeSifra(S), ucenik(S, X, _).

odeljenjePetice(X,Y) :- ucenik(S1, _, X), ucenik(S2, _, X), S1 \= S2, ocene(S1, Y, 5), ocene(S2, Y, 5).
