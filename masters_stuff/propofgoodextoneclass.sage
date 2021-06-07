p = 11
delta = .05
maxextdegree = 50
traces = []
#for t in range(-floor(2*sqrt(p)), floor(2*sqrt(p)) + 1):
for t in range(1, floor(2*sqrt(p)) + 1):
    if t == 0:
        continue
    traces.append(t)
for t in traces:
    frob1 = arccos(t/(2*sqrt(p)))
    numbad = 0
    for n in range(1, maxextdegree + 1):
        fn = (float(n*frob1) % float(pi))/float(pi)
        if (fn < delta) or (fn > 1-delta):
            numbad = numbad + 1
    #print("for trace = " + str(t) + " numbad = " + str(numbad))
    #print("for normalized trace " + str((t/(2*sqrt(p))).n()) + " proportion bad " + str(float(numbad/maxextdegree)))
    #print("for normalized trace " + str((t/(2*sqrt(p))).n()) + " proportion good " + str(1 - float(numbad/maxextdegree)))
    print("for trace " + str(t) + " proportion good " + str(1 - float(numbad/maxextdegree)))
