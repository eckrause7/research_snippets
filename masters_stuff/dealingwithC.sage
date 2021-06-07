#####
# given a list of traces, a prime p, and max extension degree N
# computes isogeny class sizes
#####
def get_class_sizes(traces, p, N):
    class_sizes = []
    for n in range(0, N):
        deg = n+1
        t = traces[n]
        D = t^2 - 4*p^(deg)
        size_isog_class = int(pari(abs(D)).qfbhclassno())
        class_sizes.append(size_isog_class)
    return class_sizes
#####
# given a trace over \F_p, gets traces up to extension N
#####
def get_traces(t1, p, N):
    traces = []
    traces.append(t1)
    t2 = t1^2 - 2*p
    traces.append(t2)
    for n in range(3, N+1):
        tn = traces[0]*traces[-1] - p*traces[-2]
        traces.append(tn)
    return traces
p = 41
N = 70
t1 = 3
C = 1/10
epsilon = .05
#Cprime = (C^(1/(1-2*epsilon)))/2
delta_temp = arcsin(C/2)
delta = 2*delta_temp
print("delta is " + str(delta.n()))
print("trace is " + str(t1) + "\n")
frob1 = arccos(t1/(2*sqrt(p)))
frobs = []
traces = get_traces(t1, p, N)
badbyfrob = []
for n in range(1, N+1):
    fntilde = (float(n*frob1) % float(pi))/(float(pi))
    frobs.append(fntilde)
isog_class_sizes = get_class_sizes(traces, p, N)
for n in range(0, N):
    deg = n+1
    r = (isog_class_sizes[n]/p^(deg/2)).n()
    rdumb = (isog_class_sizes[n]/p^(deg*(1/2 - epsilon))).n()
    print("degree is " + str(deg) + " ratio is " + str(r))
    print("ratio with p^(n/2 - nepsilon) is " + str(rdumb))    
    frobangle = frobs[n]
    #print("frob angle is " + str(frobangle))
    if (r < C):
        #print("degree is " + str(deg) + " ratio is " + str(r))
        print("frob angle is " + str(frobs[n]))
        if (frobangle > delta) and (frobangle < 1 - delta):
            print("uh oh---------------------------------")
            temp = sin(deg*frob1).n()
            print("sin of frob angle is " + str(temp))
        print("\n")

ratis = []
rs = []
counting = 0
countingbad2 = 0

















#fi = open("trace" + str(t1) + "_Cdivpnover2_p"  + str(p) + "N" + str(N) + ".txt", "w+")
#gi = open("Cdivpnover2minusepsilon_p"  + str(p) + "N" + str(N) + ".txt", "w+")
#fi.write("trace is " + str(t1) + "\n")
#gi.write("trace is " + str(t1) + "\n")
#fi.write("computing (class size)/p^(n/2) \n")
#gi.write("computing (class size)/p^(n/2 - nepsilon) \n")


#for n in range(0, N):
#    stmp ="extend degree " + str(n+1) + "--------------------------------------------------" 
#    print(stmp)
#    fi.write(stmp + "\n")
#    gi.write(stmp + "\n")    
#    print("size of isogeny class is " + str(size_isog_class))
#    denom = p^((n+1)*(1/2 - epsilon))
#    print("expected to be about " + str(denom))
#    rati = size_isog_class/denom
#    print("degree = " + str(n+1))
#    print("ratio is of C/p^(n*(1/2-epsilon) " + str(rati.n()))
#    ratis.append(rati.n())
#    gi.write(str(rati.n()) + "\n")
#    r = (size_isog_class/(p^((n+1)/2))).n()
#    rs.append(r)
#    print("ratio of C/p^(n/2) is " + str(r))
#    fi.write(str(r) + "\n")
#    if rati < C:
#        print("degree " + str(n+1) + " is bad!!!!!!!!!!!!")
#        counting = counting + 1
#    if r < C:
#        countingbad2 = countingbad2 + 1
#        fi.write("bad extension at " + str(n+1)) 
#s="number of bad extensions is " + str(counting)
#print(str(s))
#fi.write("num bad is " + str(countingbad2))
#gi.write(str(s))
#fi.close()
#gi.close()
