from constraint import Problem, AllDifferentConstraint

def solve():
    problem = Problem()
    kolone = list(range(8))
    problem.addVariables(kolone, range(8))
    problem.addConstraint(AllDifferentConstraint(), kolone)
    return problem.getSolutions()
    
def main():
    for r in solve():
        for red in range(8):
            print(''.join('T' if r[red] == kolona else '-' for kolona in range(8)))
        print()
        
if __name__ == '__main__':
    main()
