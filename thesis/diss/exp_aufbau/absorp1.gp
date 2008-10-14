load "../gp/smallps.gp"
load "../gp/timedata.gp"

set output "absorp1.eps"

P0=0.158
Q0=1309
i=20
start=300
end=1200

set ylabel "Absorption 10^{-4}"
set yr [0:3]
set xtics ("09.02.02 22:00:00", "09.02.02 23:00:00", "10.02.02 00:00:00")
set format x "%H:%M"
set key bottom right samplen 1
set multiplot
set origin 0,0.03
plot "<bzcat ../data/mw0202d2.dat.bz2" every ::(start):(i):(end):(i) u 1:(($15/$13)-1.0/Q0)*1e4 ti "aus Güte" w l 2, \
	"" every ::(start):(i):(end):(i) u 1:(((P0/($11+$17+$19/1e9*$13/1e9))-1.0)/Q0)*1e4 ti "aus Transmission" with lines lt 1 lw 2
set origin 0.40,0.22
set size 0.55,0.5

set ylabel ""
#set ytics 0.25
set yr [0.8:1.5]
set pointsize 1
set ytics 0.2
set noxtics
set key bottom right samplen -5
plot "" every ::(start):(i):(end):(i) u 1:(($15/$13)-1.0/Q0)/(((P0/($11+$17+$19/1e9*$13/1e9))-1.0)/Q0) ti "Quotient", 1 not
