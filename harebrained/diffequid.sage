def get_diffs(f1, f2, N, epsilon):
    numlessep = 0
    diffs = []
    pts = []
    for n in range(1, N+1):
        #nf1 = (float(n*f1) % float(pi))/(float(pi))
        #nf2 = (float(n*f2) % float(pi))/(float(pi))
        #d = abs(nf1 - nf2)
        #d = nf1 - nf2
        temp = (float(n*f1) - float(n*f2)) % float(pi)  
        d = temp/(float(pi))
        if d < epsilon:
            numlessep = numlessep + 1
        diffs.append(d)
        pts.append((d, 1))
    return [diffs, pts, numlessep]
def do_all_traces(p, N, epsilon):
    for t1 in range(-floor(sqrt(p)), floor(sqrt(p)) + 1):
        for t2 in range(t1, floor(2*sqrt(p)) + 1):
            if (t1 == 0 and t2 == 0) or (t1 == t2) or (t1 == -t2):
                continue
            f1 = arccos(t1/(2*sqrt(p)))
            f2 = arccos(t2/(2*sqrt(p)))
            temp = get_diffs(f1, f2, N, epsilon)
            diffs = temp[0]
            pts = temp[1]
            numlessep = temp[2]
            print("for N = " + str(N) + " t1 = " + str(t1) + " t2 = " + str(t2))
            print("proportion less than " + str(epsilon) + " is " + str((numlessep/N).n()))
def do_single_pair(t1, t2, p, N, epsilon):
    f1 = arccos(t1/(2*sqrt(p)))
    f2 = arccos(t2/(2*sqrt(p)))
    temp = get_diffs(f1, f2, N, epsilon)
    diffs = temp[0]
    pts = temp[1]
    numlessep = temp[2]
    #print("for p = " + str(p))
    print("for N = " + str(N) + " t1 = " + str(t1) + " t2 = " + str(t2))
    print("proportion less than " + str(epsilon) + " is " + str((numlessep/N).n()))
    show(histogram(diffs))
    show(plot(points(pts)))

p = 19
N = 500
epsilon = .05
t1 = 1
t2 = 3
do_single_pair(t1, t2, p, N, epsilon)
#do_all_traces(p, N, epsilon)


