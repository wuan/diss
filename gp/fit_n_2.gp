f1(x)=m1*x+t1
f2(x)=m2*x+t2

fit [n10(h,s1,ds,dv)/1e14:n10(h,e1,ds,dv)/1e14] f1(x) "" every :::(i)::(i) u (n10(h,$10,ds,dv)/1e14):($11+$17+$19/1e9*$13/1e9) via m1,t1
fit [n10(h,s2,ds,dv)/1e14:n10(h,e2,ds,dv)/1e14] f2(x) "" every :::(i)::(i) u (n10(h,$10,ds,dv)/1e14):($11+$17+$19/1e9*$13/1e9) via m2,t2

n1=(t2-t1)/(m1-m2)

set title `printf '"section %d"' $i`

set xlabel "electron density [10^{14} m^{-2}]"
set ylabel "linear transmission [arb. u.]"

plot "" every :::(i)::(i) u (n10(h,$10,ds,dv)/1e14-n1):($11+$17+$19/1e9*$13/1e9) ti "data", \
	    f1(x+n1) not w l 1, \
	    f2(x+n1) not w l 2
