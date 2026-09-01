from constraint import Problem

def main():
    problem = Problem()
    proteini = ['W', 'K', 'T', 'D']
    problem.addVariables(proteini, range(21))
    problem.addConstraint(lambda w,k,t,d: 100 * w + 45 * k + 10 * t + 25 * d <= 3000, proteini)
    problem.addConstraint(lambda w,k,t,d: 3 * w + 10 * k + 15 * t + 20 * d <= 1000, proteini)
    problem.addConstraint(lambda w,k,t,d: 8 * w + 6 * k + 14 * t + 11 * d <= 300, proteini)
    r = max(problem.getSolutions(), key = lambda x: 5 * x['W'] + 11 * x['K'] + 20 * x['T'] + 15 * x['D'])
    print('Maksimalno povecanje misicne mase:', 5 * r['W'] + 11 * r['K'] + 20 * r['T'] + 15 * r['D'])
    print('Plan ishrane:')
    print(f"{r['W']} doza wey proteina,")
    print(f"{r['K']} doza kreatina monohidrata,")
    print(f"{r['T']} doza testosterona,")
    print(f"{r['D']} doza danazola")
    
if __name__ == '__main__':
    main()
