from constraint import Problem, AllDifferentConstraint

def izracunaj_vrednost(rec, dodeljene_cifre):
    total = 0
    for slovo in rec:
        total = total * 10 + dodeljene_cifre[slovo]
    return total
    
def solve():
    slova = ['M', 'E', 'N', 'A', 'D', 'W', 'O']
    pocetna_slova = ['M', 'A', 'W']
    problem = Problem()
    problem.addVariables(slova, range(0, 10))
    problem.addConstraint(AllDifferentConstraint(), slova)
    for slovo in pocetna_slova:
        problem.addConstraint(lambda cifra: cifra != 0, [slovo])
    def proveri_jednacinu(*cifre):
        dodeljene_cifre = dict(zip(slova, cifre))
        return izracunaj_vrednost('MEN', dodeljene_cifre) * izracunaj_vrednost('AND', dodeljene_cifre) == izracunaj_vrednost('WOMEN', dodeljene_cifre)
    problem.addConstraint(proveri_jednacinu, slova)
    return problem.getSolutions()
    
def main():
    for r in solve():
        print('MEN * AND = WOMEN', r)
        
if __name__ == '__main__':
    main()
