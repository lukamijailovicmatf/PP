# 250 zaposlenih radnika
# Elixir -> 100 evra, 150 projekat/sati, dobit 5 evra po projekat/satu
# Dart -> 105 evra, 170 projekat/sati, dobit 6 evra po projekat/satu
# budzet 26000 evra za obuku
# mesecno 51200 projekat/sati

from constraint import Problem

def main():
    problem = Problem()
    problem.addVariable('E', range(251))
    problem.addVariable('D', range(251))
    problem.addConstraint(lambda e,d: e + d == 250, ['E', 'D'])
    problem.addConstraint(lambda e,d: 100 * e + 105 * d <= 26000, ['E', 'D'])
    problem.addConstraint(lambda e,d: 150 * e + 170 * d <= 51200, ['E', 'D'])
    r = max(problem.getSolutions(), key = lambda s: 150 * 5 * s['E'] + 170 * 6 * s['D'] - (100 * s['E'] + 105 * s['D']))
    print(f"Maksimalna zarada je {150 * 5 * r['E'] + 170 * 6 * r['D'] - (100 * r['E'] + 105 * r['D'])}, broj radnika koje treba poslati na kurs Elixir je {r['E']}, a broj")
    print(f"radnika koje treba poslati na kurs Dart je {r['D']}")
    
if __name__ == '__main__':
    main()
