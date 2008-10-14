load "../gp/midps.gp"
set output "bulk_cr.eps"

FILENAME = "<bzcat ../data/mw0202d3.dat.bz2"

set xlabel "Haltespannung [V]"
set xlabel "Magnetfeld [T]"
set xr [0:0.85]
set key bottom
plot FILENAME every :::14::14 u ($40*0.0401):(log($11+$17+$19/1e9*$13/1e9)/log(10)*20) ti "38V" w p 7, \
	 FILENAME every :::22::22 u ($40*0.0401):(log($11+$17+$19/1e9*$13/1e9)/log(10)*20) ti "7V"  w p 4, \
	 FILENAME every :::19::19 u ($40*0.0401):(log($11+$17+$19/1e9*$13/1e9)/log(10)*20) ti "14V" w p 6, \
	 FILENAME every :::28::28 u ($40*0.0401):(log($11+$17+$19/1e9*$13/1e9)/log(10)*20) ti "21V" w p 8, \
     FILENAME every :::25::25 u ($40*0.0401):(log($11+$17+$19/1e9*$13/1e9)/log(10)*20) ti "28V" w p 10, \
     FILENAME every :::31::31 u ($40*0.0401):(log($11+$17+$19/1e9*$13/1e9)/log(10)*20) ti "34V" w p 12
