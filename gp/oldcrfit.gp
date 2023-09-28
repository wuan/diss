FIT_LIMIT=1e-9
fit A*cr(x)+offset "" \
	every ::(upstart)::(downend) u 3:((sqrt(Power_diode(Su)/Power_diode($1))-1.0)/Qu) \
	via A, w ,t, offset
wo=w
to=t
offseto=offset
Ao=A

fit A*cr(x)+Al*loc_cr(x)+offset "" \
	every ::(upstart)::(downend) u 3:((sqrt(Power_diode(Su)/Power_diode($1))-1.0)/Qu) \
	via A, Al, w ,t, offset  
	
wf=wo
tf=to
Af=Ao
offsetf=offseto
fit Af*chi(x)+offsetf "" \
	every ::(upstart)::(downend) u 3:(1/($5/1e9)**2) \
	via Af, wf ,tf, offsetf  

