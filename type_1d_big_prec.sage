import time
def distance_from_int(y, rbig):
    x = rbig(abs(y)) 
    from_below = x - rbig(floor(x)) 
    from_above = rbig(ceil(x)) - x 
    return rbig(min(rbig(from_below), rbig(from_above)))


def test_for_bad_integers(alpha, epsilon, upper_bound, c_bound, eta):
    smallest_c = 10
    smallest_c_int = 0
    bad_ints_and_LHS = []
    for m in range(1, upper_bound):
        d = distance_from_int(m*alpha)
        lhs = d*m^(eta + epsilon)
        #print("m = " + str(m))
        #print(str(lhs))
        if lhs < smallest_c:
            smallest_c = lhs
            smallest_c_int = m
        if lhs < c_bound:
            #print("at m = " + str(m) + " LHS = " + str(lhs))
            bad_ints_and_LHS.append([m, lhs]) 
    return [smallest_c.n(), smallest_c_int, bad_ints_and_LHS]


rbig = RealField(99999)
fi = open("champ_base_ten.txt", "r")
champ_string = fi.read()
num = "champernowne constant"
rnum = rbig(champ_string)

#num = pi
#rnum = rbig(num)


#p = 19
#trace = 1
#num = arccos(trace/(2*sqrt(p)))
#rnum = rbig(num)
step_size = 5
start_index = 2
upperbound = 200000
c_bound = .1
eta = 1
epsilon = .1
local_time = time.asctime(time.localtime(time.time()))
print("started at " + str(local_time))
t1 = time.time()
data_pts = []
for m in range(start_index, upperbound, step_size):
    d = distance_from_int(m*rnum, rbig)
    #print(str(log(d, m)))
    pt = [m, log(d, rbig(m^(eta+epsilon)))]
    data_pts.append(pt)
plt = plot(points(data_pts))
t2 = time.time()
#plt.save("log_plot_for_trace_" + str(trace) + "_p_"+ str(p) + "_eta_" + str(eta) + "skipping_" + str(step_size) + ".png")
plt.save("log_plot_for_" + str(num) + "_eta_" + str(eta) + "skipping_" + str(step_size) + ".png")
print("took "  + str( (t2 - t1)/60) + " minutes")
