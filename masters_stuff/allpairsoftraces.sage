#####################################
##
## Computes the bound (3/2)^2(2/(H+1) + sum_h (1/r(h)) (1/N) |(2/(1 - exp(2i<fvec, h>)))|
## for all pairs of traces at a specified prime, p, and specified H
## 
#####################################

def compute_rh(h):
    prod = 1
    for hi in h:
        temp = max(1, abs(hi))
        prod = prod*temp
    return prod
def get_lattice_pts(H):
    hs = []
    for h1 in range(-H, H+1):
        for h2 in range(-H, H+1):
            vec = vector((h1, h2))
            if h1 ==0 and h2 ==0:
                continue
            hs.append(vec)
            #print(vec)
    return hs
def compute_bound(H, fvec, N):
    hs = get_lattice_pts(H)
    B = 0
    for h in hs:
        ex = exp(2*i*(fvec.dot_product(h)))
        denom = 1 - ex
        #numerator = ex*(1-ex^N)
        frac = abs(2/denom).n()
        r = compute_rh(h)
        term = (1/r)*(1/N)*(frac)
        B = B + term.n()
    discrepbound = (9/4)*(2/(H+1) + B)
    return discrepbound
p = 101
N = 100
Hs = [1, 2]
bestt1 = 100
bestt2 = 100
bestdiscrep = 10000
for t1 in range(1, sqrt(p)+1):
    for t2 in range(1, sqrt(p)+1):
        if t1==0 or t2 == 0:
            continue
        if t1 == t2:
            continue
        if t1 == -t2:
            continue
        f1 = arccos(t1/(2*sqrt(p)))
        f2 = arccos(t2/(2*sqrt(p)))
        fvec = vector((f1, f2))
        for H in Hs:
            #print("t1 = " + str(t1) + " t2 = " + str(t2) + " H = " + str(H))
            temp = compute_bound(H, fvec, N)
            print temp
            if temp< bestdiscrep:
                bestdiscrep = temp
print("best bound is " + str(bestdiscrep))
