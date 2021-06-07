#################################################################################################
## This program is intended to help check if the type of a certain vector pertaining to the 
## frobenius angles of some elliptic curves is 1
##
## It first runs through pairs (m, n) of low height to find a smallest c with r((m, n))^(1 + epsilon) dint( (m, n) \cdot (theta1, theta2)) >= c
##
## After that it runs through random pairs of large height so see if there are pairs with r((m, n))^(1 + epsilon) dint( (m, n) \cdot (theta1, theta2)) < c
##############################################################

import time
from sage.misc.prandom import randrange
from sage.misc.randstate import current_randstate

def distance_from_int(x): 
    from_below = x - floor(x) 
    from_above = ceil(x) - x 
    return min(from_below, from_above)
        
def test_all_pairs_low_height(nf1, nf2, epsilon, upper_bound):
    smallest_c = 10
    smallest_pair = (0, 0)
    for m in range(1, upper_bound):
        m_nf1 = m*nf1
        for n in range(1, upper_bound):
            d = distance_from_int(m_nf1 + n*nf2)
            lhs = d*(m*n)^(1 + epsilon)
            if lhs < smallest_c:
                smallest_c = lhs
                smallest_pair = (m, n)
    return (smallest_c, smallest_pair)

def test_random_pairs(nf1, nf2, epsilon, max_height, num_pairs, smallest_c):
    rrange = current_randstate().python_random().randrange
    for n in range(1, num_pairs):
        m = rrange(max_height)
        n = rrange(100)
        d = distance_from_int(m*nf1 + n*nf2)
        lhs = d*(max(m, 1)*max(1, n))^(1 + epsilon)
        if lhs < smallest_c:
            print("new smallest c = " + str(lhs))
            print("at (m, n) = " + str((m, n)))
        if lhs < 1:
            print("LHS = " + str(lhs) + " at (m, n) = " + str((m, n)))


p = 223
a1 = 1
a2 = 12
epsilon = .05
up_bound_low_height = 1350
num_test_pairs = 5000000 #this is 5,000,000 
max_height = 10000000 #This is 10,000,000



frob1 = arccos(a1/(2*sqrt(p)))
normfrob1 = (float(frob1) % float(pi))/(float(pi)) 
frob2 = arccos(a2/(2*sqrt(p)))
normfrob2 = (float(frob2) % float(pi))/(float(pi)) 
t1 = time.time()
(smallest_c, smallest_pair) = test_all_pairs_low_height(normfrob1, normfrob2, epsilon, up_bound_low_height) 
t2 = time.time()
print("smallest c = " + str(smallest_c))
print("which occured at m = " + str(smallest_pair[0]) + " n = " + str(smallest_pair[1]))
print("this took " + str( (t2 - t1)/60) + " minutes")
t1 = time.time()
test_random_pairs(normfrob1, normfrob2, epsilon, max_height, num_test_pairs, smallest_c)
t2 = time.time()
print("testing random pairs took "  + str( (t2 - t1)/60) + " minutes")
print("tested " + str(num_test_pairs) + " random pairs")

