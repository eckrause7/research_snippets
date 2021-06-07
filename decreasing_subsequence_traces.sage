import time

def compute_norm_traces(tr, p, max_degree):
    trace2 = tr^2 - 2*p                                                                                                                         
    traces = []                                                                                                                                     
    traces.append(tr)                                                                                                                           
    traces.append(trace2)  
    norm_traces = []                                                                                                                                
    norm_traces.append(tr/(2*sqrt(p)).n())                                                                                                      
    norm_traces.append(trace2/(2*p).n())
    for n in range(3, max_degree): 
        t = tr*traces[-1] - p*traces[-2] 
        traces.append(t) 
        norm_t = t/(2*sqrt(p^n)).n() 
        norm_traces.append(norm_t)                                                                                                   
    return norm_traces


def decreasing_subsequence(traces):
    subseq = []
    subseq.append(0)
    for t in traces:
        if t < subseq[-1]:
            subseq.append(t)
    return subseq



trace = 5                                                                                                                  
p = 73                            
max_degree = 20000 
t0 = time.time()
l = compute_norm_traces(trace, p, max_degree)
t1 = time.time()
decrease = decreasing_subsequence(l)
print("took " + str((t1 - t0)/60.n()) + " min")
print(decrease)
print(l.index(min(l)))
