load "../gp/midps.gp"
set output "film_quantum_melting.eps"
load "../gp/e_density.gp"
load "../gp/level_c.gp"

f1(x)=m1*x+t1
f2(x)=m2*x+t2
f3(x)=m3*x+t3
c(x)=level_c

i=7
set filename "../../data/microwave/2002/mw0202d2/mw0202d2.dat"
fit [-0.95:-0.2] f1(x) "" every :::(i)::(i) u 10:(log($11+$17+$19/1e9*$13/1e9)/log(10)*20) via m1,t1
fit [-0.1:0] f2(x) "" every :::(i)::(i) u 10:(log($11+$17+$19/1e9*$13/1e9)/log(10)*20) via m2,t2
fit c(x) "" every :::(i)::(i) u 0:($32) via level_c
V1=(t2-t1)/(m1-m2)
	
set xlabel "Elektronendichte [m^{-2}]"
set ylabel "Transmission [dB]"
set y2label "Resonanzfrequenz [GHz]"

set xr [0:4e15]
set xtics 1e15
set ytics nomirror
set yr [-17.5:-16]
set y2tics 0.0001
set y2r [10.9407:10.94125]
ds=200e-9
es=5
dC3=26

plot "" every 9:::(i):1200:(i) u (n10(l0-level(level_c),$10-V1,ds,es,dC3)):(log($11+$17+$19/1e9*$13/1e9)/log(10)*20) ti "Transmission" w p 7, \
	"" every 9:::(i):1200:(i) u (n10(l0-level(level_c),$10-V1,ds,es,dC3)):($13/1e9) axes x1y2 ti "Frequenz" w p 4

