p = 11
delta = .05
maxextdegree = 50
traces = []
numbad = 0
#for t in range(-floor(2*sqrt(p)), floor(2*sqrt(p)) + 1):
for t in range(1, floor(2*sqrt(p)) + 1):
    if t == 0:
        continue
    traces.append(t)
for t in traces:
    frob1 = arccos(t/(2*sqrt(p)))
    for n in range(1, maxextdegree + 1):
        fn = (float(n*frob1) % float(pi))/float(pi)
        if (fn < delta) or (fn > 1-delta):
            numbad = numbad + 1
print("total number of bad extensions is " + str(numbad))
print("prop is " + str((numbad/(len(traces)*N)).n()))
