nzd(A, B, NZD) :- A >= B, B > 0, nzdPom(A, B, NZD).
nzd(A, B, NZD) :- A < B, A > 0, nzdPom(B, A, NZD).

nzdPom(N, 0, N) :- !.
nzdPom(N, M, NZD) :- P is N mod M, nzdPom(M, P, NZD).



nzs(N, M, NZS) :- nzd(N, M, NZD), NZS is N * M // NZD.
