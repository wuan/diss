load "../gp/ssmallps.gp"
n0=5.0719206823460106e14
set output "nrec.eps"

set xlabel "Anzahl der Iterationen"
set ylabel "{/Symbol D}{/Times-Italic n_s} [10^{14} m^{-2}]"

set key samplen 0.5 spacing 2

set log y
set lmargin 8
set ytics axis
set ytics ("10^{-12}" 1e-12, "10^{-9}" 1e-9, "10^{-6}" 1e-6, "10^{-3}" 1e-3, "1" 1)
plot "<bzcat ../data/nrec.dat.bz2" u 1:2 ti "U_{clamp}=1V" w p 7, "" u 1:3 ti "U_{clamp}=2V" w p 6
