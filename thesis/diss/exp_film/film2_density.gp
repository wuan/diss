load "../gp/midps.gp"
load "../gp/e_density.gp"
load "../gp/film_thickness.gp"
load "../gp/level_c.gp"

set output "film2_density.eps"

f1(x)=m1*x+t1
f2(x)=m2*x+t2
f3(x)=m3*x+t3
f4(x)=t4

set xlabel "Haltespannung [V]"
set x2label "Elektronendichte [m^{-2}]"
set ylabel "Transmission [dB]"
set ytics nomirror
set y2tics 
set y2label "Resonanzfrequenz [GHz]"
set key samplen 0.5 spacing 2

set x2r [0:9e13]
set x2tics 2e13
set yr [-16.9:-16]
set y2r [9.415995:9.416023]
set y2tics 0.00001
set yr [-16.45:-15.9]; set ytics 0.1; FILENAME = "<bzcat ../data/mw0204d3.dat.bz2"; i=22
m1=0
fit [-1.1:-0.6][*:*] f1(x) FILENAME every :::(i)::(i) u 10:(log($11+$17+$19/1e9*$13/1e9)/log(10)*20) via t1
fit [-0.42:-0.35][*:*] f2(x) FILENAME every :::(i)::(i) u 10:(log($11+$17+$19/1e9*$13/1e9)/log(10)*20) via m2,t2
fit [-0.26:-0.24][*:*] f3(x) FILENAME every :::(i)::(i) u 10:(log($11+$17+$19/1e9*$13/1e9)/log(10)*20) via m3,t3
fit [*:*][*:*] f4(x) FILENAME every :::(i)::(i) u 0:32 via t4
V1=(t2-t1)/(m1-m2)
V2=(t3-t2)/(m2-m3)
dV=V2-V1-0.02
eps = 1.7
dC3 = 26
h=0.007
ds=200e-9
T=1.29
l=l0-level(t4)
set xtics nomirror
set xtics ("0.0" 0,"0.05" n10(l,0.05,ds,eps,dC3), "0.1" n10(l,0.1,ds,eps,dC3), "0.15" n10(l,0.15,ds,eps,dC3), "0.2" n10(l,0.2,ds,eps,dC3), "0.25" n10(l,0.25,ds,eps,dC3))
set parametric
plot "<bzcat ../data/mw0204d3.dat.bz2 | smooth -n 5 -" every 2::10:(i):490:(i) u (n10(h,$10-V1,ds,eps,dC3)):(log($11+$17+$19/1e9*$13/1e9)/log(10)*20) axes x2y1 ti "Transmission" w p ps 7, \
	"" every 2::10:(i):490:(i) u (n10(h,$10-V1,ds,eps,dC3)):($13/1e9) axes x2y2 ti "Resonanzfrequenz" w p ps 4, \
	n10(h,dV,ds,eps,dC3),-16.2+t/3 axes x2y1 not w l ls 3

load "../gp/analysis_WC.gp"
