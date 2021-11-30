load "../gp/smallps.gp"

set output "pmma_reproduce2.eps"

set xr [-0.7:0.0]

set key bottom left samplen 0.5 width -2 spacing 2

set xlabel "Haltespannung [V]"
set ylabel "T_{TM010} / T_{TM011}"
set xtics 0.2
set ytics 0.01

i=34
j=55
FILENAME = "<bzcat ../data/mw0204d4.dat.bz2 |smooth -n 20 -"
#FILENAME = "../../data/microwave/2002/mw0204d4/mw0204d4.dat"

plot FILENAME every 5:::(i):550:(i) u 10:(($11+$17+$19/1e9*$13/1e9)/($21+$27+$29/1e9*$23/1e9)) ti "frühe Beladung" w p ps 7, \
	FILENAME every :::(i):180:(i) u 10:(($11+$17+$19/1e9*$13/1e9)/($21+$27+$29/1e9*$23/1e9)) not w p ps 7, \
	FILENAME every 5:::(j):400:(j) u 10:(($11+$17+$19/1e9*$13/1e9)/($21+$27+$29/1e9*$23/1e9)) ti "später" w p ps 6, \
	FILENAME every :::(j):180:(j) u 10:(($11+$17+$19/1e9*$13/1e9)/($21+$27+$29/1e9*$23/1e9)) not w p ps 6
