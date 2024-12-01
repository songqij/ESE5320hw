#include <stdio.h>
#include <stdlib.h>

int main() {
    int a[2][4] = {{10, 20, 30, 40}, {50, 60, 70, 80}};

    int *ptr[2]; //Declaring an array of pointers
    int **d_ptr = ptr;
    ptr[0] = &a[0];  // first line
    ptr[1] = &a[1];  // second line
    

    for (int i = 0; i < 2; i++) {
        for (int j = 0; j < 4; j++) {
            printf("Value at a[%d][%d] = %d, aadress is %p accessed via ptr[%d][%d]\n", i, j, *(*(d_ptr+i)+j), (ptr[i]+j) ,i, j);
        }
    }



    return 0;
}
