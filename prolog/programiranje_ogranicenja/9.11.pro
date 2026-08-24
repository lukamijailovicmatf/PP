% 250 zaposlenih radnika
% Elixir -> 100 evra, 150 projekat/sati, dobit 5 evra po projekat/satu
% Dart -> 105 evra, 170 projekat/sati, dobit 6 evra po projekat/satu
% budzet 26000 evra za obuku
% mesecno 51200 projekat/sati

kompanija(Vars) :- Vars = [E, D],
    Vars :: 0..250,
    E + D #= 250,
    100 * E + 105 * D #=< 26000,
    150 * E + 170 * D #=< 51200,
    labeling([maximize(150 * 5 * E + 170 * 6 * D - (100 * E + 105 * D))], Vars),
    Zarada is (150 * 5 * E + 170 * 6 * D - (100 * E + 105 * D)),
    write('Maksimalna zarada je '), write(Zarada), write(', broj radnika koje treba poslati na kurs Elixir je '),
    write(E), write(', a broj radnika koje treba poslati na kurs Dart je '), write(D), nl.
