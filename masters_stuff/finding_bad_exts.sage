p = 101
trace = 7
N = 50
frob1 = arccos(trace/(2*sqrt(p)))
frobs = []
for n in range(1, N+1):
    fntilde = (float(n*frob1) % float(pi))/(float(pi))
    frobs.append(fntilde)
fmin = min(frobs)
fmax = max(frobs)
print("for trace = " + str(trace) + " and p = " + str(p))
print("min is " + str(fmin) + " at ext deg " + str(frobs.index(fmin) + 1))
print("max is " + str(fmax) + " at ext deg " + str(frobs.index(fmax) + 1))
