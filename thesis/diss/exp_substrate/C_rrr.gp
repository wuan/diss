f_RT(x) = m_RT*x+t_RT
f_N(x)  = m_N *x+t_N
f_He(x) = m_He*x+t_He

FILE_RT="<bzcat ../data/RRR_C_RT.dat.bz2"
FILE_LN2="<bzcat ../data/RRR_C_LN2.dat.bz2"
FILE_LHe="<bzcat ../data/RRR_C_LHe.dat.bz2"
fit f_RT(x) FILE_RT u 1:2 via m_RT,t_RT
fit f_N(x)  FILE_LN2 u 1:2 via m_N,t_N
fit f_He(x) FILE_LHe u 1:2 via m_He,t_He

load "../gp/smidps.gp"
set output "C_rrr.eps"

set xlabel "Spannungsabfall über der Probe/ [V]"
set ylabel "Strom durch die Probe / [{/Symbol m}A] (LN2,L4He)"
set y2label "Strom durch die Probe / [{/Symbol m}A] (RT)"
set ytics nomirror
set y2tics
set y2range [-180:180]
set yrange [-20:20]

set xr [-100:100]
set key top left samplen 0.5 spacing 2

plot FILE_RT every 15 u 1:($2*1e6) axes x1y2 ti ">>  RT" w p 4, 1e6*f_RT(x) axes x1y2 not w l 1, \
	FILE_LN2 every 15 u 1:($2*1e6) ti "<<  LN2" w p 6, 1e6*f_N(x) not w l 2, \
	FILE_LHe every 15 u 1:($2*1e6) ti "<<  L4He" w p 8, 1e6*f_He(x) not w l 3
print 1/m_RT,1/m_N,1/m_He
