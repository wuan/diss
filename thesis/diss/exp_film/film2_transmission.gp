load "../gp/smallps.gp"
set output "film2_transmission.eps"

f1(x)=m1*x+t1
f2(x)=m2*x+t2
f3(x)=m3*x+t3

set xlabel "Haltespannung [V]"
set ylabel "Transmission [dB]"

set xr [-0.6:-0.2]; set yr [-16.45:-15.9]; set ytics 0.1; FILENAME = "<bzcat ../data/mw0204d3.dat.bz2"; i=22
m1=0
fit [-1.1:-0.6] f1(x) FILENAME every :::(i)::(i) u 10:(log($11+$17+$19/1e9*$13/1e9)/log(10)*20) via t1
fit [-0.4:-0.35] f2(x) FILENAME every :::(i)::(i) u 10:(log($11+$17+$19/1e9*$13/1e9)/log(10)*20) via m2,t2
fit [-0.26:-0.23] f3(x) FILENAME every :::(i)::(i) u 10:(log($11+$17+$19/1e9*$13/1e9)/log(10)*20) via m3,t3

set xtics 0.1
V1=(t2-t1)/(m1-m2)
V2=(t3-t2)/(m2-m3)
dV=V2-V1
plot "<bzcat ../data/mw0204d3.dat.bz2 |smooth -n 5 -" every 2::10:(i):490:(i) u 10:(log($11+$17+$19/1e9*$13/1e9)/log(10)*20) not w p 6, \
	f1(x) not w l 1, \
	f2(x) not w l 2, \
	f3(x) not w l 3


