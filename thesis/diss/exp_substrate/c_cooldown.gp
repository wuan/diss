load "../gp/smidps.gp"

set output "c_cooldown.eps"

#set xdata time
#set timefmt "%d.%m.%y %H:%M:%S"

set key bottom right samplen 0.5 spacing 2

set ytics nomirror
set y2tics

#set log y
#set yr [4e2:1.1e5]

set log y2
set log x
#set y2r [1:10000]

set xr [1:100]
set xlabel "Zellenthermometer [{/Symbol W}]"
set ylabel "Transmission [dB]"
set y2label "Substratwiderstand [k{/Symbol W}]"
plot "<bzcat ../data/mw0012d1.dat.bz2" every ::2000:0:2150:0 u 4:(log($11+$17+$19/1e9*$13/1e9)/log(10)*20) ti "Transmission" w p 7, "" every ::2000:0:2150:0 u 4:($9/1e3) axes x1y2 ti "Substratwiderstand" w p 4

