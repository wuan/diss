load "../gp/smallps.gp"
set output "bulk_cr_frq1.eps"

set pointsize 1.5

load "../gp/absorption_function.gp"
load "../gp/susceptibility_function.gp"

FILENAME = "<bzcat ../data/mw0210d1.dat.bz2"

A=100
offset=0.000001
t=9.6
w=0.3
set key right top samplen 0.5

f1=8; fitstart=f1; fitend=fitstart; load "../gp/crfit_free.gp"
A1=A; t1=t; w1=w; o1=offset; wt1=w*t; Af1=Af; wf1=wf; tf1=tf; wtf1=wf*tf; offsetf1=offsetf
f2=14; fitstart=f2; fitend=fitstart; load "../gp/crfit_free.gp"
A2=A; t2=t; w2=w; o2=offset; wt2=w*t; Af2=Af; wf2=wf; tf2=tf; wtf2=wf*tf; offsetf2=offsetf
f3=20; fitstart=f3; fitend=fitstart; load "../gp/crfit_free.gp"
A3=A; t3=t; w3=w; o3=offset; wt3=w*t; Af3=Af; wf3=wf; tf3=tf; wtf3=wf*tf; offsetf3=offsetf
f4=27; fitstart=f4; fitend=fitstart; load "../gp/crfit_free.gp"
A4=A; t4=t; w4=w; o4=offset; wt4=w*t; Af4=Af; wf4=wf; tf4=tf; wtf4=wf*tf; offsetf4=offsetf
f5=34; fitstart=f5; fitend=fitstart; load "../gp/crfit_free.gp"
A5=A; t5=t; w5=w; o5=offset; wt5=w*t; Af5=Af; wf5=wf; tf5=tf; wtf5=wf*tf; offsetf5=offsetf
f6=39; fitstart=f6; fitend=fitstart; load "../gp/crfit_free.gp"
A6=A; t6=t; w6=w; o6=offset; wt6=w*t; Af6=Af; wf6=wf; tf6=tf; wtf6=wf*tf; offsetf6=offsetf
f7=44; fitstart=f7; fitend=fitstart; load "../gp/crfit_free.gp"
A7=A; t7=t; w7=w; o7=offset; wt7=w*t; Af7=Af; wf7=wf; tf7=tf; wtf7=wf*tf; offsetf7=offsetf

set xr [0:0.85]
set xtics 0.2
set yr [9.139:9.147]
set ytics 0.002

set xlabel "Magnetfeld [T]"
set ylabel "Frequenz [GHz]"
set key right top
plot "<bzcat ../data/mw0210d1.dat.bz2 |smooth -n 5 -" every 3:::(f1)::(f1) u ($41*0.0401):($13/1e9) ti "U_{clamp}=380V" w p pt 4, \
    "" every 2:::(f2)::(f2) u ($41*0.0401):($13/1e9) ti "U_{clamp}=350V" w p pt 5, \
    "" every 2:::(f3)::(f3) u ($41*0.0401):($13/1e9) ti "U_{clamp}=300V" w p pt 6, \
    "" every 2:::(f4)::(f4) u ($41*0.0401):($13/1e9) ti "U_{clamp}=250V" w p pt 7, \
    "" every 2:::(f5)::(f5) u ($41*0.0401):($13/1e9) ti "U_{clamp}=200V" w p pt 8, \
    "" every 2:::(f6)::(f6) u ($41*0.0401):($13/1e9) ti "U_{clamp}=150V" w p pt 9, \
    "" every 2:::(f7)::(f7) u ($41*0.0401):($13/1e9) ti "U_{clamp}=100V" w p pt 12

