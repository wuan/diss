load "../gp/absorption_function.gp"
load "../gp/susceptibility_function.gp"

load "../gp/smallps.gp"
set output "cr0202d4_002.eps"

set yr [0:2]
fitstart=25
fitend=25
FILENAME = "<bzcat ../data/mw0202d4.dat.bz2"
A=10
offset=0.000001
t=5
w=0.4
load "../gp/crfit.gp"
set key samplen 0.4 spacing 2
load "../gp/plot_absorption_DE.gp"
