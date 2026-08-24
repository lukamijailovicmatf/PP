% racunar -> 360 dm^3, 200 evra nabavna cena, 400 evra prodajna cena, 
% stampac -> 240 dm^3, 60 evra nabavna cena, 140 evra prodajna cena
% min 30 prodatih racunara (R >= 30)
% bar 50% vise prodatih racunara od stampaca (R >= 1.5 * S  =>  2 * R >= 3 * S)    
% 30000 dm^3 prostora na raspolaganju i 14000 evra na raspolaganju

% za 30000 dm^3 prostora moze se obezbediti:
% 30000 dm^3 / 360 dm^3 ~ 83 racunara
% 30000 dm^3 / 240 dm^3 = 125 stampaca

% za 14000 evra moze se obezbediti:
% 14000 evra / 200 evra = 70 racunara
% 14000 evra / 60 evra = 233 stampaca

% najoptimalnije je za gornju granicu racunara i stampaca uzeti minimalnu vrednost tj. R = 70 i S = 125

magacin(Vars) :- Vars = [R, S],
    R :: 0..70,
    S :: 0..125,
    R #>= 30,
    2 * R #>= 3 * S,
    360 * R + 240 * S #=< 30000,
    200 * R + 60 * S #=< 14000,
    labeling([maximize(200 * R + 80 * S)], Vars),
    Zarada is 200 * R + 80 * S,
    write('Maksimalna zarada od '), write(Zarada), write(' evra se ostvaruje kupovinom '), write(R), write(' racunara i '),
    write(S), write(' stampaca.'), nl.
