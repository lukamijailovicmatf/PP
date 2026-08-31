# 18 glava
# 56 nogu
# kokoske = ?
# zecevi = ?

from constraint import Problem

def main():
    problem = Problem()
    problem.addVariables(['K', 'Z'], range(19))
    problem.addConstraint(lambda k,z: k + z == 18, ['K', 'Z'])
    problem.addConstraint(lambda k,z: 2 * k + 4 * z == 56, ['K', 'Z'])
    r = problem.getSolution()
    print(f"Kokoske: {r['K']}, Zecevi: {r['Z']}")
    
if __name__ == '__main__':
    main()
