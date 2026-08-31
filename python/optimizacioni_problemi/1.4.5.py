# racunar -> 360 dm^3, 200 evra nabavna cena, 400 evra prodajna cena, 
# stampac -> 240 dm^3, 60 evra nabavna cena, 140 evra prodajna cena
# min 30 prodatih racunara (R >= 30)
# bar 50% vise prodatih racunara od stampaca (R >= 1.5 * S  =>  2 * R >= 3 * S)    
# 30000 dm^3 prostora na raspolaganju i 14000 evra na raspolaganju

# za 30000 dm^3 prostora moze se obezbediti:
# 30000 dm^3 / 360 dm^3 ~ 83 racunara
# 30000 dm^3 / 240 dm^3 = 125 stampaca

# za 14000 evra moze se obezbediti:
# 14000 evra / 200 evra = 70 racunara
# 14000 evra / 60 evra = 233 stampaca

# najoptimalnije je za gornju granicu racunara i stampaca uzeti minimalnu vrednost tj. R = 70 i S = 125

from constraint import Problem

def main():
    problem = Problem()
    problem.addVariable('R', range(30, 71))
    problem.addVariable('S', range(126))
    problem.addConstraint(lambda r,s: 2 * r >= 3 * s, ['R', 'S'])
    problem.addConstraint(lambda r,s: 360 * r + 240 * s <= 30000, ['R', 'S'])
    problem.addConstraint(lambda r,s: 200 * r + 60 * s <= 14000, ['R', 'S'])
    r = max(problem.getSolutions(), key = lambda x: 200 * x['R'] + 80 * x['S'])
    print(f"Maksimalna zarada je: {200 * r['R'] + 80 * r['S']}, broj racunara: {r['R']}, broj stampaca: {r['S']}")
    
if __name__ == '__main__':
    main()
