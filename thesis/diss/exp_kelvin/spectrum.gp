load "../gp/smallps.gp"
set output "spectrum.eps"

set xl "Frequenz [Hz]"
set yl "Sondenstrom [bel. Einh.]"
set yr [0:50]
set xr [1100:1200]
set ytics 10
set key width -2 sample 0.2

plot "<bzcat ../data/ke0205d2.004.bz2" ti "2500 mV" w p 4, \
	 "<bzcat ../data/ke0205d2.009.bz2" ti "1750 mV" w p 5, \
	 "<bzcat ../data/ke0205d2.005.bz2" ti "1500 mV" w p 6, \
	 "<bzcat ../data/ke0205d2.008.bz2" ti "1250 mV" w p 7, \
	 "<bzcat ../data/ke0205d2.003.bz2" ti "1000 mV" w p 8, \
	 "<bzcat ../data/ke0205d2.006.bz2" ti " 750 mV" w p 9, \
	 "<bzcat ../data/ke0205d2.007.bz2" ti " 500 mV" w p 10, \
	 "<bzcat ../data/ke0205d2.010.bz2" ti " 250 mV" w p 11
	 
	
