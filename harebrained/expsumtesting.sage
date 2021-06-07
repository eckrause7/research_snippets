p = 197
t1 = 1
f1 = arccos(t1/(2*sqrt(p)))
pts = []
for t2 in range(-floor(sqrt(p)), floor(sqrt(p)) + 1):
    if (t2 ==0) or (t1 == t2) or (t1==-t2):
        continue
    f2 = arccos(t2/(2*sqrt(p)))
    expsumbound = abs(2/(1 - exp(2*i*(f1-f2))))
    print("for t2 = " + str(t2) + " bound = " + str(expsumbound.n()))
    #P = (t2/(2*sqrt(p)), expsumbound)
    P = ((t2 - t1)/(2*sqrt(p)), expsumbound)    
    pts.append(P)
show(plot(points(pts)))
