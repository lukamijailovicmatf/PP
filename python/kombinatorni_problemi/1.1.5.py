from constraint import Problem

COINS = [('1 din', 1), ('2 din', 2), ('5 din', 5), ('10 din', 10), ('20 din', 20)]

def solve():
    problem = Problem()
    for name, values in COINS:
        max_coins = 50 // values
        problem.addVariable(name, range(max_coins + 1))
    var_names = [name for name, _ in COINS]
    problem.addConstraint(lambda c1, c2, c5, c10, c20: (c1 * 1 + c2 * 2 + c5 * 5 + c10 * 10 + c20 * 20) == 50, var_names)
    return problem.getSolutions()
    
def main():
    for r in solve():
        for name, _ in COINS:
            print(f"{name}: {r[name]}")
        print('Ukupno: ', sum(r[name] * value for name, value in COINS))

if __name__ == '__main__':
    main()
