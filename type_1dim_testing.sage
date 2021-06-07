###############################
## This program checks some relevant data for the type of a normalized frobenius angle
###############################
import time

def distance_from_int(y):
    x = abs(y) 
    from_below = x - floor(x) 
    from_above = ceil(x) - x 
    return min(from_below, from_above)

def test_for_bad_integers(nf1, epsilon, upper_bound, c_bound, eta):
    smallest_c = 10
    smallest_c_int = 0
    bad_ints_and_LHS = []
    for m in range(1, upper_bound):
        d = distance_from_int(m*nf1)
        lhs = d*m^(eta + epsilon)
        #print("m = " + str(m))
        #print(str(lhs))
        if lhs < smallest_c:
            smallest_c = lhs
            smallest_c_int = m
        if lhs < c_bound:
            #print("at m = " + str(m) + " LHS = " + str(lhs))
            bad_ints_and_LHS.append([m, lhs]) 
    return [smallest_c.n(), smallest_c_int, bad_ints_and_LHS]

p = 11
#a1 = 15
up_bound = 200
c_bound = .5
eta = 3
epsilon = .05
list_trace_worst_m = []
#traces = [1, 2, 5, 6, 15, 80, 160]
traces = [1, 2, 3, 4, 5, 6]
print("eta = " + str(eta) + "\n")

#for a1 in range(1, floor(2*sqrt(p))):
for a1 in traces:
    frob1 = arccos(a1/(2*sqrt(p)))
    normfrob1 = (float(frob1) % float(pi))/(float(pi)) 
    t1 = time.time()
    [smallest_c, smallest_c_int, naughty_list] = test_for_bad_integers(normfrob1, epsilon, up_bound, c_bound, eta)
    t2 = time.time()
    print("trace = " + str(a1) + " p = " + str(p))
    print("testing took "  + str( (t2 - t1)/60) + " minutes")
    print("worst c = " + str(smallest_c) + " at m = " + str(smallest_c_int))
    print(" ")
    list_trace_worst_m.append([a1, smallest_c_int])
for x in list_trace_worst_m:
    print(str(x[0]) + " & " + str(x[1]) + "\\\\")
