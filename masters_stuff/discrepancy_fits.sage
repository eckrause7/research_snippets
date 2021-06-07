#################################################
## Calculates the star discrepancy of the 
## theta twiddles, and attempts to fit to 
## C*N^(-1)*(log N)^n*(log log N)^(1+epsilon), 
## where s is the dimension, and where C is 
## a constant depending on epsilon and s
#################################################

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
def calculatediscrep(thetapoints, N):
    stepsize = .01
    xs = [stepsize*j for j in range(1, 1/stepsize +1 )]
    ys = [stepsize*j for j in range(1, 1/stepsize +1 )]
    worstx = 0
    worsty = 0
    sup = 0
    print(N)
    for x in xs:
        for y in ys:
           ptcount = count_pts_in_interval(x, y, thetapoints)
           dis_xy = ptcount/N - x*y
           if dis_xy>sup:
               worstx = x
               worsty = y
               sup = dis_xy
    return sup
maxdeg = 500
step_size = 25
datapts = [] #an item is of the form (extension degree, discrep)
Ns = [j*step_size for j in range(1, floor(maxdeg/step_size)+1)]
#Ns = [30, 50, 75, 100, 125, 150, 200, 250, 300, 350, 400, 450, 500]
p = 101
t1 = 4
t2 = 9
f1 = arccos(t1/(2*sqrt(p)))
f2 = arccos(t2/(2*sqrt(p)))
thetapts = compute_points(maxdeg, f1, f2)
for N in Ns:
    pts = thetapts[0:N]
    discrepN = calculatediscrep(pts, N)
    P = (N, discrepN)
    print(P)
    datapts.append(P)
#print(datapts)
var('C, x')
epsilon = .1
model(x) = C*x^(-1)*log(x)*(log(log(x)))^(1+epsilon)
bfit = find_fit(datapts, model)
print("best fit has C = " + str(bfit))
f(x) = model(C=bfit[0].rhs())
p1 = plot(points(datapts, pointsize=20))
p2 = plot(f(x), (x, 30, maxdeg), color='red')
(p1+p2).save('discrepfits' + str(p) +'tr' + str(t1) + 'and' + str(t2) + '.png')
