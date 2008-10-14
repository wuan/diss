load "../gp/ssmallps.gp"
set output "drec.eps"

set xlabel "Anzahl der Iterationen"
set ylabel "{/Symbol D}{/Times-Italic d} [nm]" -3.5
set lmargin 9
set ytics axis
set ytics ("10^{-12}" 1e-12, "10^{-9}" 1e-9, "10^{-6}" 1e-6, "10^{-3}" 1e-3, "1" 1)
set log y

set key samplen 0.5 spacing 2

plot "../data/drec.dat" u 1:2 ti "U_{clamp}=1V" w p 7, "" u 1:3 ti "U_{clamp}=2V" w p 6
