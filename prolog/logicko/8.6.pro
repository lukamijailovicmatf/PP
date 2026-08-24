% a)
maksimum(A, B, M) :- A >= B, M is A.
maksimum(A, B, M) :- A < B, M is B.

% b)
suma(1, S) :- S is 1.    % suma(1, 1).
suma(N, S) :- N > 1, N1 is N - 1, suma(N1, S1), S is S1 + N.

% c)
sumaParnih(2, S) :- S is 2.    % sumaParnih(2,2).
sumaParnih(N, S) :- N > 2, N1 is N - 2, sumaParnih(N1, S1), S is S1 + N.

% d)
proizvod(1, P) :- P is 1.    % proizvod(1,1).
proizvod(N, P) :- N > 1, N1 is N - 1, proizvod(N1, P1), P is P1 * N.

% e)
proizvodNeparnih(1, P) :- P is 1.    % proizvodNeparnih(1,1).
proizvodNeparnih(N, P) :- N > 1, N1 is N - 2, proizvodNeparnih(N1, P1), P is P1 * N.

% f)
cifra(0, nula).
cifra(1, jedan).
cifra(2, dva).
cifra(3, tri).
cifra(4, cetiri).
cifra(5, pet).
cifra(6, sest).
cifra(7, sedam).
cifra(8, osam).
cifra(9, devet).

cifre(N) :- N < 1, !.
cifre(N) :- N > 1, N < 10, cifra(N, C), write(C), nl, !.
cifre(N) :- N1 is (N // 10), cifre(N1), N2 is (N mod 10), cifra(N2, C), write(C), nl.
