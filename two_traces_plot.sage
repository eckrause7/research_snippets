from sage.plot.plot3d.shapes import Box
import random
def compute_norm_traces(tr, p, max_degree):
    trace2 = tr^2 - 2*p                                                                                                                         
    traces = []                                                                                                                   
    traces.append(tr)                                                                                                                           
    traces.append(trace2)  
    norm_traces = []                                                                             
    norm_traces.append(tr/(2*sqrt(p)).n())                                                                                                      
    norm_traces.append(trace2/(2*p).n())
    for n in range(3, max_degree+1): 
        t = tr*traces[-1] - p*traces[-2] 
        traces.append(t) 
        norm_t = t/(2*sqrt(p^n)).n() 
        norm_traces.append(norm_t)                                                                                                   
    return norm_traces

trace1 = 4                                                           
trace2 = 2                                                                       
p = 19                            
max_degree = 10000                                                                                                              
n_traces = []
tmp = compute_norm_traces(trace1, p, max_degree)
n_traces.append(tmp)
tmp = compute_norm_traces(trace2, p, max_degree)
n_traces.append(tmp)

data = [] #an item in data looks like [x, y, z], where x, y are the traces and z is number of extensions where the traces are close to x and y 
for i in range(-95, 105, 10):
    for j in range(-95, 105, 10):
        data.append([i/100, j/100, 0])

for n in range(0, max_degree):
    t1 = n_traces[0][n]
    t2 = n_traces[1][n]
    for P in data:
        if abs(t1 - P[0]) < .05 and abs(t2 - P[1]) < .05:
            #print("t1 = " + str(t1) + ", t2 = " + str(t2))
            #print("this gets counted in ")
            #print("p[0] = " + str(p[0].n()) + " p[1] = " + str(p[1].n()))
            P[2] = P[2] + 1
            #print("after counting, we have p[2] = " + str(p[2]))
            #print()
            continue
#show(sum([Box([.05, .05, p[2]/2], color="blue").translate(p[0],p[1],p[2]/2) for p in data]))
colors = ["red", "green", "blue", "gray", "purple", "orange"]
sum([Box([.05, .05, P[2]/2], color=random.choice(colors)).translate(P[0],P[1],P[2]/2) for P in data]).save("p" + str(p) + "_t" + str(trace1) + "_t" + str(trace2) + "_3dplot.png")
show(sum([Box([.05, .05, P[2]/2], color=random.choice(colors)).translate(P[0],P[1],P[2]/2) for P in data]))
