# MANET + MATISSE + MIRO + MONET + RENOIR = ARTISTS

from constraint import Problem, AllDifferentConstraint

def solve():
    slova = ['M', 'A', 'N', 'E', 'T', 'I', 'S', 'R', 'O']
    pocetna_slova = ['M', 'R', 'A']
    problem = Problem()
    problem.addVariables(slova, range(10))
    problem.addConstraint(AllDifferentConstraint(), slova)
    for slovo in pocetna_slova:
        problem.addConstraint(lambda cifra: cifra != 0, [slovo])
    def proveri_jednacinu(M, A, N, E, T, I, S, R, O):
        manet = 10000 * M + 1000 * A + 100 * N + 10 * E + T
        matisse = 1000000 * M + 100000 * A + 10000 * T + 1000 * I + 100 * S + 10 * S + E
        miro = 1000 * M + 100 * I + 10 * R + O
        monet = 10000 * M + 1000 * O + 100 * N + 10 * E + T
        renoir = 100000 * R + 10000 * E + 1000 * N + 100 * O + 10 * I + R
        artists = 1000000 * A + 100000 * R + 10000 * T + 1000 * I + 100 * S + 10 * T + S
        return manet + matisse + miro + monet + renoir == artists
    problem.addConstraint(proveri_jednacinu, slova)
    return problem.getSolution()

def main():
    resenje = solve()
    if resenje:
        sortirana_slova = sorted(resenje.keys())
        izlaz = [resenje[slovo] for slovo in sortirana_slova]
        print('Izlaz: ', izlaz)

if __name__ == '__main__':
    main()
