load "../gp/smallps.gp"
set output "film_hysteresis.eps"

set key top left samplen 0.5 spacing 1.5

FILENAME = "<bzcat ../data/mw0202d2.dat.bz2"
set xl "Haltespannung [V]"
set yl "lineare Transmission [bel. Einh.]"
set xr [-15:*]
set ytics 0.01
set yr [0.115:0.16]

plot FILENAME every 15:::20:1200:20 u 10:($11+$17+$19/1e9*$13/1e9) ti "Beladung" w p pt 7, \
	 FILENAME every 2::10:18:27:18 u 10:($11+$17+$19/1e9*$13/1e9) ti "Entladung" w p pt 6, \
	 FILENAME every 4::28:18::18 u 10:($11+$17+$19/1e9*$13/1e9) not w p pt 6

