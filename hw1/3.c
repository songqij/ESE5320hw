#include<stdio.h>
#include<stdlib.h>

struct s2 {
    float a;
    int b;
};

struct s1 {
    int c;
    struct s2 **d;
};

// struct s1 x[5];
int main(){
    struct s1 x[5];
    struct s2 e;
    struct s2 * ptr;
    ptr = &e;
    x[2].d = & ptr;
    printf("the address of b is %p\n",(void*)(&((*x[2].d)->b)));

    
}