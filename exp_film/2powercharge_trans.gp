load "../gp/smallps.gp"
set output "2powercharge_trans.eps"

FILENAME = "<bzcat ../data/mw0211d3.dat.bz2 | smooth -n 5 -"
i=26


set key samplen 0.5 spacing 1.5
set pointsize 1.5

set xlabel "Haltespannung [V]"
set ylabel "Transmission [dB]"
set xtics 0.5
set ytics 0.2
set xr [-1:2]
#set yr [-21.2:-20.1]

plot FILENAME every 8::20:(i)::(i) u 10:(log($11+$17+$19/1e9*$13/1e9)/log(10)*20) ti "-30 dBm" w p pt 6, \
	 FILENAME every 8::20:(i)::(i) u 10:(log($21+$27+$29/1e9*$23/1e9)/log(10)*20)+0.09 ti "-10 dBm" w p pt 7
