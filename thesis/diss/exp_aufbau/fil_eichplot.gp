load "../gp/midps.gp"
set output "fil_eichplot.eps"

FILENAME = "<bzcat ../data/mw0210d1.dat.bz2"
set pointsize 0.8

set lmargin 0
set rmargin 0
set tmargin 0
set bmargin 0
f(x)=m*x+t
f2(x)=m/t*x+1
set xr [0:150]
set yr [0.83:1.02]

set style line 1 lt 1 lw 4

set noxtics
set noytics

set multiplot

n=5
space=0.01
div=4
size=(1-(div-1)*space)/div
set size size,size
###:
i=66
fit [0:150][*:*] f(x) FILENAME every :::(i)::(i) u 0:($11+$17+$19/1e9*$13/1e9) via m,t
m11=m;t11=t
set origin 0*(space+size),3*(space+size)
plot FILENAME every (n):::(i)::(i) u (n*$0):(($11+$17+$19/1e9*$13/1e9)/t) not w p pt 6, f2(x) not w l ls 1

i=67
fit [0:150][*:*] f(x) FILENAME every :::(i)::(i) u 0:($11+$17+$19/1e9*$13/1e9) via m,t
m12=m;t12=t
set origin 0*(space+size),2*(space+size)
plot FILENAME every (n):::(i)::(i) u (n*$0):(($11+$17+$19/1e9*$13/1e9)/t) not w p pt 6, f2(x) not w l ls 1

i=68
fit [0:150][*:*] f(x) FILENAME every :::(i)::(i) u 0:($11+$17+$19/1e9*$13/1e9) via m,t
m13=m;t13=t
set origin 0*(space+size),1*(space+size)
plot FILENAME every (n):::(i)::(i) u (n*$0):(($11+$17+$19/1e9*$13/1e9)/t) not w p pt 6, f2(x) not w l ls 1

i=70
fit [0:150][*:*] f(x) FILENAME every :::(i)::(i) u 0:($11+$17+$19/1e9*$13/1e9) via m,t
m14=m;t14=t
set origin 0*(space+size),0*(space+size)
plot FILENAME every (n):::(i)::(i) u (n*$0):(($11+$17+$19/1e9*$13/1e9)/t) not w p pt 6, f2(x) not w l ls 1

###
i=71
fit [0:60][*:*] f(x) FILENAME every :::(i)::(i) u 0:($11+$17+$19/1e9*$13/1e9) via m,t
m21=m;t21=t
set origin 1*(space+size),3*(space+size)
plot FILENAME every (n):::(i)::(i) u (n*$0):(($11+$17+$19/1e9*$13/1e9)/t) not w p pt 6, f2(x) not w l ls 1

i=72
fit [0:60][*:*] f(x) FILENAME every :::(i)::(i) u 0:($11+$17+$19/1e9*$13/1e9) via m,t
m22=m;t22=t
set origin 1*(space+size),2*(space+size)
plot FILENAME every (n):::(i)::(i) u (n*$0):(($11+$17+$19/1e9*$13/1e9)/t) not w p pt 6, f2(x) not w l ls 1

i=73
fit [0:60][*:*] f(x) FILENAME every :::(i)::(i) u 0:($11+$17+$19/1e9*$13/1e9) via m,t
m23=m;t23=t
set origin 1*(space+size),1*(space+size)
plot FILENAME every (n):::(i)::(i) u (n*$0):(($11+$17+$19/1e9*$13/1e9)/t) not w p pt 6, f2(x) not w l ls 1

i=75
fit [0:10][*:*] f(x) FILENAME every :::(i)::(i) u 0:($11+$17+$19/1e9*$13/1e9) via m,t
m24=m;t24=t
set origin 1*(space+size),0*(space+size)
plot FILENAME every :::(i):20:(i) u 0:(($11+$17+$19/1e9*$13/1e9)/t) not w p pt 6, \
	FILENAME every (n):::(i)::(i) u (n*$0):(($11+$17+$19/1e9*$13/1e9)/t) not w p pt 6, f2(x) not w l ls 1

###
i=76
fit [0:20][*:*] f(x) FILENAME every :::(i)::(i) u 0:($11+$17+$19/1e9*$13/1e9) via m,t
m31=m;t31=t
set origin 2*(space+size),3*(space+size)
plot FILENAME every (n):::(i)::(i) u (n*$0):(($11+$17+$19/1e9*$13/1e9)/t) not w p pt 6, f2(x) not w l ls 1

i=77
fit [0:20][*:*] f(x) FILENAME every :::(i)::(i) u 0:($11+$17+$19/1e9*$13/1e9) via m,t
m32=m;t32=t
set origin 2*(space+size),2*(space+size)
plot FILENAME every (n):::(i)::(i) u (n*$0):(($11+$17+$19/1e9*$13/1e9)/t) not w p pt 6, f2(x) not w l ls 1

i=78
fit [0:10][*:*] f(x) FILENAME every :::(i)::(i) u 0:($11+$17+$19/1e9*$13/1e9) via m,t
m33=m;t33=t
set origin 2*(space+size),1*(space+size)
plot FILENAME every (n):::(i)::(i) u (n*$0):(($11+$17+$19/1e9*$13/1e9)/t) not w p pt 6, f2(x) not w l ls 1

i=80
fit [0:2][*:*] f(x) FILENAME every :::(i)::(i) u ($0-1):($11+$17+$19/1e9*$13/1e9) via m,t
m34=m;t34=t
set origin 2*(space+size),0*(space+size)
plot FILENAME every :::(i):5:(i) u ($0-1):(($11+$17+$19/1e9*$13/1e9)/t) not w p pt 6, \
	FILENAME every (n):::(i)::(i) u (n*$0-1):(($11+$17+$19/1e9*$13/1e9)/t) not w p pt 6, f2(x) not w l ls 1

###
i=81
fit [0:6][*:*] f(x) FILENAME every :::(i)::(i) u 0:($11+$17+$19/1e9*$13/1e9) via m,t
m41=m;t41=t
set origin 3*(space+size),3*(space+size)
plot FILENAME every :::(i):20:(i) u 0:(($11+$17+$19/1e9*$13/1e9)/t) not w p pt 6, \
	FILENAME every (n):::(i)::(i) u (n*$0):(($11+$17+$19/1e9*$13/1e9)/t) not w p pt 6, f2(x) not w l ls 1

i=82
fit [0:3][*:*] f(x) FILENAME every :::(i)::(i) u 0:($11+$17+$19/1e9*$13/1e9) via m,t
m42=m;t42=t
set origin 3*(space+size),2*(space+size)
plot FILENAME every :::(i):10:(i) u 0:(($11+$17+$19/1e9*$13/1e9)/t) not w p pt 6, \
	FILENAME every (n):::(i)::(i) u (n*$0):(($11+$17+$19/1e9*$13/1e9)/t) not w p pt 6, f2(x) not w l ls 1

i=83
fit [0:2][*:*] f(x) FILENAME every :::(i)::(i) u 0:($11+$17+$19/1e9*$13/1e9) via m,t
m43=m;t43=t
set origin 3*(space+size),1*(space+size)
plot FILENAME every :::(i):10:(i) u 0:(($11+$17+$19/1e9*$13/1e9)/t) not w p pt 6, \
	FILENAME every (n):::(i)::(i) u (n*$0):(($11+$17+$19/1e9*$13/1e9)/t) not w p pt 6, f2(x) not w l ls 1

i=85
fit [0:1][*:*] f(x) FILENAME every :::(i)::(i) u 0:($11+$17+$19/1e9*$13/1e9) via m,t
m44=m;t44=t
set origin 3*(space+size),0*(space+size)
plot FILENAME every :::(i):4:(i) u 0:(($11+$17+$19/1e9*$13/1e9)/t) not w p pt 6, \
	FILENAME every (n):::(i)::(i) u (n*$0):(($11+$17+$19/1e9*$13/1e9)/t) not w p pt 6, f2(x) not w l ls 1
set nomultiplot

print "0.6 10 ",m11,t11
print "0.8 10 ",m12,t12
print "1.0 10 ",m13,t13
print "1.2 10 ",m14,t14
print "0.6 20 ",m21,t21
print "0.8 20 ",m22,t22
print "1.0 20 ",m23,t23
print "1.2 20 ",m24,t24
print "0.6 30 ",m31,t31
print "0.8 30 ",m32,t32
print "1.0 30 ",m33,t33
print "1.2 30 ",m34,t34
print "0.6 40 ",m41,t41
print "0.8 40 ",m42,t42
print "1.0 40 ",m43,t43
print "1.2 40 ",m44,t44
