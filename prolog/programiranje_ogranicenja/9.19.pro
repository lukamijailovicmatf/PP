% solja -> 6 min, 75 gr gline, 2 evra zarada
% tanjir -> 3 min, 100 gr gline, 1.5 evra zarada
% 20 h vremena na raspolaganju i 250 kg gline
% broj solja = ?, broj tanjira = ?, zarada max = ?

% za 20 h vremena se moze napraviti:
% 20 * 60 min = 1200 min
% 1200 min / 6 min = 200 solja
% 1200 min / 3 min = 400 tanjira

% za 250 kg gline moze se napraviti:
% 250 kg = 250000 gr
% 250000 gr / 75 gr ~ 3333 solje
% 250000 gr / 100 gr = 2500 tanjira

% najoptimalnije je za gornju granicu domena uzeti minimalne vrednosti dobijene za solje i tanjire tj. S = 200 i T = 400

grncarija(Vars) :- Vars = [S, T],
    S :: 0..200,
    T :: 0..400,
    6 * S + 3 * T #=< 1200,
    75 * S + 100 * T #=< 250000,
    labeling([maximize(2 * S + 3 // 2 * T)], Vars),
    Zarada is 2 * S + 3 // 2 * T,
    write('Maksimalna zarada od '), write(Zarada), write(' evra se ostvaruje za '), write(S), write(' napravljenih solja i '),
    write(T), write(' napravljenih tanjira.'), nl.
