load "../gp/smallps.gp"
set output "xy.eps"

set xl "X [bel. Einh.]"
set yl "Y [bel. Einh.]"

set yr [-48:35]
set xr [-20:32]
set zeroaxis
plot "<bzcat ../data/ke0205d2.024.bz2" every :2 u ($3*cos($4/180*pi)):($3*sin($4/180*pi)) not w p 0

