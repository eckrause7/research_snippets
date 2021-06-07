fi = open("champ_base_ten.txt", "w+")

rten = RealField(20000)
b = rten(10)

C_b = sum(rten(n)/(b^(rten(n) + sum(floor(rten(log(k+1, b))) for k in range(1, n)))) for n in range(1, 1200))
fi.write(str(C_b))

