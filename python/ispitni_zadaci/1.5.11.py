# meni terminal ne izbacuje nista jer je prostor pretrage jako veliki, cak preko 75 miliona kombinacija
# ako se odradi optimizacija u vidu range() opsega, prostor pretrage se smanjuje za nekih 170 puta
# ali opet je prostor pretage veliki jer obuhvata oko 444 hiljade kombinacija koje treba ispitati ali
# ipak terminal izbacuje resenje nakon 2,5 sekunde, medjutim ne poklapa se sa onim njihovim iz zbirke tako 
# da ne znam da li je dobro, jer je mozda u odsecanjima pretrage izgubio neka dobra tj tacna resenja... 🤔
from constraint import Problem

def main():
    problem = Problem()
    cokolade = ['A', 'B', 'C', 'D']
    for c,b in zip(cokolade, [30, 66, 300, 120]):
        problem.addVariable(c, range(b+1))
    problem.addConstraint(lambda a,b,c,d: 100 * a + 45 * b + 10 * c + 25 * d <= 3000, cokolade)
    problem.addConstraint(lambda a,b,c,d: 10 * a + 7 * b + 3 * c + 4.5 * d <= 1000, cokolade)
    problem.addConstraint(lambda a,b,c,d: 20 * a + 16 * b + 9 * c + 7 * d <= 300, cokolade)
    r = max(problem.getSolutions(), key = lambda x: 8 * x['A'] + 6.8 * x['B'] + 4 * x['C'] + 3 * x['D'])
    print(8 * r['A'] + 6.8 * r['B'] + 4 * r['C'] + 3 * r['D'], r)
    
if __name__ == '__main__':
    main()
