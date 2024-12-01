#include <stdio.h>

int main() {
    int array[2][4]={{10,20,30,40},{50,60,70,80}};
    int* p_array[2];
//set the two line begining address
    p_array[0] = &array[0][0];
    p_array[1] = &array[1][0];
    
//get all the adress and value
    for (int i = 0; i < 2; i++) {
        for (int j = 0; j < 4; j++) {
            // printf("Address of array[%d][%d] = %p, Value = %d\n", i, j, (p_array[i]+j), *(p_array[i]+j));
            printf("Address of array[%d][%d] = %p, Value = %d\n", i, j, (p_array[0]+(4*i+j)), *(p_array[i]+j));
        }
    }
    return 0;
}

//printf("Address of array[%d][%d] = %p, Value = %d\n", i, j, (ptr[0]+(4*i+j)*sizeof(int)), *(p_array[i]+j));
