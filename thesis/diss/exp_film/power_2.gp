load "../gp/midps.gp"
set output "power_2.eps"

FILENAME = "<bzcat ../data/mw0204d1.dat.bz2"

set key bottom samplen 0.5 spacing 2

t1=+0.0005
t2=-0.0001
t4=-0.0002
t5=+0.0005
t6=+0.0004

f1=+0.000002
f2=0.000002
f4=-0.000000
f5=+0.000003
f6=+0.000001

set xlabel "Ausgangsleistung [dBm]"
set ylabel "Transmission [dB]"
set y2label "Resonanzfrequenz [GHz]"
set xr [-45:-5]
set xtics 10
set ytics nomirror 0.2
set y2tics 0.00002
set yr [-17.4:-16.0]
set y2r [9.41698:9.41708]

i=26
plot FILENAME every 2:::(i)::(i) u 36:(log(($36>=-15 ? ($36>=-10?t1:t2) : ($36<-30?t6:($36<-25?t5:($36<-20?t4:0))))+$11+$17+$19/1e9*$13/1e9)/log(10)*20) ti "Transmission" w p ps 7, \
	 FILENAME every 2:::(i)::(i) u 36:(($36>=-15 ? ($36>=-10?f1:f2) : ($36<-30?f6:($36<-25?f5:($36<-20?f4:0))))+$13/1e9) axes x1y2 ti "Frequenz" w p ps 4
