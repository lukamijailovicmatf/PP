glumac(1, 'Marlon Brando', 1924, 'Omaha').
glumac(2, 'Al Pacino', 1940, 'New York').
glumac(3, 'Quentin Tarantino', 1963, 'Knoxville').

film('Kum', 'Kriminalisticki', 'Francis Ford Coppola', 1).
film('Apokalipsa Danas', 'Ratni', 'Francis Ford Coppola', 1).
film('Kum 2', 'Kriminalisticki', 'Francis Ford Coppola', 2).
film('Petparačke priče', 'Kriminalisticki', 'Quentin Tarantino', 3).

filmskiUmetnik(X) :- film(_, _, X, _), glumac(Sifra, X, _, _), film(_, _, _, Sifra).

glumacBarDva(X) :- glumac(Sifra, X, _, _), film(F1, _, _, Sifra), film(F2, _, _, Sifra), F1 \= F2.

opstiGlumac(X) :- glumac(Sifra, X, _, _), film(_, Zanr1, _, Sifra), film(_, Zanr2, _, Sifra), Zanr1 \= Zanr2.

zanrovskiGlumac(X, Y) :- glumac(Sifra, X, _, _), film(_, Y, _, Sifra).
