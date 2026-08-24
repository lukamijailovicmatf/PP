%   A, B, C
%  D, E, F, G
% H, I, J, K, L
%  M, N, O, P
%   Q, R, S

heksagon(Vars) :- Vars = [A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S],
    Vars :: 1..38,
    alldifferent(Vars),         % alldistinct(Vars)
    A + B + C #= 38,
    D + E + F + G #= 38,
    H + I + J + K + L #= 38,
    M + N + O + P #= 38,
    Q + R + S #= 38,
        A + D + H #= 38,
        B + E + I + M #= 38,
        C + F + J + N + Q #= 38,
        G + K + O + R #= 38,
        L + P + S #= 38,
            H + M + Q #= 38,
            D + I + N + R #= 38,
            A + E + J + O + S #= 38,
            B + F + K + P #= 38,
            C + G + L #= 38,
    labeling(Vars),
    write('   '), write(A), write(' '), write(B), write(' '), write(C), nl,
    write('  '), write(D), write(' '), write(E), write(' '), write(F), write(' '), write(G), nl,
    write(' '), write(H), write(' '), write(I), write(' '), write(J), write(' '), write(K), write(' '), write(L), nl,
    write('  '), write(M), write(' '), write(N), write(' '), write(O), write(' '), write(P), nl,
    write('   '), write(Q), write(' '), write(R), write(' '), write(S), nl.
