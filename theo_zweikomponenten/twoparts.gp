load "../gp/bigps.gp"
load "../gp/absorption_function.gp"

set output "twoparts.eps"

A=6.5217
Al=3.78294
w=0.289385
t=5.01683
offset=15.449

set xr [0:0.8]
plot A*cr(x)+Al*loc_cr(x),A*cr(x),Al*loc_cr(x)
