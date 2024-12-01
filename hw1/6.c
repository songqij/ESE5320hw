#include<stdio.h>
int a[3];
int b[4];
int c[5];

// intervening code omitted



int main(){
    b[4]=13;
    
    printf("%d\n",b[4]);
    printf("%d\n",a[0]);
    printf("%d\n",a[1]);
    printf("%d\n",a[2]);
    printf("%d\n",b[0]);
    printf("%d\n",b[1]);
    printf("%d\n",b[2]);
    printf("%d\n",b[3]);
    printf("%d\n",c[0]);
    // printf("%d\n",c[1]);
    // printf("%d\n",c[2]);
    // printf("%d\n",c[3]);
    // printf("%d\n",c[4]);
    // printf("%d\n",c[5]);
}