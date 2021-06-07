
def compute_points(N, f1, f2):
    datapts = []
    for n in range(1, N+1):
        f1_temp = (float(n*f1) % float(pi))
        f1_twid = f1_temp/float(pi)
        f2_temp = (float(n*f2) % float(pi))
        f2_twid = f2_temp/float(pi)
        P = (f1_twid, f2_twid)
        datapts.append(P)
    return datapts

delta = .05
maxdeg = 5000
p = 101
t1 = 1
t2 = 8
f1 = arccos(t1/(2*sqrt(p)))
f2 = arccos(t2/(2*sqrt(p)))
thetapts = compute_points(maxdeg, f1, f2)
num_bad = 0
for P in thetapts:
    p0 = P[0]
    p1 = P[1]
    if p0< delta or p0>1-delta:
        if p1 < delta or p1 > 1 - delta:
            num_bad = num_bad + 1
print("p = " + str(p) + " traces " + str(t1) + " and " + str(t2))
print("number bad extensions = " +str(num_bad)) 
propgood = ((maxdeg - num_bad)/(maxdeg)).n()
print("proportion good is = " + str(propgood))
