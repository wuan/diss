load "../gp/smallps.gp"
set output "uclamp_d_dep.eps"

load "../gp/e_density.gp"
load "../gp/film_thickness.gp"
set key at graph 0.95,0.83 spacing 1.5 samplen 2
set yr [0:32]
set xr [0:2]
set xlabel "Haltespannung [V]"
set ylabel "Helium-Filmdicke {/Times-Italic d} [nm]"
plot d0(0.01,26)/1e-9 ti "nach Gleichung (1.16)" w l,\
	 d10(0.01,x,200e-9,4.5,26)/1e-9 ti "selbstkonsistente Methode" w l lw 5
