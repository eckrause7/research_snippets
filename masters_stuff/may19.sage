#####################################
##
## Computes the bound (3/2)^2(2/(H+1) + sum_h (1/r(h)) (1/N) |(2/(1 - exp(2i<fvec, h>)))|
## for a pair of traces at a specified prime, p, and specified H
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
def compute_bd_Hs(Hs, t1, t2, p, N):
     f1 = arccos(t1/(2*sqrt(p)))
     f2 = arccos(t2/(2*sqrt(p)))
     fvec = vector((f1, f2))
     for H in Hs:
         hs = get_lattice_pts(H)
         B = 0
         for h in hs:
             ex = exp(2*i*fvec.dot_product(h))
             denom = 1 - ex
             numer = ex*(1 - ex^N)
             frac = abs(numer/denom)
             r = compute_rh(h)
             term = (1/r)*(1/N)*frac
             B = B + term
         print("for H = " + str(H))
         discrepbound = (9/4)*(2/(H+1) + B)
         print("discrep bound is " + str(discrepbound.n()))
         print("sum part is " + str(B.n()))
p = 101
N = 100
t1 = 10 #trace for one class
t2 = 3 #trace for other class
#listH = [1, 5, 10, 20, 50, 100]
listH = [1, 2, 3, 4]
print("for t1 = " + str(t1) + " and t2 = " + str(t2))
print("p = " + str(p) + " N = " + str(N))
compute_bd_Hs(listH, t1, t2, p, N)

