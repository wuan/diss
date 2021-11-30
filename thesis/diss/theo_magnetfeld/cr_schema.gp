load "../gp/absorption_function.gp"
load "../gp/susceptibility_function.gp"
load "../gp/film_thickness.gp"

load "../gp/smidps.gp"
set pointsize 2

set output "cr_schema.eps"

set key samplen 2 spacing 2

fitstart=61
fitend=61
A=4.62013
Al=2.06474
w=0.370492
t=7.20243
offset=6.81855

set xlabel "Magnetfeld"
set ylabel "Absorption 1/Q"
set noxtics
set noytics

set xr [0:1]
set yr [0:3.25]

wo=w*0.7
to=t
Ao=A

wp=w*0.5
tp=t
Ap=A

wq=w*0.3
tq=t
Aq=A

wr=w*0.1
tr=t
Ar=A

plot (A*cr(x)+Al*loc_cr(x))/(Al*loc_cr(0)) ti "freie + lok. e^-: Q_e^{-1} + Q_l^{-1}" w l lt -1 lw 5, \
	A*cr(x)/(Al*loc_cr(0)) ti "Anteil freier e^-: Q_e^{-1}" w l lt 2 lw 5, \
	Al*loc_cr(x)/(Al*loc_cr(0)) ti "Anteil lok. e^-: Q_l^{-1}" w l lt 4 lw 5, \
	1.2*cro(x)/(Al*loc_cr(0)) ti "Einzelne lok. e^-, div. {/Symbol w}_0" w l lt 0, \
	1.2*crp(x)/(Al*loc_cr(0)) not w l lt 0, \
	1.15*crq(x)/(Al*loc_cr(0)) not w l lt 0, \
	0.9*crr(x)/(Al*loc_cr(0)) not w l lt 0


