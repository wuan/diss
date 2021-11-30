load "../gp/smallps.gp"
set output "bulk_cr_abs2.eps"

set pointsize 1.5

load "../gp/absorption_function.gp"
load "../gp/susceptibility_function.gp"

FILENAME = "<bzcat ../data/mw0210d2.dat.bz2"

A=100
offset=0.000001
t=9.6
w=0.3
set key right top samplen 0.5 spacing 1.5

f1=86; fitstart=f1; fitend=fitstart; load "../gp/crfit_free.gp"
A1=A; t1=t; w1=w; o1=offset; wt1=w*t; Af1=Af; wf1=wf; tf1=tf; wtf1=wf*tf; offsetf1=offsetf
f2=91; fitstart=f2; fitend=fitstart; load "../gp/crfit_free.gp"
A2=A; t2=t; w2=w; o2=offset; wt2=w*t; Af2=Af; wf2=wf; tf2=tf; wtf2=wf*tf; offsetf2=offsetf
f3=98; fitstart=f3; fitend=fitstart; load "../gp/crfit_free.gp"
A3=A; t3=t; w3=w; o3=offset; wt3=w*t; Af3=Af; wf3=wf; tf3=tf; wtf3=wf*tf; offsetf3=offsetf
f4=103; fitstart=f4; fitend=fitstart; load "../gp/crfit_free.gp"
A4=A; t4=t; w4=w; o4=offset; wt4=w*t; Af4=Af; wf4=wf; tf4=tf; wtf4=wf*tf; offsetf4=offsetf

set xr [0:0.85]
set xtics 0.2
set yr [0:18]
set ytics 2.5
set xlabel "Magnetfeld [T]"
set ylabel "normalisierte Absorption [bel. Einh.]"
plot crv(x,w1,t1)/crv(0,w1,t1) not w l ls 0, FILENAME every 2:::(f1)::(f1) u ($41*0.0401):((1/($11+$17+$19/1e9* $13/1e9)-o1)/A1/crv(0,w1,t1)) ti "U_{clamp}=80V" w p ps 1 pt 4, \
     crv(x,w2,t2)/crv(0,w2,t2) not w l ls 0, FILENAME every 2:::(f2)::(f2) u ($41*0.0401):((1/($11+$17+$19/1e9* $13/1e9)-o2)/A2/crv(0,w2,t2)) ti "U_{clamp}=60V" w p ps 2 pt 5, \
     crv(x,w3,t3)/crv(0,w3,t3) not w l ls 0, FILENAME every 2:::(f3)::(f3) u ($41*0.0401):((1/($11+$17+$19/1e9* $13/1e9)-o3)/A3/crv(0,w3,t3)) ti "U_{clamp}=40V" w p ps 3 pt 6, \
     crv(x,w4,t4)/crv(0,w4,t4) not w l ls 0, FILENAME every 2:::(f4)::(f4) u ($41*0.0401):((1/($11+$17+$19/1e9* $13/1e9)-o4)/A4/crv(0,w4,t4)) ti "U_{clamp}=20V" w p ps 4 pt 7

