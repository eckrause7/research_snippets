#################################################################################################
## This program is intended to help check if the type of a certain vector pertaining to the 
## frobenius angles of some elliptic curves is 1
##
## This program keeps track of the smallest c such that r((m, n))^(1 + epsilon) dint( (m, n) \cdot (theta1, theta2)) ~= c
##
## It also stores pairs that have  r((m, n))^(1 + epsilon) dint( (m, n) \cdot (theta1, theta2)) < (a fairly small value)
##
##############################################################

import time

def distance_from_int(y):
    x = abs(y) 
    from_below = x - floor(x) 
    from_above = ceil(x) - x 
    return min(from_below, from_above)

def test_all_pairs(nf1, nf2, epsilon, upper_bound, bad_pair_bound):
    smallest_c = 10
    smallest_pair = (0, 0)
    bad_pairs_and_LHS = []
    for m in range(-upper_bound, upper_bound):
        m_nf1 = m*nf1
        if m%5000 == 0:
            print("at m = " + str(m))
        for n in range(0, upper_bound):
            if (m, n) == (0, 0):
                continue
            d = distance_from_int(m_nf1 + n*nf2)
            lhs = d*(max(abs(m), 1)*max(abs(n), 1))^(1 + epsilon)
            if lhs < smallest_c:
                smallest_c = lhs
                smallest_pair = (m, n)
            if lhs < bad_pair_bound:
                bplhs = [lhs, (m, n)]
                print(str(bplhs))
                bad_pairs_and_LHS.append(bplhs)
    return (smallest_c, smallest_pair, bad_pairs_and_LHS)

p = 179
a1 = 2
a2 = 5
epsilon = 1.05
up_bound = 1500
bad_pair_bound = 1

frob1 = arccos(a1/(2*sqrt(p)))
normfrob1 = (float(frob1) % float(pi))/(float(pi)) 
frob2 = arccos(a2/(2*sqrt(p)))
normfrob2 = (float(frob2) % float(pi))/(float(pi)) 
t1 = time.time()
(smallest_c, smallest_pair, bad_pairs) = test_all_pairs(normfrob1, normfrob2, epsilon, up_bound, bad_pair_bound)
t2 = time.time()
print("smallest c = " + str(smallest_c) + " at m = " + str(smallest_pair[0]) + " n = " + str(smallest_pair[1]))
print("testing took "  + str( (t2 - t1)/60) + " minutes")


fi = open("type_2dim_p" + str(p) + "a1_" + str(a1) + "_a2_" + str(a2) + ".txt", "a")
fi.write("traces a1 = " + str(a1) + ", a2 = " + str(a2) + "\n")
fi.write("p=" + str(p) + "\n")
fi.write("tested up to height = " + str(up_bound)+ "\n")
fi.write("testing took "  + str( (t2 - t1)/60) + " minutes \n")
fi.write("smallest c = " + str(smallest_c) + " at (m, n) = " + str((smallest_pair[0], smallest_pair[1])) + "\n")
fi.write("pairs with LHS less than " + str(bad_pair_bound) + "\n")
for i in range(1, len(bad_pairs)):
    key_item = bad_pairs[i]
    #print(str(key_item))
    height_at_i = max(abs(key_item[1][0]), abs(key_item[1][1]))
    #print(str(height_at_i))
    j = i -1
    height_at_j = max(abs(bad_pairs[j][1][0]), abs(bad_pairs[j][1][1]))
    while j >= 0 and height_at_j > height_at_i:
        bad_pairs[j+1] = bad_pairs[j]
        j -= 1
        height_at_j = max(abs(bad_pairs[j][1][0]), abs(bad_pairs[j][1][1]))
    bad_pairs[j+1] = key_item
fi.write("sorted by height: \n")
for p in reversed(bad_pairs):
    fi.write(str(p) + "\n")
for i in range(1, len(bad_pairs)):
    key_item = bad_pairs[i]
    c_at_i = key_item[0]
    j = i -1
    c_at_j = bad_pairs[j][0]
    while j >= 0 and c_at_j > c_at_i:
        bad_pairs[j+1] = bad_pairs[j]
        j -= 1
        c_at_j = bad_pairs[j][0]
    bad_pairs[j+1] = key_item
fi.write("sorted by c_{m, n}: \n")
for p in bad_pairs:
    fi.write(str(p) + "\n")
fi.close()
