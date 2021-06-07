def doub_sum(H, fa): 
    ds = sum((1/h)*(1/abs(sin(h*fa))) for h in range(1, H+1))
    return ((1/(pi))*ds).n()

H = 4
a = 3
p = 19
#fa = arccos(a/(2*sqrt(p)))

ts = [.1, .2, .3, .4, .5, .6, .7, .8, .9]
print("H = " + str(H))
for x in range(1, 100):
    t = x/100
    temp = doub_sum(H, t)
    print("t = " + str(t) + " sum = " + str(temp))
