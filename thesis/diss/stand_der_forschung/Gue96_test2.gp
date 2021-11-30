load "../gp/smallps.gp"
load "../gp/e_density.gp"
load "../gp/film_thickness.gp"
load "../gp/level_c.gp"
load "../gp/cell_temp.gp"

set output "Gue96_test2.eps"

f1(x)=m1*x+t1
f2(x)=m2*x+t2
f3(x)=m3*x+t3
f4(x)=t4
t(x)=temp

set xlabel "relative Haltespannung [V]"
set x2label "Elektronendichte [10^{14} m^{-2}]"
set ylabel "Absorption {/Symbol a} [10^{-4}]" offset 1
set key bottom right

set bmargin 4
set tmargin 4

fit [0.2:0.8] f1(x) "Gue96_test.dat" via m1,t1
fit [1.1:1.4] f2(x) "" via m2,t2
fit [1.5:2] f3(x) "" via m3,t3
V1=(t2-t1)/(m1-m2)
V2=(t3-t2)/(m2-m3)
dV=V2-V1
eps = 4.5
dC3 = 26
ds=490e-9
T=1.2
l=3.9
set zeroaxis
set x2r [-1:5]
set x2tics 1
set yr [0.2:1]
set ytics 0.2
#set yr [-25.5:-23.2]
#set y2r [10.7435:10.74397]
#set y2tics 0.0001
set xtics nomirror
set xtics ("0.0" 0, "0.2" 1e-14*n10(l*1e-3,0.2,ds,eps,dC3), "0.4" 1e-14*n10(l*1e-3,0.4,ds,eps,dC3), "0.6" 1e-14*n10(l*1e-3,0.6,ds,eps,dC3), "0.8" 1e-14*n10(l*1e-3,0.8,ds,eps,dC3),"1.0" 1e-14*n10(l*1e-3,1.0,ds,eps,dC3))

set parametric
plot "" u (1e-14*n10(l*1e-3,$1-V1,ds,eps,dC3)):2 axes x2y1 not w p pt 7,(1e-14*n10(l*1e-3,dV,ds,eps,dC3)),(t+5)/10 axes x2y1 not
load "../gp/analysis_WC.gp"
