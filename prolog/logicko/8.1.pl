/* cinjenice, svojstva */
zivotinja(slon).
zivotinja(vuk).
zivotinja(zec).
zivotinja(zebra).

/* cinjenice, odnosi */
veci(slon, vuk).
veci(vuk, zec).
veci(slon, zebra).
veci(zebra, vuk).
veci(slon, zec).

/* pravilo */
je_veci(X, Y) :- veci(X, Z), veci(Z, Y).
