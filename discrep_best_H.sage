#######################################
##
## This program finds the discprepancy bound for different choices of H in the erdos/turan/lerma inequality
##
#######################################

def compute_inner_sum(h, N, theta):
    numerator = exp(2*pi*h*i*theta)*(1 - exp(2*pi*h*i*N*theta))
    denominator = 1 - exp(2*pi*h*i*theta)
    return abs(numerator/denominator).n()

def compute_discrep_for_H(H, N, theta):
    s = sum((1/h)*compute_inner_sum(h, N, theta) for h in (1..H))
    D_N = (log(2)/(2*(H+1)) + (1/(pi*N))*s).n()
    return D_N


p = 59
t = 4
N = 1000

theta = arccos(t/(2*sqrt(p))).n()

smallest_discrep = 100
best_H = 0

for H in (1..50):
    discrep = compute_discrep_for_H(H, N, theta)
    print("for H = " + str(H) + " discrep is " + str(discrep))
    if discrep < smallest_discrep:
        best_H = H
        smallest_discrep = discrep
print("for N = " + str(N) + " for trace = " + str(t))
print("Best discrep = " + str(smallest_discrep))
print("best H is " + str(best_H))
