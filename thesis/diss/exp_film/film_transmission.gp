load "../gp/smallps.gp"
load "../gp/e_density.gp"
set output "film_transmission.eps"

f1(x)=m1*x+t1
f2(x)=m2*x+t2
f3(x)=m3*x+t3

set xlabel "Haltespannung [V]"
set ylabel "Transmission [dB]"

i=6
m1=0
fit [0.2:0.6] f1(x) "<bzcat ../data/mw0109d5.dat.bz2" every :::(i)::(i) u 10:(log($11+$17+$19/1e9*$13/1e9)/log(10)*20) via t1
fit [0.75:0.80] f2(x) "" every :::(i)::(i) u 10:(log($11+$17+$19/1e9*$13/1e9)/log(10)*20) via m2,t2
fit [0.85:1] f3(x) "" every :::(i)::(i) u 10:(log($11+$17+$19/1e9*$13/1e9)/log(10)*20) via m3,t3
V1=(t2-t1)/(m1-m2)
V2=(t3-t2)/(m2-m3)
dV=V2-V1
eps = 4.5
dC3 = 26
h=0.008
ds=200e-9

Us=0.5
Ue=1.05
set xr [Us:Ue]
set yr [-25.3:-23]
#set title `printf '"0109_5(7) U_{0}=%.3fV, U_{wc}=%.3fV, {/Symbol D}U=%.3fV"' $V1 $V2 $dV`
plot "" every 6:::(i):1050:(i) u 10:(log($11+$17+$19/1e9*$13/1e9)/log(10)*20) not w p pt 6, \
	f1(x) not w l ls 1, \
	f2(x) not w l ls 2, \
	f3(x) not w l ls 3


