epsilon = .8
var('s')

r(s) = sqrt(s)*arcsin(sqrt(epsilon))/pi
vol(s) = pi^(s/2)*(r(s)^s)/gamma(s/2 + 1) 
for num_classes in range(5, 50):
    temp = vol(num_classes).n()
    #print(str(temp))
    #print("distance to vect(1/2) = " + str(sqrt(num_classes/2).n()))
    print(str(num_classes) + " & " + str(temp) + " \\\\")
