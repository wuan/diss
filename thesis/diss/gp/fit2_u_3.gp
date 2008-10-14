f1(x)=m1*x+t1
f2(x)=m2*x+t2
f3(x)=m3*x+t3
m1=0

fit [s1:e1] f1(x) "" every :::(i)::(i) u 10:($11+$17+$19/1e9*$13/1e9) via t1
fit [s2:e2] f2(x) "" every :::(i)::(i) u 10:($11+$17+$19/1e9*$13/1e9) via m2,t2
fit [s3:e3] f3(x) "" every :::(i)::(i) u 10:($11+$17+$19/1e9*$13/1e9) via m3,t3

V1=(t2-t1)/(m1-m2)
V2=(t3-t2)/(m2-m3)
dV=V2-V1

set title `printf '"section %d U_{0}=%.3fV, U_{wc}=%.3fV, {/Symbol D}U=%.3fV"' $i $V1 $V2 $dV`	

set xlabel "clamping voltage [V]"
set ylabel "linear transmission [arb. u.]"

plot "" every :::(i)::(i) u ($10):($11+$17+$19/1e9*$13/1e9) ti "data", \
	    f1(x) not w l 1, \
	    f2(x) not w l 2, \
		f3(x) not w l 3

m1=0.1
