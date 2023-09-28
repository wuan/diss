load "../gp/smallps.gp"
set output "filmpressure.eps"
load "../gp/e_density.gp"	


set key spacing 1.5 samplen 2
set xr [5e12:1e15]
set log x

set bmargin 4

set xlabel "Elektronendichte {/Times-Italic n_s} [m^{-2}]"
set ylabel "Helium-Filmdicke {/Times-Italic d} [nm]" offset 1
plot d(0.005,x)*1e9 ti "{/Times-Italic h} = 5 mm", \
	 d(0.01,x)*1e9 ti "{/Times-Italic h} = 10 mm", \
	 d(0.02,x)*1e9 ti "{/Times-Italic h} = 20 mm"
