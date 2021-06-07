
# This file was *autogenerated* from the file amidoingthisright.sage
from sage.all_cmdline import *   # import sage library

_sage_const_2 = Integer(2); _sage_const_1 = Integer(1); _sage_const_0 = Integer(0); _sage_const_10 = Integer(10)
def compute_rh(h):
    prod = _sage_const_1 
    for hi in h:
        temp = max(_sage_const_1 , abs(hi))
        prod = prod*temp
    return prod
def get_lattice_pts(H):
    hs = []
    for h1 in range(-H, H+_sage_const_1 ):
        for h2 in range(-H, H+_sage_const_1 ):
            vec = vector((h1, h2))
            if h1 ==_sage_const_0  and h2 ==_sage_const_0 :
                continue
            hs.append(vec)
            #print(vec)
    return hs
def get_vec_list(a, b, N):
    vs = []
    for n in range(_sage_const_1 , N+_sage_const_1 ):
        na = float(n*a) % _sage_const_1 
        nb = float(n*b) % _sage_const_1 
        v = vector((na, nb))
        vs.append(v)
    return vs
a = sqrt(_sage_const_2 )
b = pi
N = _sage_const_10 
vs = get_vec_list(a, b, N)
print(vs)
plot(points(vs))

