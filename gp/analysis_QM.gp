print "QM U [V]: ",dV+dV2," n [1e14]: ",n10(l*1e-3,dV+dV2,ds,eps,dC3)/1e14," d [nm]: ",d10(l*1e-3,dV+dV2,ds,eps,dC3)*1e9
print "Gamma (Bulk):",Gfc(n10(l*1e-3,dV+dV2,ds,eps,dC3))
print "Gamma (Peeters):",Gfsc(n10(l*1e-3,dV+dV2,ds,eps,dC3),d10(l*1e-3,dV+dV2,ds,eps,dC3),eps)
print "Gamma (Saitoh):",GfscSaitoh(n10(l*1e-3,dV+dV2,ds,eps,dC3),d10(l*1e-3,dV+dV2,ds,eps,dC3),eps)

