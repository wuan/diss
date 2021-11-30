load "../gp/smidps.gp"
set output "film_quantum_reproduce.eps"

FILENAME = "<bzcat ../data/mw0202d2.dat.bz2"
	
set xlabel "Haltespannung [V]"
set ylabel "Transmission [dB]"

set key samplen 0.5
set ytics nomirror
set xr [-0.5:1.2]
set yr [-16.6:-15.55]
plot FILENAME every 9:::4:860:4 u 10:(log($11+$17+$19/1e9*$13/1e9)/log(10)*20) ti "Abschnitt 4: erste Beladung" w p ps 6, \
	 FILENAME every 9:::7:600:7 u 10:(log($11+$17+$19/1e9*$13/1e9)/log(10)*20) ti "Messung von Abbildung 5.18" w p ps 7, \
	 FILENAME every 9:::11:400:11 u 10:(log($11+$17+$19/1e9*$13/1e9)/log(10)*20) ti "Abschnitt 11: nach Heliumtransfer" w p ps 10, \
	 FILENAME every 5:::20:400:20 u 10:(log($11+$17+$19/1e9*$13/1e9)/log(10)*20) ti "Messung von Abbildung 5.19" w p ps 11
