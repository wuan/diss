load "../gp/midps.gp"
load "../gp/e_density.gp"
load "../gp/film_thickness.gp"
load "../gp/level_c.gp"
load "../gp/cell_temp.gp"

set output "film_density.eps"

f1(x)=m1*x+t1
f2(x)=m2*x+t2
f3(x)=m3*x+t3
f4(x)=t4
t(x)=temp

set xlabel "Haltespannung [V]"
set x2label "Elektronendichte [m^{-2}]"
set ylabel "Transmission [dB]"
set ytics nomirror
set y2tics 
set y2label "Resonanzfrequenz [GHz]"
set key samplen 0.5 spacing 1.5

i=6
m1=0
fit [0.2:0.6] f1(x) "<bzcat ../data/mw0109d5.dat.bz2" every :::(i)::(i) u 10:(log($11+$17+$19/1e9*$13/1e9)/log(10)*20) via t1
fit [0.75:0.80] f2(x) "" every :::(i)::(i) u 10:(log($11+$17+$19/1e9*$13/1e9)/log(10)*20) via m2,t2
fit [0.85:1] f3(x) "" every :::(i)::(i) u 10:(log($11+$17+$19/1e9*$13/1e9)/log(10)*20) via m3,t3
fit f4(x) "" every :::(i)::(i) u 0:32 via t4
fit t(x) "" every :::(i)::(i) u 0:4 via temp
V1=(t2-t1)/(m1-m2)
V2=(t3-t2)/(m2-m3)
dV=V2-V1
eps = 4.5
dC3 = 26
h=0.0097
ds=200e-9
T=cell_temp(temp)
l=l0-level(t4)
set x2r [0:2.9e14]
set x2tics 0.5e14
set yr [-25.5:-23.2]
set y2r [10.7435:10.743999]
set y2tics 0.0001
set xtics nomirror
set xtics ("0.0" 0,"0.05" n10(l,0.05,ds,eps,dC3), "0.1" n10(l,0.1,ds,eps,dC3), "0.15" n10(l,0.15,ds,eps,dC3), "0.2" n10(l,0.2,ds,eps,dC3), "0.25" n10(l,0.25,ds,eps,dC3))

set parametric
plot "<bzcat ../data/mw0109d5.dat.bz2 |smooth -n 5 -" every 6:::(i):1050:(i) u (n10(h,$10-V1,ds,eps,dC3)):(log($11+$17+$19/1e9*$13/1e9)/log(10)*20) axes x2y1 ti "Transmission" w p pt 7, \
	 "" every 6:::(i)::(i) u (n10(h,$10-V1,ds,eps,dC3)):($13/1e9) axes x2y2 ti "Resonanzfrequenz" w p pt 4, \
	n10(h,dV,ds,eps,dC3),-24.5*t axes x2y1 not w l ls 3

load "../gp/analysis_WC.gp"
