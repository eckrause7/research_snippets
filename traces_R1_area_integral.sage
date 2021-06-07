def f(x, y, epsilon):
    val = (.5*( abs(2*cos(pi*x)) + abs(2*cos(pi*y)))).n()
    if val > epsilon:
        return 1
    else:
        return 0
        
eps = .8
partition_size = 1200
print("epsilon is " + str(eps))
step_size = 1/partition_size
su = 0
box_area = step_size^2
for i in range(0, partition_size):
    i_x = (i*step_size).n()
    for j in range(0, partition_size):
        j_y = (j*step_size).n()
        su = su + f(i_x, j_y, eps)*box_area
ar = su.n()
print(str(ar))




#total_area = (su/(partition_size^2)).n()
#print(str(total_area))
#big_r = (arcsin(sqrt(2*eps))/pi).n()
#small_r = (sqrt(2)*arcsin(sqrt(eps))/pi).n()
#big_circle_area = (pi*big_r^2).n()
#small_circle_area = (pi*small_r^2).n()
#print("big circle area = " + str(big_circle_area))
#print("small circle area = " + str(small_circle_area))
#mid_pt_area = small_circle_area + (big_circle_area - small_circle_area)/2
#print("middle area is " + str(mid_pt_area))
#diff = ar - mid_pt_area
#print("diff is " + str(diff))
