#include "gramschmidt.h"

void gramschmidt(double A[1024][1024], double R[1024][1024], double Q[1024][1024]) {

    const int m = 1024;
    const int n = 1024;

    int i, j, k;

    double nrm;

/*L1:*/    for (k = 0; k < n; k++) {
        nrm = 0.0;
/*L2:*/        for (i = 0; i < m; i++)
            nrm += A[i][k] * A[i][k];
        R[k][k] = sqrt(nrm);
/*L3:*/        for (i = 0; i < m; i++)
            Q[i][k] = A[i][k] / R[k][k];
/*L4:*/        for (j = k + 1; j < n; j++) {
            R[k][j] = 0.0;
/*L5:*/            for (i = 0; i < m; i++)
                R[k][j] += Q[i][k] * A[i][j];
/*L6:*/            for (i = 0; i < m; i++)
                A[i][j] = A[i][j] - Q[i][k] * R[k][j];
        }
    }
}
