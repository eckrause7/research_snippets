from sage.symbolic.integration.integral import definite_integral
def make_pts(f):
    Ps = []
    s = 0
    for n in range(0, 25):
        r = RR.random_element(0, 1)
        fr = f(r).n()
        P = (r, fr)
        Ps.append(P)
        s = s + fr
    favg = (s/25).n()
    print("average is " + str(favg))
    return (favg, Ps)

var('x')
f(x) = .2*sin((pi/3)*(x+.1)) + .8*exp(-20*(4*x-3)^2)
actual_avg = definite_integral(f(x), x, 0, 1).n()
favg = 1
#while favg > .135:
while (abs(favg - .192) > .005):
    (favg, pts) = make_pts(f)
    print(str(favg))
print('actual average of f = ' + str(actual_avg))
print('favg = ' + str(favg))
pl = plot(f(x), 0, 1)
pl += plot(points(pts, color='red', pointsize=40))
show(plot(pl))
