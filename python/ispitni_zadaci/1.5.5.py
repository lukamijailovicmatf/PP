from constraint import Problem, AllDifferentConstraint

def solve():
    problem = Problem()
    problem.addVariables('ABCDEFG', range(1, 8))
    problem.addConstraint(AllDifferentConstraint(), 'ABCDEFG')
    for linija in ['ACD', 'ADB', 'BDE', 'EDG', 'GDF', 'CDF']:
        problem.addConstraint(lambda *x: sum(x) <= 11, linija)
    for linija in ['CDBA', 'ABED', 'FGED', 'FGDC']:
        problem.addConstraint(lambda *x: sum(x) <= 16, linija)
    return problem.getSolutions()
    
def main():
    for r in solve():
        print(f" {r['A']} {r['B']}")
        print(f"{r['C']} {r['D']} {r['E']}")
        print(f" {r['F']} {r['G']}")
        print('------------------------------')
        
if __name__ == '__main__':
    main()
