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
def count_pts_in_interval(x, y, points):
    numpts = 0
    for pt in points:
        if pt[0] < x and pt[1] < y:
            numpts = numpts + 1
    return numpts
def compute_discrep(xs, ys, thetapoints):
    sup = 0
    for x in xs:
        for y in ys:
            ptcount = count_pts_in_interval(x, y, thetapoints)
            dis_xy = ptcount/N - x*y
            if dis_xy>sup:                
                sup = dis_xy
    return sup
N = 100
p = 1217
stepsize = .01
xs = [stepsize*j for j in range(1, 1/stepsize +1 )]
ys = [stepsize*j for j in range(1, 1/stepsize +1 )]
bestdiscrep = 1000
bestt1 = 0
bestt2 = 0
for t1 in range(1, sqrt(p)+1):
    print("normalized trace = " + str((t1/(2*sqrt(p))).n()))
    for t2 in range(t1, sqrt(p)+1):
        if t1==0 or t2 == 0:
            continue
        if t1 == t2:
            continue
        if t1 == -t2:
            continue
        f1 = arccos(t1/(2*sqrt(p)))
        f2 = arccos(t2/(2*sqrt(p)))
        fvec = vector((f1, f2))
        thetapoints = compute_points(N, f1, f2)
        temp = compute_discrep(xs, ys, thetapoints)
        #print(temp)
        if temp < bestdiscrep:
            bestdiscrep = temp
            bestt1 = t1
            bestt2 = t2
print("for p = " + str(p))
print("for N = " + str(N))
print("lowest discrep was " + str(bestdiscrep))
print("which occured at t1 = " + str(bestt1) + " t2 = " + str(bestt2))
print("normalized t1 = " + str(bestt1/(2*sqrt(p)).n()) + " t2 = " + str(bestt2/(2*sqrt(p)).n()))


