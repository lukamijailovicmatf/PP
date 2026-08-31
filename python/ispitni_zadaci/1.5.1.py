# ((JE + PENSE) − DONC) + JE = SUIS

from constraint import Problem, AllDifferentConstraint

def solve():
    slova = ['J', 'E', 'P', 'N', 'S', 'D', 'O', 'C', 'U', 'I']
    pocetna_slova = ['J', 'P', 'D', 'S']
    problem = Problem()
    problem.addVariables(slova, range(10))
    problem.addConstraint(AllDifferentConstraint(), slova)
    for slovo in pocetna_slova:
        problem.addConstraint(lambda cifra: cifra != 0, [slovo])
    def proveri_jednacinu(J, E, P, N, S, D, O, C, U, I):
        je = 10 * J + E
        pense = 10000 * P + 1000 * E + 100 * N + 10 * S + E
        donc = 1000 * D + 100 * O + 10 * N + C
        suis = 1000 * S + 100 * U + 10 * I + S
        return ((je + pense) - donc) + je == suis
    problem.addConstraint(proveri_jednacinu, slova)
    return problem.getSolution()

def main():
    resenja = solve()
    for idx, r in enumerate(resenja, 1):
        je = 10 * r['J'] + r['E']
        pense = 10000 * r['P'] + 1000 * r['E'] + 100 * r['N'] + 10 * r['S'] + r['E']
        donc = 1000 * r['D'] + 100 * r['O'] + 10 * r['N'] + r['C']
        suis = 1000 * r['S'] + 100 * r['U'] + 10 * r['I'] + r['S']
        print(f"{idx}. (({je} + {pense}) - {donc}) + {je} = {suis}")

if __name__ == '__main__':
    main()
