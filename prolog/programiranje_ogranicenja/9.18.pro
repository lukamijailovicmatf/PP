% stan -> 1 h vremena, 120 ml deterdzenta, 1000 din zarade
% kuca -> 1.5 h vremena, 100 ml deterdzenta, 1500 din zarade
% 40 h vremena na raspolaganju, 5 l deterdzenta
% broj stanova = ?, broj kuca = ?, zarada max = ?

% za 40 h rada moze se ocistiti:
% 40 h / 1 h = 40 stanova
% 40 h / 1.5 h ~ 26 kuca

% za 5 l deterdzenta moze se ocistiti:
% 5000 ml / 120 ml ~ 41 stan
% 5000 ml / 100 ml = 50 kuca

% najoptimalnije je za gornju granicu domena uzeti minimalne vrednosti dobijene za stanove i za kuce tj. S = 40 i K = 26

ciscenje(Vars) :- Vars = [S, K],
    S :: 0..40,
    K :: 0..26,
    1 * S + 3 // 2 * K #=< 40,
    120 * S + 100 * K #=< 5000,
    labeling([maximize(1000 * S + 1500 * K)], Vars),
    Zarada is 1000 * S + 1500 * K,
    write('Maksimalna zarada od '), write(Zarada), write(' dinara se ostvaruje za '), write(S), write(' ociscenih stanova i '),
    write(K), write(' ociscenih kuca.'), nl.
