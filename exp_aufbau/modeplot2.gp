load "../gp/smallps.gp"
set output "modeplot2.eps"

TM010(a,d)=11.47425278352088/a
TM011(a,d)=5e-10*sqrt(5.266339077605467e20 + 8.987551787368177e20*a**2/d**2)/a

set xr [0.85:1.05]

set xlabel "a [cm]"
set ylabel "f_{Resonanz} [GHz]"
set ytics 1

set key spacing 1.5

plot TM011(x,2.0) ti "TM011" w l lt 3, TM010(x,2.0) ti "TM010" w l lt 1
