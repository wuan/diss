load "../gp/smallps.gp"
set output "fil_instability.eps"

FILENAME = "<bzcat ../data/mw0210d1.dat.bz2"

set xlabel "Zeit [min]"
set xr [0:75]
set yr [0.06:0.15]
set y2r [0:*]
set ytics 0.02
set ytics nomirror
set y2tics
set key top left
set ylabel "Transmission [bel. lin. Einh.]"
set y2label "Haltespannung [V]"
plot FILENAME every ::96:7::7 u (($0+96)/6):($21+$27+$29/1e9*$23/1e9) not w p pt 12, \
	 FILENAME every :::7:96:7 u ($0/6):($11+$17+$19/1e9*$13/1e9) not w p pt 12, \
	 FILENAME every :::7::7 u ($0/6):10 axes x1y2 ti "U_{clamp}" w l lt 1
