load "../gp/smallps.gp"
set output "uclamp_n_dep.eps"

load "../gp/e_density.gp"

set key at graph 0.80,0.94 spacing 1.5 samplen 2

set xr [0:2]
set yr [0:25]
set xlabel "Haltespannung [V]"
set ylabel "Elektronendichte {/Times-Italic n_s} [10^{14}m^{-2}]"
plot n0(0.01,x,200e-9,4.5,26)/1e14 ti "nach Gleichung (1.19)" w l,\
	 n10(0.01,x,200e-9,4.5,26)/1e14 ti "selbstkonsistente Methode" w l lw 5
