load "../gp/smallps.gp"
set output "2powercharge_freq.eps"

FILENAME = "<bzcat ../data/mw0211d3.dat.bz2 |smooth -n 5 -"

set pointsize 1.5

i=26
set xlabel "Haltespannung [V]"
set ylabel "Resonanzfrequenz [GHz]"

set xr [-1:2]
set yr [9.20797:9.20804]
set xtics 0.5
set ytics 0.00002
set key bottom left samplen 0.5 spacing 1.5
plot FILENAME every 8::20:(i)::(i) u 10:($13/1e9)+0.000002 ti "-30 dBm" w p pt 4, \
	 FILENAME every 8::20:(i)::(i) u 10:($23/1e9) ti "-10 dBm" w p pt 5
