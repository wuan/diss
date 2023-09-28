#include <stdio.h>
#include "util.h"

void mrqmin(double *x, double *y, double *sig, int points_number, double *a, \
	int param_number, int *param_list, int fitpar_number, double **covar, double **alpha, \
	double *chisquare, void (*funcs) (double, double *, double *, double *, int), \
	double *lambda, double urf)
{
	int k, kk, j, ihit;
	static double *da, *atry, **oneda, *beta, chisquare_old;
	double *vector(), **matrix();
	void mrqcof(), gaussj(), covsrt(), nrerror(), free_matrix(), free_vector();

	if (*lambda < 0.0) {
		oneda = matrix(1, fitpar_number, 1, 1);
		atry =  vector(1, param_number);
		da =    vector(1, param_number);
		beta =  vector(1, param_number);

		kk = fitpar_number + 1;
		
		for (j = 1; j <= param_number; j++) {
			ihit = 0;

			for (k = 1; k <= fitpar_number; k++)
				if (param_list[k] == j)
					ihit++;

			if (ihit == 0)
				param_list[kk++] = j;
			else if (ihit > 1)
				nrerror("Bad param_list permutation in MRQMIN-1");
		}

		if (kk != param_number + 1)
			nrerror("Bad param_list permutation in MRQMIN-2");

		*lambda = 0.001 / urf;
		
		mrqcof(x, y, sig, points_number, a, param_number, param_list, fitpar_number, \
			   alpha, beta, chisquare, funcs);
		
		chisquare_old = (*chisquare);
	}

	for (j = 1; j <= fitpar_number; j++) {
		for (k = 1; k <= fitpar_number; k++) {
			covar[j][k] = alpha[j][k];
		}
		covar[j][j] = alpha[j][j] * (1.0 + (*lambda));
		oneda[j][1] = beta[j];
	}

	gaussj(covar, fitpar_number, oneda, 1);

	for (j = 1; j <= fitpar_number; j++)
		da[j] = oneda[j][1];

	if (*lambda == 0.0) {
		covsrt(covar, param_number, param_list, fitpar_number);
		free_vector(beta, 1, param_number);
		free_vector(da, 1, param_number);
		free_vector(atry, 1, param_number);
		free_matrix(oneda, 1, fitpar_number, 1, 1);
		return;
	}

	for (j = 1; j <= param_number; j++)
		atry[j] = a[j];

	for (j = 1; j <= fitpar_number; j++)
		atry[param_list[j]] = a[param_list[j]] + da[j];

	mrqcof(x, y, sig, points_number, atry, param_number, param_list, fitpar_number, \
		   covar, da, chisquare, funcs);

	if (*chisquare < chisquare_old) {
		*lambda *= 0.1 / urf;
		chisquare_old = (*chisquare);

		for (j = 1; j <= fitpar_number; j++) {
			for (k = 1; k <= fitpar_number; k++)
				alpha[j][k] = covar[j][k];
			beta[j] = da[j];
			a[param_list[j]] = atry[param_list[j]];
		}
	} else {
		*lambda *= 10.0 / urf;
		*chisquare = chisquare_old;
	}
	return;
}
