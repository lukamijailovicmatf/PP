from constraint import Problem, AllDifferentConstraint

def solve():
    problem = Problem()
    kolone = list(range(8))
    problem.addVariables(kolone, range(8))
    problem.addConstraint(AllDifferentConstraint(), kolone)
    for kolona1 in kolone:
        for kolona2 in kolone:
            if kolona1 < kolona2:
                problem.addConstraint(lambda red1, red2, kolona1 = kolona1, kolona2 = kolona2: abs(red1 - red2) != abs(kolona1 - kolona2), [kolona1, kolona2])
    return problem.getSolutions()
    
def main():
    for r in solve():
        for red in range(8):
            print(''.join('D' if r[red] == kolona else '-' for kolona in range(8)))
        print()
        
if __name__ == '__main__':
    main()
