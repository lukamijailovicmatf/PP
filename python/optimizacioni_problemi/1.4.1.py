# hleb -> 300 gr brasna, 10 min mesenje, 7 din zarada
# kifla -> 120 gr brasna, 12 min mesenje, 9 din zarada
# 20 h = 20 * 60 min = 1200 min
# 20 kg brasna na raspolaganju i 20 h vremena na raspolaganju
# max zarada pekare = ?

# za 20 kg brasna moze se napraviti:
# 20 000 gr / 300 gr ~ 66 hlebova
# 20 000 gr / 120 gr ~ 166 kifli

# za 20 h vremena na raspolaganju:
# 1200 min / 10 min = 120 hlebova
# 1200 min / 12 min = 100 kifli

# najoptimalnije je za gornju granicu domena uzeti minimalne vrednosti dobijene za hleb i za kifle tj. H = 66 i K = 100

from constraint import Problem

def main():
    problem = Problem()
    problem.addVariable('H', range(67))
    problem.addVariable('K', range(101))
    problem.addConstraint(lambda h,k: 300 * h + 120 * k <= 20000, ['H', 'K'])
    problem.addConstraint(lambda h,k: 10 * h + 12 * k <= 1200, ['H', 'K'])
    r = max(problem.getSolutions(), key = lambda s: 7 * s['H'] + 9 * s['K'])
    print(f"Maksimalna zarada je {7 * r['H'] + 9 * r['K']} dinara, za nju je potrebno {r['H']} hlebova i {r['K']} kifli.")
    
if __name__ == '__main__':
    main()
