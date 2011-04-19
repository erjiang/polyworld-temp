#include <math.h>
#include <stdio.h>

int main(){
    double a = 0.02;
    double b = 0.2;
    double c = -65.0;
    double d = 2.0;
    double v = -65.0;
    double u = v * b;
    int i;
    double II;
    for (i = 0; i < 1000; i++) {
        II = sin(i)*10;
        if(v >= 30){
            v = c;
            u = u + d;
        }
        printf("loop\t%f\t%f\t%d\t%f\n", u, v, i, II);
        v = v + 0.5 * ((0.04*v*v) + (5*v) + (140) +(-1*u) + II);
        v = v + 0.5 * ((0.04*v*v) + (5*v) + (140) +(-1*u) + II);
        u = u + (a * (b*v - u));
    }
    return 0;
}
