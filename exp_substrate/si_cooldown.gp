load "../gp/smidps.gp"

set output "si_cooldown.eps"

set ytics nomirror
set y2tics

set log y2
set log x
set y2r [100:5e7]
set key top left samplen 0.5 width -4 spacing 1.5
set xr [1:100]
set xlabel "Zellenthermometer [{/Symbol W}]"
set ylabel "Transmission [dB]"
set y2label "Substratwiderstand [k{/Symbol W}]"
plot "<bzcat ../data/mw0204d4.dat.bz2" every 10:::98 u 4:(log($11+$17+$19/1e9*$13/1e9)/log(10)*20) ti "Transmission" w p pt 7,\
	"" every ::800:0::0 u 4:($9/1e3) axes x1y2 ti "Substratwiderstand" w p pt 4

