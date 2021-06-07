def doub_sum(H, N, fa): 
    ds = sum((1/h)*(1/abs(sin(h*fa))) for h in range(1, H+1))
    return ((1/(pi*N))*ds).n()
#def doub_sum(H, N, fa):

    
N = 500
p = 19
a = 2
fa = arccos(a/(2*sqrt(p)))
for H in range(1, 20):
    doubsum = doub_sum(H, N, fa)
    print("for H = " + str(H) + " double sum is " + str(doubsum))

