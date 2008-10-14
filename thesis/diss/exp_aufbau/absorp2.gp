load "../gp/smallps.gp"
load "../gp/timedata.gp"

set output "absorp2.eps"

P0=0.1127
Q0=2665
i=84
start=150
end=500

set ylabel "Absorption 10^{-4}"
set yr [0:0.21]
set xtics ("01.05.02 12:40:00", "01.05.02 13:00:00", "01.05.02 13:20:00")
set key bottom right samplen 1
set origin 0,0.03
plot "<bzcat ../data/mw0204d4.dat.bz2" every ::(start):(i):(end):(i) u 1:(($15/$13)-1.0/Q0)*1e4 ti "aus Güte" w l 2, \
	"" every ::(start):(i):(end):(i) u 1:(((P0/($11+$17+$19/1e9*$13/1e9)))-1)/Q0*1e4 ti "aus Transmission" w l lt 1 lw 2
