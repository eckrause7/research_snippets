#####################
##
##     This program calculates the proportion of extensions up to degree N 
##     such that |disc|/4p^n > nu
##     a1 is the trace of frobenius over F_p 
##
####################


N = 10
nu = .05
p = 19
a1 = 3


def get_traces(a1, p, N):
    traces = []
    traces.append(a1)
    a2 = a1^2 - 2*p
    traces.append(a2)
    for n in range(3, N+1):
        an = a1*traces[-1] - p*traces[-2]
        traces.append(an)
    return traces

tr = get_traces(a1, p, N)
num_good_ext = 0

for n in range(1, N+1):
    t = tr[n-1]
    absdisc = abs(t^2 - 4*p^n)
    rat = (absdisc/(4*p^n)).n()
    if rat>nu:
        num_good_ext = num_good_ext + 1

prop_good = (num_good_ext/N).n()
print("for extensions up to degree " + str(N))
print("the propotion of good extensions is " + str(prop_good))
    


