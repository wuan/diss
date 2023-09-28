#include <math.h>
#include <stdio.h>

void fitfunc(double x, double *p, double *f, double *dp, int m);

double p[] = {1,1,0.1,M_PI/4};
double f, dp[4];

int main()
{
	int i;
	for (i=0; i<500; i++) {
		double xval = 0.5+0.002*i;
		fitfunc(xval,p,&f,dp,4);
		printf("%f %f %f %f %f %f\n",xval,f,dp[0],dp[1],dp[2],dp[3]);
	}
}