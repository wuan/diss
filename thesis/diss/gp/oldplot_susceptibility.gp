set xlabel "magnetic field [T]"
set ylabel "susceptibility"
plot [0:*][*:*] "" every ::(upstart)::(upend) u 3:(1/($5/1e9)**2-offsetf) ti "data" w p 1 9, \
	"" every ::(downstart)::(downend) u 3:(1/($5/1e9)**2-offsetf) ti "data" w p 4 10, \
	Af*chi(x) ti "free e^- fit"
