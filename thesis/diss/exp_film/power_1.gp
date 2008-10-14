load "../gp/midps.gp"
set output "power_1.eps"

FILENAME = "<bzcat ../data/mw0204d1.dat.bz2"

set key samplen 0.5 spacing 2

set xlabel "Haltespannung [V]"
set ylabel "Transmission [dB]"
set y2label "Resonanzfrequenz [GHz]"
set xr [0:1.6]
set x2r [0:1.6]
set ytics nomirror 0.2
set y2tics 0.00002
set yr [-17.4:-16.0]
set y2r [9.41698:9.41708]
set xtics 0.4
set arrow 2 from first 0.47,-17.35 to second 0.47,9.417065 nohead lw 5
set label 2 "Position 1" at first 0.50,-17.32
set arrow 3 from first 1.53,-17.35 to first 1.53,-16.7 nohead lw 5
set label 3 "Position 2" at first 1.5,-17.32 right

plot FILENAME every 3::280:20:570:20  u 10:(log($11+$17+$19/1e9*$13/1e9)/log(10)*20) ti "Transmission" w p 7, \
	 FILENAME every 3::280:20:570:20  u 10:($13/1e9) axes x1y2 ti "Frequenz" w p 4
