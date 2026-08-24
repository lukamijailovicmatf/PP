% 1 din, 2 din, 5 din, 10 din, 20 din na raspolaganju
kombinacije_novcica(Vars) :- Vars = [A, B, C, D, E],
    A :: 1..50,
    B :: 1..25,
    C :: 1..10,
    D :: 1..5,
    E :: 1..2,
    A + 2 * B + 5 * C + 10 * D + 20 * E #= 50,
    labeling(Vars),
    write(A + 2 * B + 5 * C + 10 * D + 20 * E = 50), nl.
