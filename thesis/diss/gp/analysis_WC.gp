print "d0: ",d0(l*1e-3,dC3)*1e9," T: ",T
print "WC U [V]: ",dV," n [1e14]: ",n10(l*1e-3,dV,ds,eps,dC3)/1e14," d [nm]: ",d10(l*1e-3,dV,ds,eps,dC3)*1e9
print "Gamma (Bulk):", Tct(n10(l*1e-3,dV,ds,eps,dC3),d10(l*1e-3,dV,ds,eps,dC3),eps,1)/T
print "Gamma (Peeters):", Tsct(n10(l*1e-3,dV,ds,eps,dC3),d10(l*1e-3,dV,ds,eps,dC3),eps,1)/T
print "Gamma (Saitoh):", TsctSaitoh(n10(l*1e-3,dV,ds,eps,dC3),d10(l*1e-3,dV,ds,eps,dC3),eps,1)/T

