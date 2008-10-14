load "../gp/smallps.gp"
set output "bulk_cr_res1.eps"

load "../gp/absorption_function.gp"

FILENAME = "<bzcat ../data/cr0210d2.dat.bz2"

set xlabel "Elektronendichte [10^{13} 1/m^2]"
set ylabel "{/Symbol n}_{CR} [GHz]"
set key left bottom width -5 spacing 2.5
set xr [0:2.2]
set xtics 0.5

set bmargin 4

plot FILENAME every :::2::2 u ($1/384*2.2):(w($2)/1e9/2/pi) ti "U_{crit}=384V" w lp 1 7, \
     FILENAME every :::1::1 u ($1/81*1.4):(w($2)/1e9/2/pi) ti "U_{crit}=81V" w lp 3 9


