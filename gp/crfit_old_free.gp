FIT_LIMIT=1e-9
fit A*cr(x)+offset "" \
	every :::(fitstart)::(fitend) u ($40*0.0401):(1/($11+$17+$19/1e9*$13/1e9)) \
	via A, w ,t, offset
wo=w
to=t
offseto=offset
Ao=A

wf=wo
tf=to
Af=Ao
offsetf=offseto
fit Af*chi(x)+offsetf "" \
	every :::(fitstart)::(fitend) u ($40*0.0401):(1/($13/1e9)**2) \
	via Af, wf ,tf, offsetf  

