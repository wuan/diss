load "../gp/midps.gp"
set output "film_high_n.eps"

f1(x)=m1*x+t1
f2(x)=m2*x+t2
f3(x)=m3*x+t3

set xlabel "Haltespannung [V]"
set ylabel "Transmission [dB]"
set y2label "Resonanzfrequenz [GHz]"

set key samplen 0.5 spacing 2

set xr [0:*]
#set yr [-25.3:-23]
i=64
m1=0
FILENAME = "<bzcat ../data/mw0202d4.dat.bz2"
#fit [0.2:0.7] f1(x) FILENAME every :::(i)::(i) u 10:(log($11+$17+$19/1e9*$13/1e9)/log(10)*20) via t1
#fit [0.75:0.80] f2(x) FILENAME every :::(i)::(i) u 10:(log($11+$17+$19/1e9*$13/1e9)/log(10)*20) via m2,t2
#fit [0.85:1] f3(x) FILENAME every :::(i)::(i) u 10:(log($11+$17+$19/1e9*$13/1e9)/log(10)*20) via m3,t3
#V1=(t2-t1)/(m1-m2)
#V2=(t3-t2)/(m2-m3)
#dV=V2-V1
set ytics nomirror
set y2tics 0.0001
plot FILENAME every 15:::(i)::(i) u 10:(log($11+$17+$19/1e9*$13/1e9)/log(10)*20) ti "Transmission" w p ps 7, \
	FILENAME every 15:::(i)::(i) u 10:($13/1e9) axes x1y2 ti "Frequenz" w p ps 4
#	f1(x) not w l 1, \
#	f2(x) not w l 2, \
#	f3(x) not w l 3


