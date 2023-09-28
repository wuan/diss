/*
 * fitdata(param_number, &(x[s1 - 1]), &(y[s1 - 1]), &(sig[s1 - 1]),
 * ndata, fitpar_number, fitpar_list, p, argv[arg], epsilon, iflag, deltachisq, bfehl);
 * 
 * 
 * 
 * 
 * void fitdata(int param_number, double *x, double *y, double *sig,
 * int ndata, int fitpar_number, int fitpar_list[], double p[], char *fitfile, double epsilon,
 * int iflag, double deltachisq, double urf)
 * 
 * param_number : Anzahl der Parameter (ex: "ma")
 * points_number: Anzahl der Datenpunkte (ex: "ndata")
 * 
 * 
 * int fitpar_list[20] =
 * {1, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19};
 * 
 * 
 */

#include <math.h>
#include <ctype.h>
#include <stdio.h>
#include "util.h"

#define LAMBDA_MAX  1e20
#define STARTLAMBDA 0.01

void fitfunc(double x, double *p, double *f, double *dp, int m);
void mrqmin(double *x, double *y, double *sig, int points_number, double *a, \
	int param_number, int *fitpar_list, int fitpar_number, double **covar, double **alpha, \
	double *chisquare, void (*funcs)(double, double *, double *, double *, int), \
	double *lambda, double urf);

__inline double sqr(double x) 
{
	return x*x;
}

void fitdata(int param_number, double *x, double *y, double *sig, int points_number, \
	int fitpar_number, int fitpar_list[], double *param_array, double *param_error_array, \
	double epsilon, int iflag, double deltachisq, double urf)
{
	double **covar = NULL, **alpha = NULL, chisquare = 0, lambda, old_chisquare;
	double ochisq, old_lambda;
	int i, better = 0;

	i = iflag;

	/* Dies ist die Hauptschleife des Fits */ 

	do {
		if (alpha != NULL) {
			free_matrix(alpha, 1, param_number, 1, param_number);
			alpha = NULL;
		}
		if (covar != NULL) {
			free_matrix(covar, 1, param_number, 1, param_number);
			covar = NULL;
		}
		ochisq = chisquare;

		/* Matrixspeicher reservieren */
		alpha = matrix(1, param_number, 1, param_number);
		covar = matrix(1, param_number, 1, param_number);

		/* Variablen initialisieren */
		lambda = -1;
		mrqmin(x, y, sig, points_number, param_array, param_number, fitpar_list, fitpar_number,
			   covar, alpha, &chisquare, fitfunc, &lambda, urf);
		old_lambda = lambda = STARTLAMBDA;
		old_chisquare = chisquare;

		do {
			if ((old_lambda - lambda) > 0) {
				better = 1;
				old_chisquare = chisquare;
			} else {
				better = 0;
			}

			old_lambda = lambda;

			
			mrqmin(x, y, sig, points_number, param_array, param_number, fitpar_list, fitpar_number,
				   covar, alpha, &chisquare, fitfunc, &lambda, urf);

		} while (lambda < LAMBDA_MAX &&
				 (!better || (old_chisquare - chisquare) / chisquare > epsilon));

		/*
		printf("lambda=%g, chires=%g\n", lambda, (old_chisquare - chisquare) / chisquare);
		*/
		
		lambda = 0;				/* Speicher wieder freigeben */
		mrqmin(x, y, sig, points_number, param_array, param_number, fitpar_list, fitpar_number,
			   covar, alpha, &chisquare, fitfunc, &lambda, urf);

		/*
		printf("chisquare=%g\n", chisquare / points_number);
		*/
		
		i--;
	} while (((deltachisq == 0) && (iflag && i > 0)) ||
			 ((deltachisq != 0) && (fabs(ochisq - chisquare) > deltachisq * points_number) && 
			  (!iflag || i > 0) && (iflag || i > -100)));


	/* Bildschirmausgabe der Parameter */
	for (i = 1; i <= param_number; i++) {
		param_error_array[i]=sqrt(chisquare / points_number) * sqrt(sqrt(sqr(covar[i][i])));
		/*printf("Parameter #%d=%g +- %g\n", i, param_array[i], param_error_array[i]);*/
	}

	free_matrix(alpha, 1, param_number, 1, param_number);
	free_matrix(covar, 1, param_number, 1, param_number);
}
