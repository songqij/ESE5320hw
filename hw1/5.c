#include<stdio.h>
#include<stdlib.h>


void temp(int i) {
  int a[2];
  int b[3];
  int *c;
  int *d;
  c = (int *)malloc(sizeof(int) * 4);
  d = (int *)malloc(sizeof(int) * 5);

  // print addresses for arrays here....
  printf("the address of a[0] is %p, a[1] is %p\n",a,a+1);
  printf("the address of b[0] is %p, b[1] is %p,b[2] is %p\n",b,b+1,b+2);
  printf("the address of c[0] is %p, c[1] is %p,c[2] is %p,c[3] is %p\n",c,c+1,c+2,c+3);
  printf("the address of d[0] is %p, d[1] is %p,d[2] is %p,d[3] is %p,d[4] is %p\n",d,d+1,d+2,d+3,d+4);


  return;
}

int main(){
    temp(0);
    return 0;
}