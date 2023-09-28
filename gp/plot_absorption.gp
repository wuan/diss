set xlabel "magnetic field [T]"
set ylabel "normalized absorption 1/Q"

plot FILENAME every :::(fitstart)::(fitend) u ($40*0.0401):((1/($11+$17+$19/1e9*$13/1e9)-offset)/(A*cr(0)+Al*loc_cr(0))) not w p pt 13 ps 2.5, \
	(A*cr(x)+Al*loc_cr(x))/(A*cr(0)+Al*loc_cr(0)) ti "free + loc. e^- fit" w l lt -1 lw 8, \
	A*cr(x)/(A*cr(0)+Al*loc_cr(0)) ti "free e^- part" w l lt 2 lw 4, \
	Al*loc_cr(x)/(A*cr(0)+Al*loc_cr(0)) ti "loc. e^- part" w l lt 4 lw 4, \
	((Ao*cro(x)+(offseto-offset))/(A*cr(0)+Al*loc_cr(0))) ti "free e^- fit" w l lt 0 lw 2


