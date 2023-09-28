f1(x)=m1*x+t1
f2(x)=m2*x+t2
f3(x)=m3*x+t3

fit [n10(h,s1,ds,dv)/1e14:n10(h,e1,ds,dv)/1e14] f1(x) "" every :::(i)::(i) u (n10(h,$10,ds,dv)/1e14):($11+$17+$19/1e9*$13/1e9) via m1,t1
fit [n10(h,s2,ds,dv)/1e14:n10(h,e2,ds,dv)/1e14] f2(x) "" every :::(i)::(i) u (n10(h,$10,ds,dv)/1e14):($11+$17+$19/1e9*$13/1e9) via m2,t2
fit [n10(h,s3,ds,dv)/1e14:n10(h,e3,ds,dv)/1e14] f3(x) "" every :::(i)::(i) u (n10(h,$10,ds,dv)/1e14):($11+$17+$19/1e9*$13/1e9) via m3,t3

n1=(t2-t1)/(m1-m2)
n2=(t3-t2)/(m2-m3)
dn=n2-n1
density=1e14*dn

set title `printf '"section %d  n_{wc}=%.3g m^{-2}"' $i $density`

set xlabel "electron density [10^{14} m^{-2}]"
set ylabel "linear transmission [arb. u.]"

plot "" every :::(i)::(i) u (n10(h,$10,ds,dv)/1e14-n1):($11+$17+$19/1e9*$13/1e9) ti "data", \
	    f1(x+n1) not w l 1, \
	    f2(x+n1) not w l 2, \
		f3(x+n1) not w l 3
