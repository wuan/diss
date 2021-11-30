load "../gp/smallps.gp"
set output "bulk_cr_res4.eps"

FILENAME = "<bzcat ../data/cr0210d2.dat.bz2"

set xlabel "normierte Haltespannung"
set yl "Frequenzamplitude [bel. Einh]"
set key right bottom
plot FILENAME every :::2::2 u ($1/384):($5*1e3) ti "U_{crit}=384V" w lp ls 1 ps 7, \
     FILENAME every :::1::1 u ($1/81):($5*1e3) ti "U_{crit}=81V" w lp ls 3 ps 9


