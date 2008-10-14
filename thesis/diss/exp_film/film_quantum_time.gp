load "../gp/midps.gp"
set output "film_quantum_time.eps"

FILENAME = "<bzcat ../../data/microwave/2002/mw0202d2/mw0202d2.dat.bz2"

set xlabel "Zeit [h]"	
set ylabel "Transmission [dB]"
set y2label "Resonanzfrequenz [GHz]"

set key screen 0.52,0.92 samplen 0.5 spacing 2
set ytics nomirror
set yr [-17.5:-16]
set xtics 3600
set y2tics 0.0001
set y2r [10.9407:10.94125]
set format x "%k"
x1=66497000
x2=66498000
x3=66503500
x4=66506000
x5=66506550
dx=100
set label 1 "1" at x1-dx,-16.8 right
set label 2 "2" at x2-dx,-16.8 right
set label 3 "3" at x3-dx,-16.8 right
set label 4 "4" at x4-dx,-16.8 right
set label 5 "5" at x5+dx,-16.8 left
set xdata time
set timefmt "%d.%m.%y %H:%M:%S"
set xr ["08.02.02 14:25:00":"08.02.02 19:00:00"]
set parametric
plot FILENAME every 8:::6::8 u 1:(log($11+$17+$19/1e9*$13/1e9)/log(10)*20) ti "Transmission" w p 7, \
	FILENAME every 8:::6::8 u 1:($13/1e9) axes x1y2 ti "Frequenz" w p 4, \
	x1,t-17 not w l 1, \
	x2,t-17 not w l 1, \
	x3,t-17 not w l 1, \
	x4,t-17 not w l 1, \
	x5,t-17 not w l 1

