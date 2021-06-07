p = 101
N = 30
t1 = 7
t2 = t1^2 - 2*p
traces = []
traces.append(t1)
traces.append(t2)
for n in range(1, N+1):
    tn = traces[0]*traces[-1] - p*traces[-2]
    traces.append(tn)
for n in range(0, len(traces)):
    D = traces[n]^2 - 4*p^(n+1)
    print(str(D))
    size_isog_class = pari(abs(D)).qfbhclassno()
    #print("for ext deg = " + str(n+1) + "size of isogeny class is " + str(size_isog_class))

