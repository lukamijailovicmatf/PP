# stan -> 1 h vremena, 120 ml deterdzenta, 1000 din zarade
# kuca -> 1.5 h vremena, 100 ml deterdzenta, 1500 din zarade
# 40 h vremena na raspolaganju, 5 l deterdzenta
# broj stanova = ?, broj kuca = ?, zarada max = ?

# za 40 h rada moze se ocistiti:
# 40 h / 1 h = 40 stanova
# 40 h / 1.5 h ~ 26 kuca

# za 5 l deterdzenta moze se ocistiti:
# 5000 ml / 120 ml ~ 41 stan
# 5000 ml / 100 ml = 50 kuca

# najoptimalnije je za gornju granicu domena uzeti minimalne vrednosti dobijene za stanove i za kuce tj. S = 40 i K = 26

from constraint import Problem

def main():
    problem = Problem()
    problem.addVariable('S', range(41))
    problem.addVariable('K', range(27))
    problem.addConstraint(lambda s,k: 2 * s + 3 * k <= 80, ['S', 'K'])
    problem.addConstraint(lambda s,k: 120 * s + 100 * k <= 5000, ['S', 'K'])
    r = max(problem.getSolutions(), key = lambda x: 1000 * x['S'] + 1500 * x['K'])
    print(f"Najveca moguca zarada je {1000 * r['S'] + 1500 * r['K']} i ona se ostvaruje kada se ocisti {r['S']} stan(ova) i {r['K']} kuca")
    
if __name__ == '__main__':
    main()
