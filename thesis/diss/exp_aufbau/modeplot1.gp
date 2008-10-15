load "../gp/smallps.gp"
set output "modeplot1.eps"

TM010(a,d)=11.47425278352088/a
TM011(a,d)=5e-10*sqrt(5.266339077605467e20 + 8.987551787368177e20*a**2/d**2)/a

set xr [1.9:2.1]

set xlabel "d [cm]"
set ylabel "f_{Resonanz} [GHz]"

set key graph 0.45,0.25 spacing 2

plot TM011(0.95,x) ti "TM011" w l 3,TM010(0.95,x) ti "TM010" w l 1
