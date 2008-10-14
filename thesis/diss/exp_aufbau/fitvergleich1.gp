load "../gp/smallps.gp"
set output "fitvergleich1.eps"

load "../gp/fitfunctions.gp"

FILENAME = "<bzcat ../data/Dmw1_0205d6.00001.bz2"

frqo=9.604731
wido=0.002919
ampo=0.1115
offo=0.018
lino=7e-6
fit lorentz(x)+offo+lino*x FILENAME u  ($1/1e9):2 via ampo,frqo,wido,offo,lino

amp=0.132425
frq=9.60474
wid=0.0034
off=1.438
lin=-0.149786
fit lorex(x)+off+lin*x FILENAME u  ($1/1e9):2 via amp,frq,wid,off,lin

set xr [9.6:9.61]
set xtics 0.002
set yr [0.17:1.05]
set ytics 0.2

set xlabel "Frequenz [GHz]"
set ylabel "normierte Transmission"

set key samplen 1 spacing 2

plot FILENAME every 4 u ($1/1e9):(($2-off-lin*$1/1e9)/amp) ti "Messdaten", \
	lorex(x)/amp ti "Fit" with line lt 1 lw 2
