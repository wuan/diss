set xlabel "magnetic field [T]"
set ylabel "susceptibility"
plot [0:*][*:*] "" every :::(fitstart)::(fitend) u ($40*0.0401):(1/($13/1e9)**2-offsetf) ti "data" w p 1 9, \
	Af*chi(x) ti "free e^- fit"
