cr(x)= (1+w**2*t**2+x**2*t**2)/((1-w**2*t**2+x**2*t**2)**2+4*w**2*t**2)
crv(x,w,t)= (1+w**2*t**2+x**2*t**2)/((1-w**2*t**2+x**2*t**2)**2+4*w**2*t**2)
cro(x)= (1+x**2*to**2+wo**2*to**2)/((1-x**2*to**2+wo**2*to**2)**2+4*x**2*to**2)
crp(x)= (1+x**2*tp**2+wp**2*tp**2)/((1-x**2*tp**2+wp**2*tp**2)**2+4*x**2*tp**2)
crq(x)= (1+x**2*tq**2+wq**2*tq**2)/((1-x**2*tq**2+wq**2*tq**2)**2+4*x**2*tq**2)
crr(x)= (1+x**2*tr**2+wr**2*tr**2)/((1-x**2*tr**2+wr**2*tr**2)**2+4*x**2*tr**2)

cr2(x,z)= (1+x+z)/((1-z+x)**2+4*z)

loc_crold(x)=1/abs(w*t)*(0.5*\
		log((4.0*w**2*t**2+(1+x**2*t**2)**2)\
			/ (1+2.0*(w**2*t**2+x**2*t**2)+(w**2*t**2-x**2*t**2)**2))\
		+ abs(w*t) * (atan((1+x**2*t**2)/(2*abs(w*t)))\
			- atan((1+x**2*t**2-w**2*t**2)/(2*abs(w*t)))))
	
loc_crold2(x)=1/abs(w*(t+dt))*(0.5*\
		log((4.0*w**2*(t+dt)**2+(1+x**2*(t+dt)**2)**2)\
			/ (1+2.0*(w**2*(t+dt)**2+x**2*(t+dt)**2)+(w**2*(t+dt)**2-x**2*(t+dt)**2)**2))\
		+ abs(w*(t+dt)) * (atan((1+x**2*(t+dt)**2)/(2*abs(w*(t+dt))))\
			- atan((1+x**2*(t+dt)**2-w**2*(t+dt)**2)/(2*abs(w*(t+dt))))))
	
loc_cr(x)=(atan(sqrt(w**2*t**2)/(1 + x**2*t**2 + sqrt(x**2*t**2)*sqrt(w**2*t**2))) +\
	   	atan(w**2*t**2/((1 + x**2*t**2)*sqrt(w**2*t**2) - sqrt(x**2*t**2)*w**2*t**2)) -\
		pi*(-1+sgn(atan(w**2*t**2/((1 + x**2*t**2)*sqrt(w**2*t**2) - sqrt(x**2*t**2)*w**2*t**2))))/2) /\
		(2*sqrt(w**2*t**2))
loc_cr_fix(x)=(atan(sqrt(wt2)/(1 + x**2*t**2 + sqrt(x**2*t**2)*sqrt(wt2))) +\
	   	atan(wt2/((1 + x**2*t**2)*sqrt(wt2) - sqrt(x**2*t**2)*wt2)) -\
		pi*(-1+sgn(atan(wt2/((1 + x**2*t**2)*sqrt(wt2) - sqrt(x**2*t**2)*wt2))))/2) /\
		(2*sqrt(wt2))
	
loc_cr2(x,z)=(atan(sqrt(z)/(1 + x + sqrt(x)*sqrt(z))) +\
	   	atan(z/((1 + x)*sqrt(z) - sqrt(x)*z)) -\
		pi*(-1+sgn(atan(z/((1 + x)*sqrt(z) - sqrt(x)*z))))/2) /\
		(2*sqrt(z))
loc_cr2_0(z)=(atan(sqrt(z)) +\
	   	atan(z/sqrt(z))) / (2*sqrt(z))
loc_cr3(x)=(atan(sqrt(z)/(1 + x + sqrt(x)*sqrt(z))) +\
	   	atan(z/((1 + x)*sqrt(z) - sqrt(x)*z)) -\
		pi*(-1+sgn(atan(z/((1 + x)*sqrt(z) - sqrt(x)*z))))/2) /\
		(2*sqrt(z))
	
Qz(x)=abs(w*t)*ne*cr(x)+(1-ne)/abs(w*t)*loc_cr(x)

# Kennlinie der Diode
Power_diode(V)= 1.609e-3  +  1.3706e-3 * V  +  1.4674e-5 * sqrt(V)
# Elektronenladung e / [C]
q_e = 1.60217733e-19
# Elektronenruhemasse m_e / [kg]
m_e = 9.1093897e-31
# w(B) und B(w)
w(B) = q_e*B/m_e
B(w) = w*m_e/q_e

qemax(w,t)=sqrt(2*w*sqrt(1+t**2*w**2)/t-1/t**2-w**2)
qmax(w,t,n)=sqrt(-1/t**2 + w**2 - 2*n*w**2 +(2*w*sqrt(-1 + 2*n + n**2*t**2*w**2))/t)
d_helium(h,dC3)=2.13336e-9*((dC3/h)**(1.0/3.0))
