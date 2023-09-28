f1(x)=m1*x+t1
f2(x)=m2*x+t2

fit [s1:e1] f1(x) "" every :::(i)::(i) u 10:11 via m1,t1
fit [s2:e2] f2(x) "" every :::(i)::(i) u 10:11 via m2,t2

V1=(t2-t1)/(m1-m2)
	
set title `printf '"section %d U_{0}=%.3fV"' $i $V1`

plot "" every :::(i)::(i) u 10:11 ti "data", \
	    f1(x) not w l 1, \
	    f2(x) not w l 2
