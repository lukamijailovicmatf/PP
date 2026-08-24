%   A1, B1, C1, D1, E1 - brojevi na glavnoj dijgonali (A1 + B1 + C1 + D1 + E1 = 25)
%   A2, B2, C1, D2, E2 - brojevi na sporednoj dijagonali (A2 + B2 + C1 + D2 + E2 = 25)

%   A1          A2
%     B1      B2
%         C1
%     D2      D1
%   E2          E1

dijagonale(Vars) :- Vars = [A1, B1, C1, D1, E1, A2, B2, D2, E2],
    Vars :: 1..9,
    A1 + B1 + C1 + D1 + E1 #= 25,
    A2 + B2 + C1 + D2 + E2 #= 25,
    alldistinct(Vars),      % alldifferent(Vars)
    A1 #< B1, B1 #< C1, C1 #< D1, D1 #< E1,
    A2 #< B2, B2 #< C1, C1 #< D2, D2 #< E2,
    labeling(Vars),
    write(A1), write('       '), write(A2), nl,
    write('  '), write(B1), write('   '), write(B2), nl,
    write('    '), write(C1), nl,
    write('  '), write(D2), write('   '), write(D1), nl,
    write(E2), write('       '), write(E1), nl.
