
HeVP0l=1.392408
HeVP1l=0.527153
HeVP2l=0.166756
HeVP3l=0.050988
HeVP4l=0.026514
HeVP5l=0.001975
HeVP6l=-0.017976
HeVP7l=0.005409
HeVP8l=0.013259
HeVP9l=0.0
HeVPBl=5.6
HeVPCl=2.9

HeVP0h=3.146631
HeVP1h=1.357655
HeVP2h=0.413923
HeVP3h=0.091159
HeVP4h=0.016349
HeVP5h=0.001826
HeVP6h=-0.004325
HeVP7h=-0.004973
HeVP8h=0.0
HeVP9h=0.0
HeVPBh=10.3
HeVPCh=1.9

HeVPl(p,i)=((log(p)-HeVPBl)/HeVPCl)**i
HeVPh(p,i)=((log(p)-HeVPBh)/HeVPCh)**i
HeTl(p) =(HeVP0l+HeVP1l*HeVPl(p,1)+HeVP2l*HeVPl(p,2)+HeVP3l*HeVPl(p,3)+HeVP4l*HeVPl(p,4)+HeVP5l*HeVPl(p,5)+HeVP6l*HeVPl(p,6)+HeVP7l*HeVPl(p,7)+HeVP8l*HeVPl(p,8)+HeVP9l*HeVPl(p,9))
HeTh(p)= (HeVP0h+HeVP1h*HeVPh(p,1)+HeVP2h*HeVPh(p,2)+HeVP3h*HeVPh(p,3)+HeVP4h*HeVPh(p,4)+HeVP5h*HeVPh(p,5)+HeVP6h*HeVPh(p,6)+HeVP7h*HeVPh(p,7)+HeVP8h*HeVPh(p,8)+HeVP9h*HeVPh(p,9))
temp(p)=HeTl(p) > 2.1768 ? HeTh(p) : HeTl(p)
