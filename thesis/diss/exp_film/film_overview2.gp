load "../gp/smallps.gp"
set output "film_overview2.eps"

load "../gp/level_c.gp"
load "../gp/cell_temp.gp"
load "../gp/e_density.gp"

#set pointsize 1

#set yr [100:300]
set xr [28:36]
#set xtics 1

set xlabel "Helium-Filmdicke {/Times-Italic d}_0 [nm]"
set ylabel "{/Symbol G}"

set bmargin 4

l0=15.8
es=1.7
dC3=26
ds=200e-9

plot "film_overview.dat" u (d((l0-level($4))/1e3,0)*1e9):(Tsct(n10(l0-level($4),($10-$8)/($7-$9)-($8-$6)/($5-$7),ds,es,dC3),d10(l0-level($4),($10-$8)/($7-$9)-($8-$6)/($5-$7),ds,es,dC3),es,1)/cell_temp($2*1e3)) not w p 6, \
	130 not w l 2

