load "../gp/smallps.gp"
load "../gp/e_density.gp"
load "../gp/film_thickness.gp"
load "../gp/level_c.gp"
load "../gp/cell_temp.gp"

set output "Gue96_test.eps"

f1(x)=m1*x+t1
f2(x)=m2*x+t2
f3(x)=m3*x+t3
f4(x)=t4
t(x)=temp

set xlabel "Haltespannung [V]"
set ylabel "Absorption {/Symbol a} [10^{-4}]" 1,0
set ytics nomirror
set key bottom right
set bmargin 4

fit [0.2:0.8] f1(x) "Gue96_test.dat" via m1,t1
fit [1.1:1.4] f2(x) "" via m2,t2
fit [1.5:2] f3(x) "" via m3,t3
V1=(t2-t1)/(m1-m2)
V2=(t3-t2)/(m2-m3)
dV=V2-V1
set yr [0:1.2]

plot "" u 1:2 not w p 7, f1(x) not, f2(x) not, f3(x) not
