def distance_from_int(x): 
    from_below = x - floor(x) 
    from_above = ceil(x) - x 
    return min(from_below, from_above)



def find_num_bad_m_2d(a1, a2, p, epsilon, upperbound): 
    frob1 = arccos(a1/(2*sqrt(p))) 
    nfrob1 = (float(frob1) % float(pi))/(float(pi)) 
    frob2 = arccos(a2/(2*sqrt(p))) 
    nfrob2 = (float(frob2) % float(pi))/(float(pi)) 
    bad_m = [] 
    for m in range(1, upperbound): 
        d1 = distance_from_int(m*nfrob1)
        d2 = distance_from_int(m*nfrob2) 
        lhs = d1*d2*m^(1 + epsilon) 
        if lhs < 1: 
            bad_m.append(m) 
    print("num bad m = " + str(len(bad_m))) 
    print(bad_m) 


def find_num_bad_m(a, p, epsilon, upperbound): 
    frob = arccos(a/(2*sqrt(p))) 
    nfrob = (float(frob) % float(pi))/(float(pi)) 
    bad_m = [] 
    for m in range(1, upperbound): 
        d = distance_from_int(m*nfrob) 
        lhs = d*m^(1 + epsilon) 
        if lhs < 1: 
            bad_m.append(m) 
    print("num bad m = " + str(len(bad_m))) 
    print(bad_m) 


ub = 5000000
a1 = 1
a2 = 5
p = 19
epsilon = .2

print("with an upper bound of " + str(ub))
print("with epsilon = " + str(epsilon))

find_num_bad_m_2d(a1, a2, p, epsilon, ub)
