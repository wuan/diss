load "../gp/smallps.gp"
set output "bulk_cr_res3.eps"
f1(x)=a1*x**2+b1
f2(x)=a2*x**2+b2

FILENAME = "<bzcat ../data/cr0210d2.dat.bz2"

set xlabel "Elektronendichte [10^{13} 1/m^2]"
set yl "Frequenzverschiebung [MHz]"
set xr [0:2.2]
set xtics 0.5

set bmargin 4

fit f1(x) FILENAME every :::2::2 u ($1/384*2.2):(1e3*(sqrt(1/$4)-sqrt(1/0.01196319))) via a1, b1
fit f2(x) FILENAME every :::1::1 u ($1/81*1.4):(1e3*(sqrt(1/$4)-sqrt(1/0.01154851))) via a2, b2
set key left top spacing 2.5
plot FILENAME every :::2::2 u ($1/384*2.2):(1e3*(sqrt(1/$4)-sqrt(1/0.01196319))-b1) ti "U_{crit}=384V" w lp ls 1 ps 7,\
     FILENAME every :::1::1 u ($1/81*1.4):(1e3*(sqrt(1/$4)-sqrt(1/0.01154851))-b2) ti "U_{crit}=81V" w lp ls 3 ps 9

print a1,b1


