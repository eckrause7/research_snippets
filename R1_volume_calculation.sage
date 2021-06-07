epsilon = .6
var('s')
#r_small(s) = sqrt(s)*arcsin(sqrt(1-epsilon))/pi
r_small(s) = sqrt(s)*(1/2 - arcsin(sqrt(epsilon))/pi)
vol_S(s) = pi^(s/2)*((r_small(s))^s)/gamma(s/2 + 1)

for num_classes in range(4, 50):
    radius = r_small(num_classes).n()
    print(str(radius))
    volume_S = vol_S(num_classes).n()
    print(str(num_classes) + " & " + str(volume_S) + " \\\\")
 
 
 
 







#######################################
##
## junk below here
##
#####################################

 
#
#r_big(s) = arcsin(sqrt(s*epsilon - (s-1)))/pi - .5
#vol_B(s) = pi^(s/2)*(r_big(s))^s/gamma(s/2 + 1)

    #print(str((num_classes*epsilon - (num_classes - 1)).n()))
    #temp = r_big(num_classes).n()
    #volume_B = vol_B(num_classes).n()
   # print("big radius is " + str(temp))
 #   print("volume of big sphere = " + str(volume_B))

