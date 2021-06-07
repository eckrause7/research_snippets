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
def get_vec_list(a, b, N):
    vs = []
    for n in range(1, N+1):
        na = float(n*a) % 1
        nb = float(n*b) % 1
        v = vector((na, nb))
        vs.append(v)
    return vs
def compute_B(vs, H, N):
    hs = get_lattice_pts(H)
    B = 0
    for h in hs:
        t = sum(exp(2*pi*i*(v.dot_product(h))) for v in vs)
        r = compute_rh(h)
        term = ((1/r)*(1/N)*abs(t)).n()           
        B = B + term
    return B
#a = sqrt(2)
#b = pi
f1 = arccos(1/(2*sqrt(19)))
f1 = arccos(3/(2*sqrt(19)))
a = (float(f1) % float(pi))/(float(pi))
b = (float(f2) % float(pi))/(float(pi))
N = 50
Hs = [1, 2, 3, 4, 5, 6, 7, 8, 9]
vs = get_vec_list(a, b, N)
for H in Hs:    
    B = compute_B(vs, H, N)
    print("for H = " + str(H))
    print("B = " + str(B))
    discrepbound = (9/4)*(2/(H+1) +B)
    print("discrep bound = " + str(discrepbound.n()))
