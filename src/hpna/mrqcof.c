void mrqcof(double *x, double* y, double* sig, int points_number, double *a, int
		param_number, int *lista, int mfit, double **alpha, double *beta, double
		*chisquare, void (*funcs)())
{
	int k, j, i;
	double ymod, wt, sig2i, dy, *dyda, *vector();
	void free_vector();

	dyda = vector(1, param_number);
	
	/* alpha und beta Nullsetzen */
	
	for (j = 1; j <= mfit; j++) {
		for (k = 1; k <= j; k++)
			alpha[j][k] = 0.0;
		beta[j] = 0.0;
	}

	*chisquare = 0.0;
	
	for (i = 1; i <= points_number; i++) {
		
		(*funcs) (x[i], a, &ymod, dyda, param_number);
		sig2i = 1.0 / (sig[i] * sig[i]);
		dy = y[i] - ymod;
		for (j = 1; j <= mfit; j++) {
			wt = dyda[lista[j]] * sig2i;
			for (k = 1; k <= j; k++) {
				alpha[j][k] += wt * dyda[lista[k]];
			}
			beta[j] += dy * wt;
		}
		(*chisquare) += dy * dy * sig2i;
	}

	for (j = 2; j <= mfit; j++)
		for (k = 1; k <= j - 1; k++)
			alpha[k][j] = alpha[j][k];
	
	free_vector(dyda, 1, param_number);
}
