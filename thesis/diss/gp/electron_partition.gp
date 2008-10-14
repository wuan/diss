wmax = sqrt((4*(w*t)**4-1)/((w*t)**2))/(2*t)
Ar = (A*cr(wmax)+Al*loc_cr(wmax))/(A*cr(0)+Al*loc_cr(0))
f0 = loc_cr(0)
fw = loc_cr(wmax)
q0 = cr(0)
qw = cr(wmax)
ne = (Ar*f0-fw) / (Ar*(f0-q0)-(fw-qw))
nep = ne*100
