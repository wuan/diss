set xlabel "output power [dBm]"
set ylabel "linear transmission [arb. u.]"
set y2label "frequency [GHz]"
set title `printf '"section (%i) power dependence"' $i`
plot "" every :::(i)::(i) u 36:(($36>=-15 ? ($36>=-10?t1:t2) : ($36<-30?t6:($36<-25?t5:($36<-20?t4:0))))+$11+$17+$19/1e9*$13/1e9) ti "transmission" w p 7, \
	 "" every :::(i)::(i) u 36:(($36>=-15 ? ($36>=-10?f1:f2) : ($36<-30?f6:($36<-25?f5:($36<-20?f4:0))))+$13/1e9) axes x1y2 ti "frequency" w p 4
