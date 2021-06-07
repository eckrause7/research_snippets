
def find_traces(p, a1, b1, max_ext_degree):
    traces = []
    t1 = (a1, b1)
    traces.append(t1)    
    a2 = a1^2 - 2*p
    b2 = b1^2 - 2*p
    t2 = (a2, b2)
    traces.append(t2)
    for n in range(2, max_ext_degree):
        an = traces[0][0]*traces[-1][0] - p*traces[-2][0]
        bn = traces[0][1]*traces[-1][1] - p*traces[-2][1]
        ts = (an, bn)
        traces.append(ts)
        #print(str(an))
    return traces
def calc_disc(traces, max_ext_degree, p):
    discs = []
    for n in range(0, max_ext_degree):
        an = traces[n][0]
        bn = traces[n][1]
        Da = an^2 - 4*p^(n+1)
        Db = bn^2 - 4*p^(n+1)
        #print(str(Da))        
        Dn = (Da, Db)
        discs.append(Dn)
    return discs

epsilon = 1/10
max_ext_degree = 10000
p = 101
a1 = 7
b1 = 4
trs = find_traces(p, a1, b1, max_ext_degree)
discs = calc_disc(trs, max_ext_degree, p)
num_exts_close = 0


for D in discs:
    ratio = (D[0]/D[1]).n()
    if (ratio < 1 + epsilon) and (ratio > 1 - epsilon):
        num_exts_close = num_exts_close + 1
print('num close extensions = ' + str(num_exts_close))
print('which is prop ' + str((num_exts_close/max_ext_degree).n()))

