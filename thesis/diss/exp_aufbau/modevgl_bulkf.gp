load "../gp/ssmallps.gp"

set output "modevgl_bulkf.eps"

FILENAME = "<bzcat ../data/mw0009d2.dat.bz2"

load "../gp/timedata.gp"

set key top left samplen 0.5 spacing 2
set ytics 0.5
set xtics 600
#set yr [-0.2:4]

set format x "%M"

set xlabel "Zeit [min]"
set ylabel "Frequenzänderung [MHz]"
plot FILENAME every 4::75:8::8 u 1:($13/1e6-9584.70) ti "TM010" w p pt 5, \
	FILENAME every 4::75:8::8 u 1:($23/1e6-11929.2) ti "TM011" w p pt 4
	
