import time
t0 = time.time()
p = 3
f = open("badextsforp" + str(p) + ".txt", "w+")
epsilon = 1/10
maxextdegree = 1000000
traces = []
thetas = []
for tr in range(- floor(2*sqrt(p)), floor(2*sqrt(p))+1):
    if tr == 0:
        continue
    traces.append(tr)
    theta = arccos(tr/(2*sqrt(p)))
    thetas.append(theta)
numbaddegrees = 0
baddegrees = []
for r in range(2, maxextdegree + 1):
    boolflag = False
    for theta in thetas:
        if (sin(r*theta))^2 > epsilon:
            boolflag = True
            break
    if not boolflag:
        numbaddegrees = numbaddegrees + 1
        baddegrees.append(r)
t1 = time.time()
print("took " + str(t1-t0) + " seconds")
print("number of bad extensions is " + str(numbaddegrees))
print("which is a proportion of " + str((numbaddegrees/maxextdegree).n()))
f.write("p = " + str(p) + "\n")
f.write("number of bad extensions is " + str(numbaddegrees) + "\n")
f.write("which is a proportion of " + str((numbaddegrees/maxextdegree).n()) + "\n")
f.write("largest extension tested: " + str(maxextdegree) + "\n")
f.write("the bad extensions are " + "\n")
for b in baddegrees:
    f.write(str(b) + ", ")

