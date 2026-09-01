from constraint import Problem

def main():
    problem = Problem()
    delovi = ['D17', 'R35', 'Z', 'N']
    problem.addVariable('D17', range(5))
    problem.addVariable('R35', range(32))
    problem.addVariable('Z', range(15))
    problem.addVariable('N', range(4))
    problem.addConstraint(lambda d,r,z,n: 480 * d + 3980 * r + 290 * z + 6600 * n <= 20000, delovi)
    problem.addConstraint(lambda d,r,z,n: 84 * d + 17.28 * r + 6 * z + 2739 * n <= 3500, delovi)
    problem.addConstraint(lambda d,r,z,n: 800 * d + 1300 * r + 120 * z + 9000 * n <= 20000, delovi)
    r = max(problem.getSolutions(), key = lambda x: 9.3 * x['D17'] + 9.9 * x['R35'] + 2.17 * x['Z'] + 303.5 * x['N'])
    print(f"Moze se postici ubrzanje od {9.3 * r['D17'] + 9.9 * r['R35'] + 2.17 * r['Z'] + 303.5 * r['N']:.2f}s. Potrebne komponente:")
    print(f"Nitro Scalar: {r['N']},")
    print(f"Katalizator D17: {r['D17']},")
    print(f"Turbo Pumpa: {r['Z']},")
    print(f"Filter R35: {r['R35']}")
    
if __name__ == '__main__':
    main()
