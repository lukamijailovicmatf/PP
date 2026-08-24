pronadji_promenljive(Vars) :- Vars = [X, Y, Z],
    X :: 1..90,
    Y :: 2..2..60,
    Z :: 1..10..100,
    X #>= Z,
    X * 2 + Y * X + Z #=< 34,
    labeling(Vars).
