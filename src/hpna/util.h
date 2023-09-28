
void nrerror(char error_text[]);

double *vector(int nl,int nh);

int *ivector(int nl,int nh);

double *dvector(int nl,int nh);

double **matrix(int nrl,int nrh,int ncl,int nch);

double **dmatrix(int nrl,int nrh,int ncl,int nch);

int **imatrix(int nrl,int nrh,int ncl,int nch);

double **submatrix(double **a,int oldrl,int oldrh,int oldcl,int oldch,int newrl,int newcl);

void free_vector(double *v,int nl,int nh);

void free_ivector(int *v,int nl,int nh);

void free_dvector(double *v,int nl,int nh);

void free_matrix(double **m,int nrl,int nrh,int ncl,int nch);

void free_dmatrix(double **m,int nrl,int nrh,int ncl,int nch);

void free_imatrix(int **m,int nrl,int nrh,int ncl,int nch);

void free_submatrix(double **b,int nrl,int nrh,int ncl,int nch);

double **convert_matrix(double *a,int nrl,int nrh,int ncl,int nch);

void free_convert_matrix(double **b,int nrl,int nrh,int ncl,int nch);

