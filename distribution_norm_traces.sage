trace1 = 3                                                                                                         
p = 19
count = 0                                                                                                                                
trace2 = trace1^2 - 2*p                                                                                                                         
traces = []                                                                                                                                     
traces.append(trace1)                                                                                                                           
traces.append(trace2)                                                                                                                           
norm_traces = []                                                                                                                                
norm_traces.append(trace1/(sqrt(p)).n())                                                                                                      
norm_traces.append(trace2/(p).n())                                                                                                            
for n in range(3, 1000): 
    t = trace1*traces[-1] - p*traces[-2] 
    traces.append(t) 
    norm_t = t/(sqrt(p^n)).n() 
    norm_traces.append(norm_t)      
    if norm_t > 1:
        count = count + 1
print(str(count))                                                                                             
#histogram(norm_traces, bins=32).save("traces_distribution_p" + str(p) + "_a" + str(trace1) +".png")  
