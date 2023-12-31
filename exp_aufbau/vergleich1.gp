load "../gp/smallps.gp"
set output "vergleich1.eps"

FILENAME = "<bzcat ../data/mw9908d1.dat.bz2"
set timefmt "%d.%m.%y %H:%M:%S"
set xdata time
set style data lines
set ylabel "Frequenz [GHz]"
set y2label "Amplitude [dB]"
set xlabel "Zeit [h]"
set ytics nomirror 0.00025
set y2tics 0.5
set format x "%H:%M"
set xtics 120
set yr [9.78575:9.787]
set y2r [-19.5:-17.5]
set key spacing 1.5
set xrange ["06.08.99 18:03:00":"06.08.99 18:09:00"]
plot FILENAME every ::1990:1:2050:1  u 1:($13/1e9) ti "Frequenz" w l lt 1 lc 1,\
	 FILENAME every ::1990:1:2050:1  u 1:(log($11)/log(10)*20) axes x1y2 ti "Amplitude" w l lt 2 lc 1
