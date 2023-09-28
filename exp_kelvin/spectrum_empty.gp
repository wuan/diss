load "../gp/smallps.gp"
set output "spectrum_empty.eps"

set xl "Frequenz [Hz]"
set yl "Sondenstrom [bel. Einh.]"
set yr [0:5]
set xr [1100:1200]
set key samplen 0.3 

plot "<bzcat ../data/ke0205d2.019.bz2" ti "2500 mV" w p pt 4, \
     "<bzcat ../data/ke0205d2.018.bz2" ti "1750 mV" w p pt 5, \
     "<bzcat ../data/ke0205d2.017.bz2" ti "1500 mV" w p pt 6, \
     "<bzcat ../data/ke0205d2.016.bz2" ti "1250 mV" w p pt 7, \
     "<bzcat ../data/ke0205d2.015.bz2" ti "1000 mV" w p pt 8, \
     "<bzcat ../data/ke0205d2.014.bz2" ti " 750 mV" w p pt 9, \
     "<bzcat ../data/ke0205d2.013.bz2" ti " 500 mV" w p pt 10, \
     "<bzcat ../data/ke0205d2.012.bz2" ti " 250 mV" w p pt 11
	 
	
