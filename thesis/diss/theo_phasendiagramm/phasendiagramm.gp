load "../gp/smidps.gp"
load "../gp/e_density.gp"
h=0.005
# Substrat 1
ds=200e-9
es=5
dC3=26
# Substrat 2
ds2=100e-9
es2=1.7
dC32=26

set log x
set log y
set ylabel "Elektronendichte / [1/m^2]"
set xlabel "Temperatur / [K]"
set key left width -2
set output "phasendiagramm.eps"
set parametric
set tr [0.0001:1]
set xr [0.8:2]
set yr [1e13:1e15]
set xtics (0.8,1.0,1.2,1.4,1.6,1.8,2.0)
#set ytics ("10^{13}" 1e13, "10^{14}" 1e14, "10^{15}" 1e15)
set mxtics 10
plot	Tct(n10(h,t,ds,es,dC3),d10(h,t,ds,es,dC3),es,131),n10(h,t,ds,es,dC3) ti "Bulk-He" w l lt 1 lw 2, \
	TsctSaitoh(n10(h,t,ds,es,dC3),d10(h,t,ds,es,dC3),es,131),n10(h,t,ds,es,dC3) ti "SiO_2" w l lt 2 lw 1, \
	Tsct(n10(h,t,ds,es,dC3),d10(h,t,ds,es,dC3),es,131),n10(h,t,ds,es,dC3) ti "SiO_2" w l lt 2 lw 4, \
	TsctSaitoh(n10(h,t,ds2,es2,dC32),d10(h,t,ds2,es2,dC3),es2,131),n10(h,t,ds2,es2,dC32) ti "PMMA" w l lt 5 lw 1, \
	Tsct(n10(h,t,ds2,es2,dC32),d10(h,t,ds2,es2,dC3),es2,131),n10(h,t,ds2,es2,dC32) ti "PMMA" w l lt 5 lw 4, \
	2*t,2.4e13 not w l lt 0
