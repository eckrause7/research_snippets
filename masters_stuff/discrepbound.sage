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
p = 101
N = 100
H = 2
trace1 = 10
trace2 = 3
frob1 = arccos(trace1/(2*sqrt(p)))
frob2 = arccos(trace2/(2*sqrt(p)))
frobvec = vector((frob1, frob2))
hs = get_lattice_pts(H)
s = 0
for h in hs:
    ex = exp(2*i*(frobvec.dot_product(h)))
    denom = 1 - ex
    numerator = ex*(1-ex^N)
    frac = abs(numerator/denom)
    r = compute_rh(h)
    term = (1/r)*(1/N)*(frac)
    s = s + term.n()
print("For H = " + str(H))
print("sum part is " + str(s.n()))
discrepbound = (9/4)*(2/(H+1) + s)
print("discrepancy bound is " + str(discrepbound.n()))
