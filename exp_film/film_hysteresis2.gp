load "../gp/smallps.gp"
set output "film_hysteresis2.eps"

set key bottom samplen 0.5 spacing 1.5
set ytics 0.01
set yr [0.115:0.16]

FILENAME = "<bzcat ../data/mw0202d2.dat.bz2"
set xl "Zeit [min]"
set yl "lineare Transmission [bel. Einh.]"
plot FILENAME every 10:::20:1200:20 u ($0/0.6):($11+$17+$19/1e9*$13/1e9) ti "Beladung" w p pt 7, \
	 FILENAME every 10::10:18::18 u (($0+120)/.6):($11+$17+$19/1e9*$13/1e9) ti "Entladung" w p pt 6

