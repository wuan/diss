load "../gp/midps.gp"
set output "film_high_n_pmma.eps"

f1(x)=m1*x+t1
f2(x)=m2*x+t2
f3(x)=m3*x+t3
set pointsize 1.5

set xlabel "Haltespannung [V]"
set ylabel "Transmission [dB]"
set y2label "Resonanzfrequenz [GHz]"
set key samplen 0.5 spacing 2

set xr [-1.5:*]
set yr [-19.49:-18.98]
set ytics 0.1
i=97
m1=0
FILENAME = "<bzcat ../data/mw0204d4.dat.bz2 |smooth -n 5 -"
set ytics nomirror
set y2tics 0.00001
plot FILENAME every 15:::(i)::(i) u 10:(log($11+$17+$19/1e9*$13/1e9)/log(10)*20) ti "Transmission" w p 7, \
	FILENAME every 15:::(i)::(i) u 10:($13/1e9) axes x1y2 ti "Frequenz" w p 4

