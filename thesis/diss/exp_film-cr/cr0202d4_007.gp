load "../gp/cr_paper_functions.gp"

load "../gp/smidps.gp"
set output "cr0202d4_007.eps"

#set pointsize 2
oa=1e-7
ot0=2
odd=30
FIT_LIMIT=1e-25
FILENAME = "<bzcat ../data/cr_giampaolo.dat.bz2"
fit 100*nul(x*0.1,oa,ot0)-odd FILENAME u (h($1)):($7) via oa,ot0,odd

set key bottom right
a=1e-13
t0=1.02
dd=15.42
FIT_LIMIT=1e-12
FILENAME = "<bzcat ../data/cr0202d4.dat.bz2"
fit 100*nul(x*0.1,a,t0)-dd FILENAME u ($1*1e3):7 via a,t0,dd

set xlabel "Abstand zur Oberfläche des Bulk-Helium {/Times-Italic h} [mm]"
set ylabel "{/Times-Italic n_e / n_s} [%]"
set label "(1)" at (3.90),(73.1324+5) center
set label "(2)" at (6.506),(66.1237+5) center
set label "(3)" at (11.920),(56.842806+5) center
set yr [0:100]
set xr [1.5:12.5]
set key spacing 2
plot FILENAME u ($1*1e3):7 not w p pt 1 ps 7,  \
    100*nul(x*0.1,a,t0)-dd ti "SiO_2" w l lt 1 lw 3, \
	"<bzcat ../data/cr_giampaolo.dat.bz2" u (h($1)):7 not w p pt 3 ps 6,  \
    100*nul(x*0.1,oa,ot0)-odd ti "PMMA" w l lt 3 lw 3
	
