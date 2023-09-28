#lorentz(x)=amp*(1/(1+(x-frq)**2/(wid/2)**2))
lorentz(x)=ampo/(4*((x-frqo)/wido)**2+1)
lorex(x)=4*amp*wid*sqrt((4*wid**2+49*x**2)/((4*wid**2+49*(x-frq)**2)*(4*wid**2+49*(x+frq)**2)))

