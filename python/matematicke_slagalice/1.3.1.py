#  a  b  c
#  d  e  f   ->   a+b+c = d+e+f = g+h+i = a+d+g = b+e+h = c+f+i = a+e+i = c+e+g = 15
#  g  h  i

from constraint import Problem, AllDifferentConstraint, ExactSumConstraint

LINIJE = ['abc', 'def', 'ghi', 'adg', 'beh', 'cfi', 'aei', 'ceg']

def solve():
    problem = Problem()
    problem.addVariables('abcdefghi', range(1, 10))
    problem.addConstraint(AllDifferentConstraint(), 'abcdefghi')
    for linija in LINIJE:
        problem.addConstraint(ExactSumConstraint(15), linija)
    return problem.getSolutions()
    
def main():
    for r in solve():
        print(r['a'], r['b'], r['c'])
        print(r['d'], r['e'], r['f'])
        print(r['g'], r['h'], r['i'])
        print('--------------------')
        
if __name__ == '__main__':
    main()
