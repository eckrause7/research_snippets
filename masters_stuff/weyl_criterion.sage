var('x')
numpts = 500
g(x) = sqrt(1 - x^2)
h(x) = -sqrt(1 - x^2)
s1 = arccos(3/(2*sqrt(19)))
ss = []
for n in range(1, numpts+1):
    sn = float(n*s1) % 1
    ss.append(sn)
Ps = []
for s in ss:
    P = (cos(2*pi*s), sin(2*pi*s))
    Ps.append(P)
plt = plot(g(x), -1, 1)
plt += plot(h(x), -1, 1)
plt += plot(points(Ps, color='red', pointsize=40))
plt.save("weylequid" + str(numpts)+"pts.png")
