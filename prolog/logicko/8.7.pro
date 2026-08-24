% a)
sumaCifara(0, SC) :- SC is 0.    % sumaCifara(0,0).
sumaCifara(N, SC) :- N > 0, Cifra is (N mod 10), N1 is (N // 10), sumaCifara(N1, SC1), SC is SC1 + Cifra.

% b)
brojCifara(0, BC) :- BC is 0.    % brojCifara(0,0).
brojCifara(N, BC) :- N > 0, N1 is (N // 10), brojCifara(N1, BC1), BC is BC1 + 1.

% c)
maxCifra(0, MC) :- MC is 0.      % maxCifra(0,0).
maxCifra(N, MC) :- N > 0, Cifra is (N mod 10), N1 is (N // 10), maxCifra(N1, MC1), MC is max(MC1, Cifra).

% d)
sumaKvadrata(1, SK) :- SK is 1.
sumaKvadrata(N, SK) :- N > 1, N1 is N - 1, sumaKvadrata(N1, SK1), SK is SK1 + N * N.

% e)
fakt(0, F) :- F is 1.
fakt(N, F) :- N > 0, N1 is N - 1, fakt(N1, F1), F is F1 * N.

% f)
sumaDel(X,D) :- X > 1, sumaDelPom(X,2,D).

sumaDelPom(X, X, D) :- D is 0.
sumaDelPom(X, I, D) :- I < X, X mod I =:= 0, I1 is I + 1, sumaDelPom(X, I1, D1), D is D1 + I.
sumaDelPom(X, I, D) :- I < X, X mod I =\= 0, I1 is I + 1, sumaDelPom(X, I1, D).
