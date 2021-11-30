load "../gp/smallps.gp"

set output "pmma_reproduce.eps"

set xr [-0.7:0.0]

f1(x)=m1*x+t1
f2(x)=m2*x+t2

set key bottom left samplen 0.5 width -2 spacing 2

set xlabel "Haltespannung [V]"
set ylabel "Transmission [dB]"
set xtics 0.2
set ytics 0.1

i=34
j=55
FILENAME = "<bzcat ../data/mw0204d4.dat.bz2"
fit [-0.7:-0.5] f1(x) FILENAME every :::(i)::(i) u 10:(log($11+$17+$19/1e9*$13/1e9)/log(10)*20) via t1,m1
fit [-0.7:-0.5] f2(x) FILENAME every :::(j)::(j) u 10:(log($11+$17+$19/1e9*$13/1e9)/log(10)*20) via t2,m2

FILENAME = "<bzcat ../data/mw0204d4.dat.bz2 |smooth -n 5 -"
plot FILENAME every 5:::(i):550:(i) u 10:(log($11+$17+$19/1e9*$13/1e9)/log(10)*20) ti "frühe Beladung" w p ps 7, \
	FILENAME every :::(i):180:(i) u 10:(log($11+$17+$19/1e9*$13/1e9)/log(10)*20) not w p ps 7, \
	f1(x) not, \
	FILENAME every 5:::(j):400:(j) u 10:(log($11+$17+$19/1e9*$13/1e9)/log(10)*20) ti "später" w p ps 6, \
	FILENAME every :::(j):180:(j) u 10:(log($11+$17+$19/1e9*$13/1e9)/log(10)*20) not w p ps 6, \
	f2(x) not
