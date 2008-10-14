load "../gp/smallps.gp"

set output "filui.eps"

set yl "Filamentspannung [V]"
set y2l "Filamentstrom [mA]"
set xl "Zeit [ms]"

set yr [0:1.5]
set y2r [0:*]
set ytics nomirror 0.25
set y2tics 25
set xtics 2

set key bottom right samplen 0.5 spacing 2

plot "<bzcat ../data/Dfilu0201d4.00100.bz2" \
	every 35 u ($1*1e3):2 ti "Filamentspannung" w p 7, \
	"bzcat ../data/Dfili0201d4.00100.bz2" \
	every 35 u ($1*1e3):($2*100) axes x1y2 ti "Filamentstrom" w p 4
