set xlabel "Magnetfeld [T]"
set ylabel "normalisierte Absorption 1/Q" offset 1

plot "" every 3:::(fitstart)::(fitend) u ($40*0.0401):((1/($11+$17+$19/1e9*$13/1e9)-offset)/(A*cr(0)+Al*loc_cr(0))) not w p pt 12 ps 1.7, \
	(A*cr(x)+Al*loc_cr(x))/(A*cr(0)+Al*loc_cr(0)) ti "Fit freie + lok. e^-" w l lt -1 lw 3, \
	A*cr(x)/(A*cr(0)+Al*loc_cr(0)) ti "Anteil freier e^-" w l lt 2 lw 3, \
	Al*loc_cr(x)/(A*cr(0)+Al*loc_cr(0)) ti "Anteil lok. e^-" w l lt 4 lw 1
#	((Ao*cro(x)+(offseto-offset))/(A*cr(0)+Al*loc_cr(0))) ti "Fit freier e^-" w l lt 0 lw 2

