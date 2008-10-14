load "../gp/smallps.gp"

set output "filr.eps"

set yl "Filamentwiderstand [{/Symbol W}]"
set xl "Zeit [ms]"

#set pointsize 0.25

plot "<bzcat ../data/Dfilr0201d4.00100.bz2" \
	every 25 u ($1*1e3):2 not w p 7

