load "../gp/smallps.gp"
set output "he_level.eps"

cb1=23.49
levelb(c)=25*(c-cb1)/(0.0572*cb1)

set xlabel "Heliumstand im Kondensator [mm]"
set x2label "{/Times-Italic h} [mm]"
set ylabel "Resonanzfrequenz [GHz]"
set xr [5:25]
set yr [10.71:10.963]
set xtics nomirror
set x2tics
set x2r [5-15.8:25-15.8]
set parametric
plot "<bzcat ../data/mw0202d3.dat.bz2 |smooth -n 5 -" every :::40::40 u (levelb($32*1e12)-0.2):($13/1e9) not w l lt 1 lw 4, \
	15.8,10+t not
