load "../gp/smallps.gp"
set output "vergleich2.eps"

FILENAME = "<bzcat ../data/mw9908d1.dat.bz2"
set timefmt "%d.%m.%y %H:%M:%S"
set xdata time
set style data lines
set ylabel "Frequenz [GHz]"
set y2label "Amplitude [dB]"
set xlabel "Zeit [h]"
set ytics nomirror 0.00025
set y2tics 0.5
set xtics 600
set format x "%H:%M"
set yr [9.78575:9.787]
set y2r [-19.5:-17.5]
set key spacing 2
set xrange ["06.08.99 18:27:00":"06.08.99 18:50:00"]
plot FILENAME every ::10:2:145:2 u 1:($13/1e9) ti "Frequenz" w l lt 1 lc 1,\
	 FILENAME every ::10:2:145:2 u 1:(log($11)/log(10)*20) axes x1y2 ti "Amplitude" w l lt 2 lc 1
