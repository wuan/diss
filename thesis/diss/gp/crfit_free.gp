FIT_LIMIT=1e-9
fit A*cr(x)+offset FILENAME \
	every :::(fitstart)::(fitend) u ($41*0.0401):(1/($11+$17+$19/1e9*$13/1e9)) \
	via A, w ,t, offset
wo=w
to=t
offseto=offset
Ao=A

wf=wo
tf=to
Af=Ao
offsetf=offseto
fit [0.02:0.86] Af*chi(x)+offsetf FILENAME \
	every :::(fitstart)::(fitend) u ($41*0.0401):(1/($13/1e9)**2) \
	via Af, wf ,tf, offsetf  

