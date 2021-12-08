load "../gp/ssmallps.gp"

set output "modevgl_bulkt.eps"

FILENAME = "<bzcat ../data/mw0009d2.dat.bz2"

load "../gp/timedata.gp"

set key bottom left samplen 0.5 spacing 1.5

set ytics 1
set xtics 600
set yr [-5:0.2]

set format x "%M"

set xlabel "Zeit [min]"
set ylabel "Transmissionsänderung [dB]"
plot FILENAME every 4::75:8::8 u 1:(34.1+log($11+$17+$19/1e9*$13/1e9)/log(10)*20) ti "TM010" w p pt 7, \
	FILENAME every 4::75:8::8 u 1:(43.2+log($21+$27+$29/1e9*$23/1e9)/log(10)*20) ti "TM011" w p pt 6
	
