load "../gp/smallps.gp"
set output "fil_eichung2.eps"

eichfunc(x)=-x/(0.147-0.063)*2e9*2
# die letzte "2" stammt aus der Annahme, man belade ca. 2 cm^2
FILENAME = "fil_eichung.dat"

set xlabel "Pulsamplitude [V]"
set ylabel "Elektronen pro Puls" offset -3.5
set xr [0.55:1.25]
set key left top samplen 1 spacing 2
set yr [-2e7:*]
set ytics axis
set lmargin 8

set ytics ("8 10^{8}" 8e8, "6 10^{8}" 6e8, "4 10^{8}" 4e8,"2 10^{8}" 2e8, "0" 0)
plot FILENAME every :::3::3 u 1:(eichfunc($3)) ti "40 ms" w linesp lt 4 pt 10, \
	 FILENAME every :::2::2 u 1:(eichfunc($3)) ti "30 ms" w linesp lt 3 pt 8, \
	 FILENAME every :::1::1 u 1:(eichfunc($3)) ti "20 ms" w linesp lt 2 pt 6, \
	 FILENAME every :::0::0 u 1:(eichfunc($3)) ti "10 ms" w linesp lt 1 pt 4
