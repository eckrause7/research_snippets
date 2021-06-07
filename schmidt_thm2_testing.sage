import time

def distance_from_int(x): 
    from_below = x - floor(x) 
    from_above = ceil(x) - x 
    return min(from_below, from_above)



def find_num_bad_m_2d(a1, a2, p, epsilon, mlowerbound, mupperbound, nlowerbound, nupperbound): 
    frob1 = arccos(a1/(2*sqrt(p))) 
    normfrob1 = (float(frob1) % float(pi))/(float(pi)) 
    frob2 = arccos(a2/(2*sqrt(p))) 
    normfrob2 = (float(frob2) % float(pi))/(float(pi)) 
    bad_pairs = [] 
    for m in range(mlowerbound, mupperbound): 
        mf1 = m*normfrob1
        mf2 = m*normfrob2
        for n in range(nlowerbound, nupperbound):
            d1 = distance_from_int(mf1 + n*normfrob2) 
            lhs1 = d1*(m*n)^(1 + epsilon) 
            d2 = distance_from_int(mf2 + n*normfrob1)
            lhs2 = d2*(m*n)^(1 + epsilon) 
            if lhs1 < .5: 
                bad_pairs.append((m, n))
                print((m, n))
                print("LHS = " + str(lhs1))
            if lhs2 < .5:
                bad_pairs.append((n, m))
                print((n, m)) 
                print("LHS = " + str(lhs2))
    print("num bad pairs = " + str(len(bad_pairs))) 
    print(bad_pairs) 
    return bad_pairs
    
m_lowerbound = 1
m_upperbound = 400
n_lowerbound = 400
n_upperbound = 800
a1 = 1
a2 = 8
p = 223


print("with a lower bound of m = " + str(m_lowerbound))
print("with an upper bound of m = " + str(m_upperbound))

print("with a lower bound of n = " + str(n_lowerbound))
print("with an upper bound of n = " + str(n_upperbound))
print("and traces t1 = " + str(a1) + " t2 = " + str(a2), " and p = " + str(p))
print()


epsilon = .05
t1 = time.time()
bad_pairs = find_num_bad_m_2d(a1, a2, p, epsilon, m_lowerbound, m_upperbound, n_lowerbound, n_upperbound)
t2 = time.time()
print("this loop took " + str(t2 - t1) + " seconds")
print()

frob1 = arccos(a1/(2*sqrt(p))) 
normfrob1 = (float(frob1) % float(pi))/(float(pi)) 
frob2 = arccos(a2/(2*sqrt(p))) 
normfrob2 = (float(frob2) % float(pi))/(float(pi)) 
epsilons = [.15, .2, .25, .3, .35, .4, .45, .5]

for epsilon in epsilons:
    print("for epsilon = " + str(epsilon))
    ep_bad_pair = []
    for pair in bad_pairs:
        m = pair[0]
        n = pair[1]
        d = distance_from_int(m*normfrob1 + n*normfrob2)
        lhs = d*(m*n)^(1 + epsilon)
        if lhs < 1:
            ep_bad_pair.append(pair)
    print(ep_bad_pair)
    print()
    
    
    
