load "../gp/smallps.gp"

set output "filp.eps"

set yl "Filamentleistung [mW]"
set xl "Zeit [ms]"

set yr [0:*]
#set pointsize 0.25

plot "<bzcat ../data/Dfilp0201d4.00100.bz2" \
   every 25 u ($1*1e3):($2*1e3) not w p pt 7

