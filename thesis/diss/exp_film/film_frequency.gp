load "../gp/smallps.gp"
set output "film_frequency.eps"

f1(x)=m1*x+t1
f2(x)=m2*x+t2
f3(x)=m3*x+t3

set xlabel "Haltespannung [V]"
set ylabel "Frequenz [GHz]"
set xr [0.5:1.05]
set yr [10.7435:10.74393]
set ytics 0.0001

m1=0
fit [0.2:0.6] f1(x) "<bzcat ../data/mw0109d5.dat.bz2" every :::6::6 u 10:($13/1e9) via t1
fit [0.75:0.80] f2(x) "" every :::6::6 u 10:($13/1e9) via m2,t2
fit [0.85:1.0] f3(x) "" every :::6::6 u 10:($13/1e9) via m3,t3
V1=(t2-t1)/(m1-m2)
V2=(t3-t2)/(m2-m3)
dV=V2-V1
plot "<bzcat ../data/mw0109d5.dat.bz2 |smooth -n 5 -" every 6:::6:1050:6 u 10:($13/1e9) not w p ps 6, \
	f1(x) not w l ls 1, \
	f2(x) not w l ls 2, \
	f3(x) not w l ls 3


