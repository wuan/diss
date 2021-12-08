load "../gp/smallps.gp"
set output "film_overview.eps"

load "../gp/level_c.gp"
load "../gp/e_density.gp"
load "../gp/cell_temp.gp"

#set pointsize 1

set yr [27.5:38]
set xr [1.15:1.65]
set xtics 0.1

set xlabel "Temperatur [K]"
set ylabel "Helium-Filmdicke {/Times-Italic d}_0 [nm]"

set bmargin 4

l0=15.8

plot "film_overview.dat" u (cell_temp($2*1e3)):(d((l0-level($4))/1e3,0)*1e9) not w p pt 6
