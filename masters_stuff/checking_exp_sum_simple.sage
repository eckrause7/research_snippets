###
## this program checks the exponential sum in the discrepancy bound for multi-dim case for 1 lattice point
##

N = 208
p = 101
h = vector((1, 2))
t1 = 1
t2 = 9
f1 = arccos(t1/(2*sqrt(p)))
f2 = arccos(t2/(2*sqrt(p)))
fvec = vector((f1, f2))
nthetas = []
for n in range(1, N+1):
    nf1 = (float(n*f1) % float(pi))/float(pi)
    nf2 = (float(n*f2) % float(pi))/float(pi)
    v = vector((nf1, nf2))
    nthetas.append(v)
s = sum(exp(2*pi*i*h.dot_product(ntheta)) for ntheta in nthetas)
print("abs value of sum is " + str(abs(s).n()))
#blah = abs(sin(N*(h[0]*f1 + h[1]*f2))/(sin(h[0]*f1 + h[1]*f2))).n()
dprod = h.dot_product(fvec)
blah = abs(sin(N*dprod)/sin(dprod)).n()
print("abs(sin(Nx)/sin(x)) = " + str(blah))
print("diff is " + str(abs(s).n() - blah))
