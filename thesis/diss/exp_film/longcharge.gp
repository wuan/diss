load "../gp/midps.gp"
set output "longcharge.eps"

f1(x)=m1*x+t1
f2(x)=m2*x+t2

f(x)=(x-350)**2/(350**2)*0.28-17.3
set timefmt "%d.%m.%y %H:%M:%S"
FILENAME = "<bzcat ../data/mw0205d6.dat.bz2"
set ylabel "Transmission [dB]"
set y2label "Haltespannung [V]"
set xlabel "Zeit [min]"
set ytics nomirror
set y2tics
set y2r [-1.5:0]

i=2
fit [50:55] f1(x) FILENAME every :::(i)::(i) u ($0/6):(log($11+$17+$19/1e9*$13/1e9)/log(10)*20) via m1,t1
fit [60:300] f2(x) FILENAME every :::(i)::(i) u ($0/6):(log($11+$17+$19/1e9*$13/1e9)/log(10)*20) via m2,t2
set yr [-18.4:-16.8]
#set title `printf '"mw0205d6 (%d) long charging: m_1=%.3g dB/min m_2=%.3g dB/min"' $i $m1 $m2`
plot FILENAME every 10:::(i)::(i) u ($0*10/6):(log($11+$17+$19/1e9*$13/1e9)/log(10)*20) ti "Transmission" w p pt 6, \
	 FILENAME every 2:::(i)::(i) u ($0*2/6):10 axes x1y2 ti "Haltespannung" w l lt 1 lw 4, \
	 f1(x) not, f2(x) not, f(x) ti "Relaxation der Transmission" w l lt 2 lw 3
#plot [45:65] FILENAME every :::(i)::(i) u ($0/6):(log($11+$17+$19/1e9*$13/1e9)/log(10)*20) not, f1(x) ti "l1", f2(x) ti "l2"

