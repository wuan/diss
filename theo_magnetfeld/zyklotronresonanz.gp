load "../gp/midcolorps.gp"
load "../gp/absorption_function.gp"

set output "zyklotronresonanz.eps"

# startvalues for fitparameters
A=10
offset=0.000001
t=8.5
w=0.4

FILENAME = "<bzcat ../data/mw0109d5.dat.bz2"

fit A*cr(x)+offset FILENAME \
    every :::9::9 u ($40*0.0401):(1/($11+$17+$19/1e9*$13/1e9)) \
	via A, w ,t, offset 

fit A*cr(x)+Al*loc_cr(x)+offset FILENAME \
    every :::9::9 u ($40*0.0401):(1/($11+$17+$19/1e9*$13/1e9)) \
    via A, Al, w ,t, offset
				
set xlabel "Magnetfeld / [T]"
set ylabel "normalized Absorption 1/Q"
				
set parametric
set tr [0:0.8]
set xr [0:0.8]
tau=abs(t)
load "../gp/electron_partition.gp"

plot FILENAME every :::9::9 u ($40*0.0401):((1/($11+$17+$19/1e9*$13/1e9)-offset)/(A*cr(0)+Al*loc_cr(0))) ti "data" w p pt 1 ps 9, \
    t,(A*cr(t)+Al*loc_cr(t))/(A*cr(0)+Al*loc_cr(0)) ti "freie + lok. e^-" w l lt 1 lw 2, \
    t,A*cr(t)/(A*cr(0)+Al*loc_cr(0)) ti "Anteil freier e^-" w l lt 2, \
    t,Al*loc_cr(t)/(A*cr(0)+Al*loc_cr(0)) ti "Anteil lok. e^-" w l lt 3, \
	B(qemax(w(w),B(tau))),t/0.75*A*cr(qemax(w,tau))/(A*cr(0)+Al*loc_cr(0)) not w l lt 2,\
	B(qmax(w(w),B(tau),ne)),t/0.75*(A*cr(qmax(w,tau,ne))+Al*loc_cr(qmax(w,tau,ne)))/(A*cr(0)+Al*loc_cr(0)) not w l lt 7, \
	w,t/0.75*(A*cr(qmax(w,tau,ne))+Al*loc_cr(qmax(w,tau,ne)))/(A*cr(0)+Al*loc_cr(0)) ti "{/Symbol w}" w l lt 0
