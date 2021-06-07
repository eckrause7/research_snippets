###############################################
## compute/estimate the star discrepancy of the theta 
## twiddles. Need to look at intervals of the 
## form [0, x_i) \times [0, y_i)
################################################


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
p = 101
N = 70
t1 = 7
t2 = 1
f1 = arccos(t1/(2*sqrt(p)))
f2 = arccos(t2/(2*sqrt(p)))
thetapoints = compute_points(N, f1, f2)
stepsize = .01
xs = [stepsize*j for j in range(1, 1/stepsize +1 )]
ys = [stepsize*j for j in range(1, 1/stepsize +1 )]
worstx = 0
worsty = 0
sup = 0
for x in xs:
    for y in ys:
        ptcount = count_pts_in_interval(x, y, thetapoints)
        dis_xy = ptcount/N - x*y
        if dis_xy>sup:
            worstx = x
            worsty = y
            sup = dis_xy
print("for N = " + str(N) + " t1 = " + str(t1) + " t2 = " + str(t2))
print("normalized t1 = " + str((t1/(2*sqrt(p))).n()) + " t2 = " + str((t2/(2*sqrt(p))).n()))
print("estimate of star discrepancy is " + str(sup))
print("at x = " + str(worstx) + " y = " + str(worsty))
plt = plot(points(thetapoints))
#plt.show(xmin=0, xmax=1, ymin=0, ymax=1)
#plt.show(xmin=0, xmax=1, ymin=0, ymax=1, title = "t1="+str(t1)+" t2=" + str(t2) + " N=" + str(N) + " p=" + str(p))
