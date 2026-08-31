# solja -> 6 min, 75 gr gline, 2 evra zarada
# tanjir -> 3 min, 100 gr gline, 1.5 evra zarada
# 20 h vremena na raspolaganju i 250 kg gline
# broj solja = ?, broj tanjira = ?, zarada max = ?

# za 20 h vremena se moze napraviti:
# 20 * 60 min = 1200 min
# 1200 min / 6 min = 200 solja
# 1200 min / 3 min = 400 tanjira

# za 250 kg gline moze se napraviti:
# 250 kg = 250000 gr
# 250000 gr / 75 gr ~ 3333 solje
# 250000 gr / 100 gr = 2500 tanjira

# najoptimalnije je za gornju granicu domena uzeti minimalne vrednosti dobijene za solje i tanjire tj. S = 200 i T = 400

from constraint import Problem

def main():
    problem = Problem()
    problem.addVariable('S', range(201))
    problem.addVariable('T', range(401))
    problem.addConstraint(lambda s,t: 6 * s + 3 * t <= 1200, ['S', 'T'])
    problem.addConstraint(lambda s,t: 75 * s + 100 * t <= 250000, ['S', 'T'])
    r = max(problem.getSolutions(), key = lambda x: 2 * x['S'] + 1.5 * x['T'])
    print(f"Najveca moguca zarada je {2 * r['S'] + 1.5 * r['T']} i ona se ostvaruje kada se napravi {r['S']} solja i {r['T']} tanjira.")
    
if __name__ == '__main__':
    main()
