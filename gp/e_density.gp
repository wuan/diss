a=2.0179381462855727e-9
a2=2.2312745671108833e-9
b=3.1134245052973134e-15
c=0.999930004899657
d=2.1333642082531073e-10
e=0.3333333333333333
f=2.e-9
d(h,n)=6.320083079430833e-9/((1+(1.0194397730122011e-30*n**2)/h)**e*abs(h)**e)
n0(h,U,ds,es,dC3)=(5.526349953954073e7*U)/(f+ds/es+a2*abs(dC3**e/h**e))
n10(h,U,ds,es,dC3)=(5.526349953954073e7*U)/(f+ds/es+(a2*abs(dC3**e/h**e))/(1+(b*U**2)/(h*(f+ds/es+(a2*abs(dC3**e/h**e))/(1+(b*U**2)/(h*(f+ds/es+(a2*abs(dC3**e/h**e))/(1+(b*U**2)/(h*(f+ds/es+(a2*abs(dC3**e/h**e))/(1+(b*U**2)/(h*(f+ds/es+(a2*abs(dC3**e/h**e))/(1+(b*U**2)/(h*(f+ds/es+(a2*abs(dC3**e/h**e))/(1+(b*U**2)/(h*(f+ds/es+(a2*abs(dC3**e/h**e))/(1+(b*U**2)/(h*(f+ds/es+(a2*abs(dC3**e/h**e))/(1+(b*U**2)/(h*(f+ds/es+(a2*abs(dC3**e/h**e))/(1+(b*U**2)/(h*(f+ds/es+(a2*abs(dC3**e/h**e))/(1+(b*U**2)/(h*(f+ds/es+a2*abs(dC3**e/h**e))**2))**e)**2))**e)**2))**e)**2))**e)**2))**e)**2))**e)**2))**e)**2))**e)**2))**e)**2))**e)
d10(h,U,ds,es,dC3)=(2.133364208253107e-9*abs(dC3**e/h**e))/(1+(b*U**2)/(h*(f+ds/es+(a2*abs(dC3**e/h**e))/(1+(b*U**2)/(h*(f+ds/es+(a2*abs(dC3**e/h**e))/(1+(b*U**2)/(h*(f+ds/es+(a2*abs(dC3**e/h**e))/(1+(b*U**2)/(h*(f+ds/es+(a2*abs(dC3**e/h**e))/(1+(b*U**2)/(h*(f+ds/es+(a2*abs(dC3**e/h**e))/(1+(b*U**2)/(h*(f+ds/es+(a2*abs(dC3**e/h**e))/(1+(b*U**2)/(h*(f+ds/es+(a2*abs(dC3**e/h**e))/(1+(b*U**2)/(h*(f+ds/es+(a2*abs(dC3**e/h**e))/(1+(b*U**2)/(h*(f+ds/es+(a2*abs(dC3**e/h**e))/(1+(b*U**2)/(h*(f+ds/es+a2*abs(dC3**e/h**e))**2))**e)**2))**e)**2))**e)**2))**e)**2))**e)**2))**e)**2))**e)**2))**e)**2))**e)**2))**e
Tm(n,d,es)=2.16193e-7*sqrt(n)*(1.-(1.*(-1.+es))/((1.+es)*(1.+10.271197481732255*d**2*n)**1.5))
Tm_new(n,d,es,Gamma0)=214533.*sqrt(n)*(1-es+sqrt(1+12.566370614359172*d**2*n)*(1+es))/(sqrt(1+12.566370614359172*d**2*n)*Gamma0*7.243371518e9*(1+es))
Gamma(n,d,es,T)=(sqrt(n)*(1.9493293124261805e23-1.9493293124261805e23*es+2.0021946324858654e24*sqrt(1.+10.271197481732255*d**2*n)*(0.09735963131645953+0.09735963131645953*es+d**2*(1.+1.*es)*n)))/(sqrt(1.+10.271197481732255*d**2*n)*(6.581480301911851e27+6.581480301911851e27*es+d**2*(6.7599683903067454e28+6.7599683903067454e28*es)*n)*T)
Tct(n,d,es,Gamma0)=(0.000029617837420996413*sqrt(n))/Gamma0
Tsct(n,d,es,Gamma0)=(sqrt(n)*(214533. - 214533.*es + (214533. + 214533.*es)*sqrt(1. + 12.566370614359172*d**2*n)))/((7.243371518e9 + 7.243371518e9*es)*Gamma0*sqrt(1. + 12.566370614359172*d**2*n))
TsctSaitoh(n,d,es,Gamma0)=(sqrt(n)*(5.773816947393e12 - 5.773816947393e12*es + 5.9304014090046e13*sqrt(1. + 10.271197481732255*d**2*n)* (0.09735963131645954 + 0.09735963131645954*es + d**2*(1. + 1.*es)*n)))/(Gamma0*sqrt(1. + 10.271197481732255*d**2*n)*(1.9494390712334307e17 + 1.9494390712334307e17*es + d**2*(2.0023073679243282e18 + 2.0023073679243282e18*es)*n))
Gfc(n)=1.066163799971734e10/sqrt(n)
Gfsc(n,d,es)=(1.066163799971734e10*(1 - (-1 + es)/((1 + es)*sqrt(1 + 4*d**2*n*pi))))/sqrt(n)
GfscSaitoh(n,d,es)=(1.066163799971734e10*(1 - (-1 + es)/((1 + es)*(1 + 10.271197481732255*d**2*n)**1.5)))/sqrt(n)