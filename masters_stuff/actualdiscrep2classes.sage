##########################################
## This is at least a feasible computation, but isn't looking at boxes placed arbitrarily
## Rather this looks at each point P, and calculates the number of points around P
##########################################

def discrep_lb(boxsize):
    mostptsinbox = 0
    for P in datapts:
        xP = P[0]
        yP = P[1]
        numptsaroundP = 0
        for Q in datapts:
            if (abs(Q[0] - xP) < (boxsize/2)) and (abs(Q[1] - yP) < (boxsize/2)):
                numptsaroundP = numptsaroundP + 1
        if numptsaroundP > mostptsinbox:
            mostptsinbox = numptsaroundP
    lbdiscrep = abs(mostptsinbox/N - (boxsize)^2)
    return lbdiscrep.n()
def compute_points(N, f1, f2):
    datapts = []
    for n in range(1, N+1):
        f1_temp = (float(n*frob1) % float(pi))
        f1_twid = f1_temp/float(pi)
        f2_temp = (float(n*frob2) % float(pi))
        f2_twid = f2_temp/float(pi)
        P = (f1_twid, f2_twid)
        datapts.append(P)
    return datapts
p = 101
N = 500
trace1 = 1
trace2 = -4
frob1 = arccos(trace1/(2*sqrt(p)))
frob2 = arccos(trace2/(2*sqrt(p)))
datapts = compute_points(N, frob1, frob2)
stepsize = .02
boxsizes = [k*stepsize for k in range(1, (1/stepsize))]
discrep_ests = []
for b in boxsizes:
    #print(discrep_lb(b))
    discrep_ests.append(discrep_lb(b))
print("for N = " + str(N))
print("max lower bound is " + str(max(discrep_ests)))
ind = discrep_ests.index(max(discrep_ests))
worstboxsize = (ind+1)*stepsize
print("which was with box sizes " + str(worstboxsize))
