load "../gp/smallps.gp"
load "../gp/film_thickness.gp"
set output "cr0202d4_006.eps"

set ytics nomirror
set ylabel "Transmission [bel. Einh.]"
set y2label "Resonanzfrequenz [GHz]"
set xlabel "Magnetfeld [T]"

set xtics 0.2
set xr [0:0.9]
set y2tics 0.0001
set ytics 0.0025
set yr [0.133:0.145]
set y2r [10.90057:10.9007]

set key spacing 1.5

plot "<bzcat ../data/mw0202d4.dat.bz2" every 2:::10::10 u (0.0401*$40):($11+$17+$19/1e9*$13/1e9) ti "Transmission" w p ps 3 pt 7, \
	"" every 2:::10::10 u (0.0401*$40):($13/1e9) axes x1y2 ti "Resonanzfrequenz" w p ps 1 pt 4
