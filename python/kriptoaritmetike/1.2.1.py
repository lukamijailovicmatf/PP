from constraint import Problem, AllDifferentConstraint

def izracunaj_vrednost(rec, dodeljene_cifre):
    total = 0
    for slovo in rec:
        total = total * 10 + dodeljene_cifre[slovo]
    return total
    
def solve():
    slova = ['F', 'O', 'U', 'R', 'T', 'W']
    pocetna_slova = ['F', 'T']
    problem = Problem()
    problem.addVariables(slova, range(0, 10))
    problem.addConstraint(AllDifferentConstraint(), slova)
    for slovo in pocetna_slova:
        problem.addConstraint(lambda cifra: cifra != 0, [slovo])
    def proveri_jednacinu(*cifre):
        dodeljene_cifre = dict(zip(slova, cifre))
        return sum(izracunaj_vrednost(rec, dodeljene_cifre) for rec in ['TWO', 'TWO']) == sum(izracunaj_vrednost(rec, dodeljene_cifre) for rec in ['FOUR'])
    problem.addConstraint(proveri_jednacinu, slova)
    return problem.getSolutions()
    
def main():
    for r in solve():
        print('TWO + TWO = FOUR', r)
        
if __name__ == '__main__':
    main()
