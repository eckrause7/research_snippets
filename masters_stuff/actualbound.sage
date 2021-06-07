def compute_n_twids(N, f1, f2):
    veclist = []
    for n in range(1, N+1):
        nf1 = (float(n*f1) % float(pi))/(float(pi))
        nf2 = (float(n*f2) % float(pi))/(float(pi))
        v = vector((nf1, nf2))
        veclist.append(v)
    return veclist
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
    return hs
def get_exp_part(h, fs):
    s = 0
    for f in fs:
        temp = exp(2*pi*i*f.dot_product(h))
        s = s + temp
    return s 
p = 101
N = 500
H = 1
trace1 = 1
trace2 = -3
frob1 = arccos(trace1/(2*sqrt(p)))
frob2 = arccos(trace2/(2*sqrt(p)))
fangles = compute_n_twids(N, frob1, frob2)
hs = get_lattice_pts(H)
B = 0
for h in hs:
    expsum = get_exp_part(h, fangles)
    r = compute_rh(h)
    B = B + (1/r)*abs(expsum)
B = ((1/N)*B).n()
discrepbound = (9/4)*(2/(H+1) + B)
print("The exp sum part is " + str(B))
print("bound is " + str(discrepbound))
