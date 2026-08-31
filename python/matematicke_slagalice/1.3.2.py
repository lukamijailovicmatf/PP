# A       G
#   B   F
#     C       -> A+B+C+H+I = G+F+C+D+E = 25
#   D   H
# E       I

from constraint import Problem, AllDifferentConstraint

def solve():
    problem = Problem()
    problem.addVariables('ABCDEFGHI', range(1, 10))
    problem.addConstraint(AllDifferentConstraint(), 'ABCDEFGHI')
    problem.addConstraint(lambda a,b,c,h,i: a < b < c < h < i and a + b + c + h + i == 25, 'ABCHI')
    problem.addConstraint(lambda g,f,c,d,e: g < f < c < d < e and g + f + c + d + e == 25, 'GFCDE')
    return problem.getSolutions()
    
def main():
    for r in solve():
        print(f"{r['A']}       {r['G']}")
        print(f"  {r['B']}   {r['F']}")
        print(f"    {r['C']}")
        print(f"  {r['D']}   {r['H']}")
        print(f"{r['E']}       {r['I']}")
        print('------------------------')
        
if __name__ == '__main__':
    main()
