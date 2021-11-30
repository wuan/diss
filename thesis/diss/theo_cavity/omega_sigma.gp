load "../gp/smidps.gp"
set output "omega_sigma.eps"

set xlabel "{/Symbol s}"
set ylabel "resonance frequency {/Symbol w} [a.u.]"

set key top right
set auto x
set yr [0.5:3.9]

plot "omega_sigma.dat" u 1:2 ti "1: {/Symbol d}=0" w l lt 1 lw 2, pi not w p ls 5,\
	"" u 1:3 ti "2: {/Symbol d}=0.3, {/Symbol e}_1" w p ls 1, pi/2/1 not w p ls 6,\
	"" u 1:4 ti "3: {/Symbol d}=0.3, {/Symbol e}_2" w p ls 2,\
	"" u 1:5 ti "4: {/Symbol d}=0.3, {/Symbol e}_3" w p ls 3
