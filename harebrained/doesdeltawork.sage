############################################
##
## This program finds extensions that are bad for both two selected isogeny classes, t1 & t2
## then determines if the bad extensions are all contained the the sequence { delta_n }
##
############################################

def is_ext_bad(nf1, nf2, epsilon):
    if (nf1 < epsilon) and (nf2 < epsilon):
        return true
    if (nf1 < epsilon) and (nf2 > 1-epsilon):
        return true
    if (nf1 > 1- epsilon) and (nf2 < epsilon):
        return true
    if (nf1 > 1 - epsilon) and (nf2 > 1 - epsilon):
        return true    
    return false
def get_bad_exts(f1, f2, p, N, epsilon):
    bad_exts = []
    for n in range(1, N+1):
        nf1 = (float(n*f1) % float(pi))/float(pi)
        nf2 = (float(n*f2) % float(pi))/float(pi)
        if is_ext_bad(nf1, nf2, epsilon):
            bad_exts.append(n)
    return bad_exts
def delta_detection(f1, f2, p, N, epsilon):
    delta_bad_exts = []
    for n in range(1, N+1):
        dn = ((float(n*f1) - float(n*f2)) % float(pi))/(float(pi))
        if (dn < 2*epsilon) or (dn > 1 - 2*epsilon):
            delta_bad_exts.append(n)
    return delta_bad_exts
p = 19
t1 = 1
t2 = 3
N = 1000
epsilon = .08
f1 = arccos(t1/(2*sqrt(p)))
f2 = arccos(t2/(2*sqrt(p)))
bad_exts = get_bad_exts(f1, f2, p, N, epsilon)
print bad_exts
delta_bad_exts = delta_detection(f1, f2, p, N, epsilon)
#print delta_bad_exts
for n in bad_exts:
    if not (n in delta_bad_exts):
        print("uh oh for n = " + str(n))
        nf1 = (float(n*f1) % float(pi))/float(pi)
        nf2 = (float(n*f2) % float(pi))/float(pi)
        dn = ((float(n*f1) - float(n*f2)) % float(pi))/(float(pi))
        print("(n*f1 mod pi) = " + str(float(n*f1) % float(pi)) + " (n*f2 mod pi) = " + str(float(n*f2) % float(pi)))
        print("(n*f1 mod pi)/pi = " + str(nf1) + " (n*f2 mod pi)/pi = " + str(nf2))
        print("dn = " + str(dn))
