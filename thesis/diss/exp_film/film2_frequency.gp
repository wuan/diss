load "../gp/smallps.gp"
set output "film2_frequency.eps"

f1(x)=m1*x+t1
f2(x)=m2*x+t2
f3(x)=m3*x+t3

set xlabel "Haltespannung [V]"
set ylabel "Frequenz [GHz]"
#set xr [-0.5:1]; set yr [9.41702:9.41707]; set ytics 0.00001; FILENAME = "../../data/microwave/2002/mw0204d1/mw0204d1.dat"; i=18
#fit [-1.1:-0.5] f1(x) FILENAME every :::(i)::(i) u 10:($13/1e9) via m1,t1
#fit [-0.01:0.1] f2(x) FILENAME every :::(i)::(i) u 10:($13/1e9) via m2,t2
#fit [0.1:0.3] f3(x) FILENAME every :::(i)::(i) u 10:($13/1e9) via m3,t3
set xr [-0.6:-0.2]; set yr [9.415988:9.416025]; set ytics 0.00001; FILENAME = "<bzcat ../data/mw0204d3.dat.bz2"; i=22
m1=0
fit [-1.1:-0.6] f1(x) FILENAME every :::(i)::(i) u 10:($13/1e9) via t1
fit [-0.41:-0.37] f2(x) FILENAME every :::(i)::(i) u 10:($13/1e9) via m2,t2
fit [-0.31:-0.24] f3(x) FILENAME every :::(i)::(i) u 10:($13/1e9) via m3,t3
set xtics 0.1

V1=(t2-t1)/(m1-m2)
V2=(t3-t2)/(m2-m3)
dV=V2-V1
#set title `printf '"0109_5(7) U_{0}=%.3fV, U_{wc}=%.3fV, {/Symbol D}U=%.3fV"' $V1 $V2 $dV`
plot "<bzcat ../data/mw0204d3.dat.bz2 |smooth -n 5 -" every 2::20:(i):490:(i) u 10:($13/1e9) not w p ps 6, \
	f1(x) not w l ls 1, \
	f2(x) not w l ls 2, \
	f3(x) not w l ls 3


