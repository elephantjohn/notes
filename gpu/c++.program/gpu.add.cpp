#include <iostream>
#include <math.h>

void add(int n, float *x, float* y)
{
    for(int i = 0; i < n ;i ++)
    {
        y[i] = x[i] + y[i];
    }
}

int main()
{
    int N = 1<<20;//1M elements
    
    float *x;float *y;

    cudaMallocManaged(&x,N*sizeof(float));

    for(int i=0;i<N;i++)
    {
        x[i] = 1.0f;
        y[i] = 2.0f;
    }

    add(N,x,y);

    delete []x;
    delete []y;
    printf("finished...\n");
    return 0;
}