from constraint import Problem

def main():
    problem = Problem()
    problem.addVariable('V', range(10))
    problem.addVariable('P', range(10))
    problem.addVariable('C', range(10))
    problem.addConstraint(lambda v,p,c: 4 * v + 3 * p + 2 * c <= 9, ['V', 'P', 'C'])
    r = max(problem.getSolutions(), key = lambda x: 15 * x['V'] + 10 * x['P'] + 7 * x['C'])
    print(f"Viski: {r['V']}, Parfem: {r['P']}, Casa: {r['C']}")
    
if __name__ == '__main__':
    main()
