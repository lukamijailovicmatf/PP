from constraint import Problem, AllDifferentConstraint

def solve():
    problem = Problem()
    problem.addVariables('ABCDEFG', range(1, 8))
    problem.addConstraint(AllDifferentConstraint(), 'ABCDEFG')
    for linija in ['ABED', 'BEGD', 'EGFD', 'GFCD', 'FCAD', 'CABD']:
        problem.addConstraint(lambda *x: sum(x) <= 15, linija)
    r = max(problem.getSolutions(), key = lambda x: (x['C'] + x['D'] + x['E'], -(x['C'] * x['D'] * x['E'])))
    return [r]
    
def main():
    for r in solve():
        print(f" {r['A']} {r['B']}")
        print(f"{r['C']} {r['D']} {r['E']}")
        print(f" {r['F']} {r['G']}")
        print('------------------------------')
    
if __name__ == '__main__':
    main()
