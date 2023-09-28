#include <math.h>
#include <stdio.h>

void fitfunc(double x, double *p, double *f, double *dp, int m) 
{
	double amp = p[1];
	double frq = p[2];
	double wid = p[3];
	double phi = p[6];
	double off = p[4];
	double lin = p[5];

	double sqr_x = x*x;
	double s_phi = sin(phi);
	double c_phi = cos(phi);
	double sqr_s_phi = s_phi*s_phi;
	double sqr_wid = wid*wid;
	double sqr_x_minus_frq = pow(x-frq,2.0);
	double sqr_x_plus_frq = pow(x+frq,2.0);
	double zaehler2 = 7.0*frq*c_phi+2.0*wid*s_phi;
	double sqr_zaehler2 = zaehler2*zaehler2;
	double zaehler = 49.0*sqr_x*sqr_s_phi+sqr_zaehler2;
	
	double nenner1 = 4.0*sqr_wid+49.0*sqr_x_minus_frq;
	double sqr_nenner1 = nenner1*nenner1;
	double nenner2 = 4.0*sqr_wid+49.0*sqr_x_plus_frq;
	double sqr_nenner2 = nenner2*nenner2;
	double nenner = nenner1*nenner2;
	double wurzel = sqrt(zaehler/nenner);

	/*	printf("lorex(%g): amp=%g,frq=%g,wid=%g,phi=%g\n",x,amp,frq,wid,phi);*/

	if (m!=6) {
		printf("FEHLER: Anzahl der Fitparameter != 4\n");
	}

	/* Definitionen für alle Funktionen */


/*###############################################################################
//	dlda
*/

	dp[1] = 4.0*wid*wurzel;

/*###############################################################################
//	lorex(x);
*/

	*f = amp*dp[1]+off+lin*(x-frq);

/*###############################################################################
//	dldf
*/

	dp[2] = 2.0*amp*wid/wurzel*(14.0*zaehler2*c_phi/nenner-zaehler/sqr_nenner1/nenner2*(-98.0*x+98.0*frq)-zaehler/nenner1/sqr_nenner2*(98.0*x+98.0*frq));

/*###############################################################################
//	dldw
*/

	dp[3] = 4.0*amp*wurzel+2.0*amp*wid/wurzel*(4.0*zaehler2*s_phi/nenner-8.0*zaehler/sqr_nenner1/nenner2*wid-8.0*zaehler/nenner1/sqr_nenner2*wid);

/*###############################################################################
//	dldp
*/

	dp[6] = 2.0*amp*wid/wurzel*(98.0*sqr_x*s_phi*c_phi+2.0*zaehler2*(-7.0*frq*s_phi+2.0*wid*c_phi))/nenner;
	
/*###############################################################################
//	dldo
*/

	dp[4] = 1;

/*###############################################################################
//	dldl
*/

	dp[5] = (x-frq);

}
