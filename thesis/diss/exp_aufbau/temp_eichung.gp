load "../gp/midps.gp"
set output "temp_eichung.eps"

load "../gp/pressure.gp"
load "../gp/he4_svp.gp"

FILENAME = "<bzcat ../data/mw0002d3.dat.bz2"

f(x)=m*x+t
euler=2.718281828

fit [9.5:12] f(x) FILENAME every ::70::1500 u \
	(log($4)):(log(temp(($5>0.3?pressure($5):baratron($6))*100))) via m,t

plot FILENAME every ::70::1500 u \
   4:(temp(($5>0.3?pressure($5):baratron($6))*100)), euler**f(log(x))	
