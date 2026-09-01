from constraint import Problem

def main():
    problem = Problem()
    kolicine = [2, 3, 5, 4]
    tezine = [500, 7, 55, 1]
    vrednosti = [3400, 1800, 200, 10]
    kapacitet = 128
    indeksi = list(range(4))
    for i,k in enumerate(kolicine):
        problem.addVariable(i, range(k+1))
    problem.addConstraint(lambda *xs: sum(x * t for x,t in zip(xs, tezine)) <= kapacitet, indeksi)
    r = max(problem.getSolutions(), key = lambda x: sum(x[i] * vrednosti[i] for i in indeksi))
    print([r[i] for i in indeksi])
    
if __name__ == '__main__':
    main()
