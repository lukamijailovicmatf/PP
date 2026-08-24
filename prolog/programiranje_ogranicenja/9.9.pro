% hleb -> 300 gr brasna, 10 min mesenje, 7 din zarada
% kifla -> 120 gr brasna, 12 min mesenje, 9 din zarada
% 20 h = 20 * 60 min = 1200 min
% 20 kg brasna na raspolaganju i 20 h vremena na raspolaganju
% max zarada pekare = ?

% za 20 kg brasna moze se napraviti:
% 20 000 gr / 300 gr ~ 66 hlebova
% 20 000 gr / 120 gr ~ 166 kifli

% za 20 h vremena na raspolaganju:
% 1200 min / 10 min = 120 hlebova
% 1200 min / 12 min = 100 kifli

% najoptimalnije je za gornju granicu domena uzeti minimalne vrednosti dobijene za hleb i za kifle tj. H = 66 i K = 100

pekara(Vars) :- Vars = [H, K],
    H :: 0..66,
    K :: 0..100,
    10 * H + 12 * K #=< 1200,
    300 * H + 120 * K #=< 20000,
    labeling([maximize(7 * H + 9 * K)], Vars),
    Zarada is 7 * H + 9 * K,
    write('Maksimalna zarada od '), write(Zarada), write(' dinara se ostvaruje za '), write(H), write(' komada hleba i '),
    write(K), write(' komada kifli.'), nl.
