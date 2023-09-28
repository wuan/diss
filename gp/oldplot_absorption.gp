set xlabel "magnetic field [T]"
set ylabel "normalized absorption 1/Q"

plot "" every ::(upstart)::(upend) u 3:(((sqrt(Power_diode(Su)/Power_diode($1))-1.0)/Qu-offset)/(A*cr(0)+Al*loc_cr(0))) not w p pt 8 ps 1, \
	"" every ::(downstart)::(downend) u 3:(((sqrt(Power_diode(Su)/Power_diode($1))-1.0)/Qu-offset)/(A*cr(0)+Al*loc_cr(0))) not w p pt 10 ps 1, \
	(A*cr(x)+Al*loc_cr(x))/(A*cr(0)+Al*loc_cr(0)) ti "free + loc. e^-" w l lt -1 lw 3, \
	A*cr(x)/(A*cr(0)+Al*loc_cr(0)) ti "free e^- part" w l lt 2 lw 3, \
	Al*loc_cr(x)/(A*cr(0)+Al*loc_cr(0)) ti "loc. e^- part" w l lt 4 lw 1 

