p = 11
eta = 75
R500 = RealField(500)
for m in range(2, 10000):
    if (m % 2 == 0):
        max_norm_trace = R500(2*sqrt(p^m) - 1)/(2*sqrt(p^m))
        #print(str(max_norm_trace))
    else:
        max_norm_trace = R500(floor(2*sqrt(p^m))/(2*sqrt(p^m)))
        #print(str(max_norm_trace))
    bound_from_type = R500(cos(pi/m^eta))
    #print("type bound = " + str(bound_from_type))
    if max_norm_trace > bound_from_type:
        print("------------------- poop -----------------")
        print("difference is + " + str(R500(max_norm_trace - bound_from_type)))
