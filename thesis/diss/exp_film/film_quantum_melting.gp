load "../gp/midps.gp"
load "../gp/e_density.gp"
load "../gp/film_thickness.gp"
load "../gp/level_c.gp"
load "../gp/cell_temp.gp"

set output "film_quantum_melting.eps"

f1(x)=m1*x+t1
f2(x)=m2*x+t2
f3(x)=m3*x+t3
f4(x)=m4*x+t4
c(x)=level_c
t(x)=temp

i=7
FILENAME = "<bzcat ../data/mw0202d2.dat.bz2"
fit [-0.95:-0.2] f1(x) FILENAME every :::(i)::(i) u 10:(log($11+$17+$19/1e9*$13/1e9)/log(10)*20) via m1,t1
fit [-0.12:-0.02] f2(x) FILENAME every :::(i)::(i) u 10:(log($11+$17+$19/1e9*$13/1e9)/log(10)*20) via m2,t2
fit [0.3:1.8] f3(x) FILENAME every :::(i)::(i) u 10:(log($11+$17+$19/1e9*$13/1e9)/log(10)*20) via m3,t3
fit [2:2.25] f4(x) FILENAME every :::(i)::(i) u 10:(log($11+$17+$19/1e9*$13/1e9)/log(10)*20) via m4,t4
fit c(x) FILENAME every :::(i)::(i) u 0:32 via level_c
fit t(x) FILENAME every :::(i)::(i) u 0:4 via temp
V1=(t2-t1)/(m1-m2)
V2=(t3-t2)/(m2-m3)
V3=(t4-t3)/(m3-m4)
dV=V2-V1
dV2=V3-V2
eps = 4.5
dC3 = 26
ds=200e-9
T=cell_temp(temp)
	
set xlabel "relative Haltespannung [V]"
set x2label "Elektronendichte [m^{-2}]"
set ylabel "Transmission [dB]"
set y2label "Resonanzfrequenz [GHz]"

l=l0-level(level_c)
print "level: ",l
set xtics nomirror
set xtics ("0.0" 0,"0.5" n10(l*1e-3,0.5,ds,eps,dC3), "1.0" n10(l*1e-3,1,ds,eps,dC3), "1.5" n10(l*1e-3,1.5,ds,eps,dC3), "2.0" n10(l*1e-3,2,ds,eps,dC3), "2.5" n10(l*1e-3,2.5,ds,eps,dC3), "3.0" n10(l*1e-3,3,ds,eps,dC3))
set x2r [-3e14:3.3e15]
set x2tics 1e15
set mx2tics 2
set ytics nomirror
set yr [-17.5:-16]
set mytics 2
set y2tics 0.0001
set my2tics 2
set y2r [10.9407:10.94125]
set key graph 0.50,0.95 samplen 0.5 spacing 2

set parametric

plot FILENAME every 9:::(i):1200:(i) u (n10(l*1e-3,$10-V1,ds,eps,dC3)):(log($11+$17+$19/1e9*$13/1e9)/log(10)*20) axes x2y1 ti "Transmission" w p 7, \
	FILENAME every 9:::(i):1200:(i) u (n10(l*1e-3,$10-V1,ds,eps,dC3)):($13/1e9) axes x2y2 ti "Frequenz" w p 4, \
	n10(l*1e-3,t-V1,ds,eps,dC3),f1(t) axes x2y1 not, \
	n10(l*1e-3,t-V1,ds,eps,dC3),f2(t) axes x2y1 not, \
	n10(l*1e-3,t-V1,ds,eps,dC3),f3(t) axes x2y1 not, \
	n10(l*1e-3,t-V1,ds,eps,dC3),f4(t) axes x2y1 not

load "../gp/analysis_WC.gp"
load "../gp/analysis_QM.gp"

