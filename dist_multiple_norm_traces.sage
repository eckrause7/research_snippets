def compute_norm_traces(tr, p, max_degree):
    trace2 = tr^2 - 2*p                                                                                                                         
    traces = []                                                                                                                                     
    traces.append(tr)                                                                                                                           
    traces.append(trace2)  
    norm_traces = []                                                                                                                                
    norm_traces.append(tr/(sqrt(p)).n())                                                                                                      
    norm_traces.append(trace2/(2*p).n())
    for n in range(3, max_degree): 
        t = tr*traces[-1] - p*traces[-2] 
        traces.append(t) 
        norm_t = t/(sqrt(p^n)).n() 
        norm_traces.append(norm_t)                                                                                                   
    return norm_traces




trace1 = 5                                                              
trace2 = 1                                                                       
p = 19                            
max_degree = 3000                                                                                                              
n_traces = []
n_traces = n_traces + compute_norm_traces(trace1, p, max_degree)
n_traces = n_traces + compute_norm_traces(trace2, p, max_degree)


histogram(n_traces, bins=32).save("traces_distribution_p" + str(p) + "_a1_" + str(trace1) + "_a2_" + str(trace2) + ".png")  
