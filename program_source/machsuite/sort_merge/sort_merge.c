#include "sort.h"

void merge(TYPE a[SIZE], int start, int m, int stop){
    TYPE temp[SIZE];
    int i, j, k;

    merge_label1 : for(i=start; i<=m; i++){
        #pragma HLS loop_tripcount min=1       max=SIZE       avg=SIZE/2
        temp[i] = a[i];
    }

    merge_label2 : for(j=m+1; j<=stop; j++){
        #pragma HLS loop_tripcount min=1       max=SIZE       avg=SIZE/2
        temp[m+1+stop-j] = a[j];
    }

    i = start;
    j = stop;

    merge_label3 : for(k=start; k<=stop; k++){
         #pragma HLS loop_tripcount min=1       max=SIZE       avg=SIZE*3/4
        TYPE tmp_j = temp[j];
        TYPE tmp_i = temp[i];
        if(tmp_j < tmp_i) {
            a[k] = tmp_j;
            j--;
        } else {
            a[k] = tmp_i;
            i++;
        }
    }
}

void ms_mergesort(TYPE a[SIZE]) {
    int start, stop;
    int i, m, from, mid, to;

    start = 0;
    stop = SIZE;

    mergesort_label1 : for(m=1; m<stop-start; m+=m) {
                #pragma HLS loop_tripcount min=1             max=SIZE  avg=SIZE  // ~log₂(SIZE) iterations :contentReference[oaicite:3]{index=3}
        mergesort_label2 : for(i=start; i<stop; i+=m+m) {
                        #pragma HLS loop_tripcount min=1       max=SIZE/(2*1)      avg=SIZE/(4*1)   //  at most SIZE/(2m) chunks; avg ≈ half that :contentReference[oaicite:4]{index=4}
            from = i;
            mid = i+m-1;
            to = i+m+m-1;
            if(to < stop){
                merge(a, from, mid, to);
            }
            else{
                merge(a, from, mid, stop);
            }
        }
    }
}
