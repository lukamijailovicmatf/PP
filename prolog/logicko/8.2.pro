/* unifikacija */
uni(X, Y) :- X = Y.

/* jednakost termova */
jed(X, Y) :- X == Y.

/* dodela - "aritmeticko izracunavanje"*/
op1(X, Y) :- X is Y.

/* aritmeticka jednakost */
op2(X, Y) :- X =:= Y.
