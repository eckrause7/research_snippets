delta = .001
maxra = .001
badx = 0
bady = 0
for n in range(0, 20000):
    x = RR.random_element(0, pi/2).n()
    y = RR.random_element(0, pi/2).n()
    dif = abs(x-y).abs()
    sindif = abs((sin(x))^2 - (sin(y))^2).n()
    ra = dif/sindif
    if (dif < delta):
        continue
    if ra > maxra:
        maxra = ra
        badx = x
        bady = y
    #print("|x - y| = " + str(dif))
    #print("|sin^2(x) - sin^2(y)| = " + str(sindif))
    #print("ratio is " + str(ra))
print("delta = " + str(delta))
print("worst ratio is " + str(maxra))
print("at x = " + str(badx) + " and y = " + str(bady))
worstdif = abs(badx - bady)
print("|badx - bady| = "  + str(worstdif))
worstsinsquare = abs((sin(badx)^2 - (sin(bady))^2)).n()
print("|sin^2(badx) - ..| = " + str(worstsinsquare))
