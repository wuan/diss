load "../gp/midps.gp"
set output "film_high_n_sio2.eps"
load "../gp/e_density.gp"
load "../gp/film_thickness.gp"
load "../gp/level_c.gp"
load "../gp/cell_temp.gp"

f1(x)=m1*x+t1
f2(x)=m2*x+t2
f3(x)=m3*x+t3
c(x)=level_c
t(x)=temp

i=20
FILENAME = "<bzcat ../data/mw0202d2.dat.bz2"
fit [0:0.8] f1(x) FILENAME every :::(i)::(i) u 10:(log($11+$17+$19/1e9*$13/1e9)/log(10)*20) via m1,t1
fit [1.1:1.3] f2(x) FILENAME every :::(i)::(i) u 10:(log($11+$17+$19/1e9*$13/1e9)/log(10)*20) via m2,t2
fit [1.5:1.6] f3(x) FILENAME every :::(i)::(i) u 10:(log($11+$17+$19/1e9*$13/1e9)/log(10)*20) via m3,t3
fit c(x) FILENAME every :::(i)::(i) u 0:32 via level_c
fit t(x) FILENAME every :::(i)::(i) u 0:4 via temp
V1=(t2-t1)/(m1-m2)
V2=(t3-t2)/(m2-m3)
dV=V2-V1
eps = 4.5
dC3 = 26
T=cell_temp(temp)
	
set xlabel "relative Haltespannung [V]"
set x2label "Elektronendichte [m^{-2}]"
set ylabel "Transmission [dB]"
set y2label "Resonanzfrequenz [GHz]"

l=l0-level(level_c)
ds=200e-9
set xtics nomirror
set xtics ("0.0" 0,"1.0" n10(l,1,ds,eps,dC3), "2.0" n10(l,2,ds,eps,dC3), "3.0" n10(l,3,ds,eps,dC3), "4.0" n10(l,4,ds,eps,dC3), "5.0" n10(l,5,ds,eps,dC3), "6.0" n10(l,6,ds,eps,dC3), "7.0" n10(l,7,ds,eps,dC3))
set x2r [-5e14:8.4e15]
set x2tics 2e15
set ytics nomirror
set yr [-19:-15.8]
set y2tics 0.0001
set my2tics 2
set mx2tics 2
set mytics 2
set y2r [10.94314:10.94374]
set key left width 20 samplen 0.5 spacing 2

plot FILENAME every 9:::(i)::(i) u (n10(l,$10-V1,ds,eps,dC3)):(log($11+$17+$19/1e9*$13/1e9)/log(10)*20) axes x2y1 ti "Transmission" w p ps 7, \
	FILENAME every 9:::(i)::(i) u (n10(l,$10-V1,ds,eps,dC3)):($13/1e9) axes x2y2 ti "Frequenz" w p ps 4

print Tsct(n10(l*1e-3,dV,ds,eps,dC3),d10(l*1e-3,dV,ds,eps,dC3),eps,1)/T,T,n10(l*1e-3,dV,ds,eps,dC3)
load "../gp/analysis_WC.gp"
