load "../gp/smidps.gp"
set output "film_series.eps"

set xlabel "Haltespannung [V]"
set ylabel "Transmission [dB]"
set xr [-0.5:0.43]
set yr [-19.42:-18.86]
#set ytics 0.0001
set pointsize 1.3
FILENAME = "<bzcat ../data/mw0204d4.dat.bz2 | smooth -n 5 -"

plot	FILENAME every 4:::30::30 u 10:(log($11+$17+$19/1e9*$13/1e9)/log(10)*20) not w p ps 1, \
	FILENAME every 4:::34::34 u 10:(log($11+$17+$19/1e9*$13/1e9)/log(10)*20) not w p ps 1, \
	FILENAME every 4:::38::38 u 10:(log($11+$17+$19/1e9*$13/1e9)/log(10)*20) not w p ps 1, \
	FILENAME every 4:::41::41 u 10:(log($11+$17+$19/1e9*$13/1e9)/log(10)*20) not w p ps 1, \
	FILENAME every 4:::44::44 u 10:(log($11+$17+$19/1e9*$13/1e9)/log(10)*20) not w p ps 1, \
	FILENAME every 4:::47::47 u 10:(log($11+$17+$19/1e9*$13/1e9)/log(10)*20) not w p ps 1, \
	FILENAME every 4:::52::52 u 10:(log($11+$17+$19/1e9*$13/1e9)/log(10)*20) not w p ps 1, \
	FILENAME every 4:::55::55 u 10:(log($11+$17+$19/1e9*$13/1e9)/log(10)*20) not w p ps 6


