load "../gp/smallps.gp"
set output "saturate_1.eps"

FILENAME = "<bzcat ../data/mw0202d4.dat.bz2"

fa1(x)=ta1
fb1(x)=mb1*x+tb1
fit [0:50] fa1(x) FILENAME every :::34::34 u ($0/6):($11+$17+$19/1e9*$13/1e9) via ta1
fit [180:230] fb1(x) FILENAME every :::34::34 u ($0/6):($11+$17+$19/1e9*$13/1e9) via mb1,tb1

fa2(x)=ta2
fb2(x)=mb2*x+tb2
fit [0:40] fa2(x) FILENAME every :::40::40 u ($0/6):($11+$17+$19/1e9*$13/1e9) via ta2
fit [60:110] fb2(x) FILENAME every :::40::40 u ($0/6):($11+$17+$19/1e9*$13/1e9) via mb2,tb2

fa4(x)=ta4
fb4(x)=mb4*x+tb4
fit [10:50] fa4(x) FILENAME every :::52::52 u ($0/6):($11+$17+$19/1e9*$13/1e9) via ta4
fit [200:240] fb4(x) FILENAME every :::52::52 u ($0/6):($11+$17+$19/1e9*$13/1e9) via mb4,tb4

fa5(x)=ta5
fb5(x)=mb5*x+tb5
fit [20:40] fa5(x) FILENAME every :::57::57 u ($0/6):($11+$17+$19/1e9*$13/1e9) via ta5
fit [90:110] fb5(x) FILENAME every :::57::57 u ($0/6):($11+$17+$19/1e9*$13/1e9) via mb5,tb5

set xlabel "Zeit [min]"
set ylabel "Haltespannung [V]"
set key bottom right samplen 0.5 spacing 2
set xr [0:100]
set yr [0.4:0.55]
set ytics 0.05

plot FILENAME every 10::(int(6*(ta1-tb1)/mb1)):34::34 u ($0/6*10):10 ti "Messung 1" w p 4, \
	 FILENAME every 5::(int(6*(ta2-tb2)/mb2)):40::40 u ($0/6*5):10 ti "Messung 2" w p 6, \
	 FILENAME every 10::(int(6*(ta4-tb4)/mb4)):52::52 u ($0/6*10):10 ti "Messung 3" w p 8, \
	 FILENAME every 10::(int(6*(ta5-tb5)/mb5)):57::57 u ($0/6*10):10 ti "Messung 4" w p 12
