load "../gp/smallps.gp"
load "../gp/film_thickness.gp"
load "../gp/cr_paper_functions.gp"

set output "cr0202d4_004.eps"

set key bottom right spacing 1.5

set xr [25:50]
set ylabel "{/Times-Italic n_e / n_s} [%]"
set xlabel "Filmdicke {/Times-Italic d_0} [nm]"
set label "(a)" at (d0(0.00390,26)*1e9),(73.1324+2.5) center
set label "(b)" at (d0(0.006506,26)*1e9),(66.1237+2.5) center
set label "(c)" at (d0(0.011920,26)*1e9),(56.842806+2.5) center

set yr [40:80]
set bmargin 4

plot "<bzcat ../data/cr0202d4.dat.bz2" u (d0($1,26)*1e9):7 ti "SiO_2" w lp ls 1 pt 7, \
	"<bzcat ../data/crpaper2_fit.dat.bz2" u (d0(h($1)*1e-3,20)*1e9):7 ti "PMMA" w lp ls 3 pt 6
