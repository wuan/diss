load "../gp/absorption_function.gp"
load "../gp/ssmallps.gp"
set output "filmdicke.eps"

set xr [0:2]
set yr [20:110]
set ytics 20

set xlabel "{/Times-Italic h} [cm]"
set ylabel "{/Times-Italic d} [nm]" offset 1
plot d_helium(0.01*x,26)*1e9 not
