# terminal ne ispisuje resenje jer je eksponencijalna vremenska slozenost, ne znam kako drugacije da resim zadatak da bude
# vremenski efikasniji kod...

#   A B C
#  D E F G
# H I J K L
#  M N O P
#   Q R S

from constraint import Problem, AllDifferentConstraint, ExactSumConstraint

LINIJE = ['ABC', 'DEFG', 'HIJKL', 'MNOP', 'QRS', 'ADH', 'BEIM', 'CFJNQ', 'GKOR', 'LPS', 'HMQ', 'DINR', 'AEJOS', 'BFKP', 'CGL']

def solve():
    problem = Problem()
    slova = 'ABCDEFGHIJKLMNOPQRS'
    problem.addVariables(slova, range(1, 20))
    problem.addConstraint(AllDifferentConstraint(), slova)
    for linija in LINIJE:
        problem.addConstraint(ExactSumConstraint(38), linija)
    return problem.getSolutions()
    
def main():
    for r in solve():
        print(' ', r['A'], r['B'], r['C'])
        print('', r['D'], r['E'], r['F'], r['G'])
        print(r['H'], r['I'], r['J'], r['K'], r['L'])
        print('', r['M'], r['N'], r['O'], r['P'])
        print(' ', r['Q'], r['R'], r['S'])
        
if __name__ == '__main__':
    main()
