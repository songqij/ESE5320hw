#include <stdio.h>

int main() {
    double a[] = {3.14, 2.71};
    unsigned char *ptr;

    for (int i = 0; i < 2; i++) {
        
        ptr = (unsigned char *)&a[i];

        printf("Bytes of a[%d]: ", i);
        
        for (int j = 0; j < 8; j++) {
            printf("%02x ", ptr[j]);
        }
        printf("\n");
    }

    return 0;
}
