set term post eps enhanced
set output "film_quality.eps"
load "../gp/smallps.gp"

f1(x)=m1*x+t1
f2(x)=m2*x+t2
f3(x)=m3*x+t3

set xlabel "Haltespannung [V]"
set ylabel "Güte"
set xr [0.5:1.05]
set yr [1250:1800]
i=6
m1=0
fit [0.2:0.6] f1(x) "<bzcat ../data/mw0109d5.dat.bz2" every :::(i)::(i) u 10:($13/$15) via t1
fit [0.75:0.80] f2(x) "" every :::(i)::(i) u 10:($13/$15) via m2,t2
fit [0.85:1] f3(x) "" every :::(i)::(i) u 10:($13/$15) via m3,t3
V1=(t2-t1)/(m1-m2)
V2=(t3-t2)/(m2-m3)
dV=V2-V1
#set title `printf '"0109_5(7) U_{0}=%.3fV, U_{wc}=%.3fV, {/Symbol D}U=%.3fV"' $V1 $V2 $dV`
plot "<bzcat ../data/mw0109d5.dat.bz2 |smooth -n 5 -" every 6:::(i):1050:(i) u 10:($13/$15) not w p 6, \
	f1(x) not w l 1, \
	f2(x) not w l 2, \
	f3(x) not w l 3


