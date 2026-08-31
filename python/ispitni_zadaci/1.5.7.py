from constraint import Problem

def main():
    problem = Problem()
    namirnice = ['B', 'P', 'J', 'M', 'V', 'N']
    kesice = [10, 20, 7, 5, 3, 9]
    for n,k in zip(namirnice, kesice):
        problem.addVariable(n, range(k+1))
    problem.addConstraint(lambda b,p,j,m,v,n: b + p + j + m + v + n <= 10, namirnice)
    problem.addConstraint(lambda b,p,j,m,v,n: 30 * b + 10 * p + 150 * j + 32 * m + 3 * v + 15 * n < 500, namirnice)
    problem.addConstraint(lambda b,p,j,m,v,n: 5 * b + 30 * p + 2 * j + 15 * m + 45 * v + 68 * n <= 150, namirnice)
    problem.addConstraint(lambda b,p,j,m,v,n: 30 * b + 300 * p + 50 * j + 170 * m + 400 * v + 450 * n <= 1170, namirnice)
    r = max(problem.getSolutions(), key = lambda x: 20 * x['B'] + 15 * x['P'] + 70 * x['J'] + 40 * x['M'] + 23 * x['V'] + 7 * x['N'])
    print(20 * r['B'] + 15 * r['P'] + 70 * r['J'] + 40 * r['M'] + 23 * r['V'] + 7 * r['N'])
    
if __name__ == '__main__':
    main()
