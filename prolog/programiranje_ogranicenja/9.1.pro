primer(Vars) :- Vars = [X, Y, Z],
    X :: 1..3,
    Y :: 2..2..10,
    Z :: 5..8,
    Z #>= Y,
    labeling(Vars).
    
puni_kvadrati(Vars) :- Vars = [X],
    X :: 1..100,
    Y * Y #= X,
    labeling(Vars).
