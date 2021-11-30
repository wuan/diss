load "../gp/smidps.gp"
set output "bulk_charge.eps"

FILENAME = "<bzcat ../data/mw0202d3.dat.bz2"

set xlabel "Haltespannung [V]"
set ylabel "Transmission [dB]"

set key bottom left width -5 samplen 0.5 spacing 2

set xr [-2:*]
plot FILENAME every :::13::13 u 10:(log($11+$17+$19/1e9*$13/1e9)/log(10)*20) ti "kontinuierlich 38V" w p ps 7, \
	 FILENAME every :::21::21 u 10:(log($11+$17+$19/1e9*$13/1e9)/log(10)*20) ti "7V"  w p ps 4, \
	 FILENAME every :::17::17 u 10:(log($11+$17+$19/1e9*$13/1e9)/log(10)*20) ti "14V" w p ps 6, \
     FILENAME every :::27::27 u 10:(log($11+$17+$19/1e9*$13/1e9)/log(10)*20) ti "21V" w p ps 8, \
     FILENAME every :::24::24 u 10:(log($11+$17+$19/1e9*$13/1e9)/log(10)*20) ti "28V" w p ps 10, \
     FILENAME every :::30::30 u 10:(log($11+$17+$19/1e9*$13/1e9)/log(10)*20) ti "34V" w p ps 12
	
