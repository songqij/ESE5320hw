#include <stdio.h>
#include <stdlib.h>

int main() {
    // Stack variables
    int x = 20;  // Located at 0x5C
    int *stack1 = &x;  // Located at 0x50, pointing to 0x5C

    int heap1 = 5;  // Setting value at address 0x24 to 5
    int heap2 = 6;  // Setting value at address 0x28 to 6
    int heap3 = 7;  // Setting value at address 0x2C to 7
    int heap4 = 50; // Setting value at address 0x14 to 50

    int *stack2 = &heap4;  // Located at 0x48, pointing to heap 0x14
    int *stack3 = &heap1;  // Located at 0x40, pointing to heap 0x24


    // Verifying the memory structure
    printf("Address of x: %p, Value: %d\n", &x, x);
    printf("Address of stack1: %p, Content: %p, Value at stack1: %d\n", &stack1, stack1,*stack1);
    printf("Address of stack2: %p, Content: %p, Value at stack2: %d\n", &stack2, stack2, *stack2);
    printf("Address of stack3: %p, Content: %p, Value at stack3: %d\n", &stack3, stack3, *stack3);
    printf("Address of heap1: %p, Content: %d\n", &heap1, heap1);
    printf("Address of heap2: %p, Content: %d\n", &heap2, heap2);
    printf("Address of heap3: %p, Content: %d\n", &heap3, heap3);
    printf("Address of heap4: %p, Content: %d\n", &heap4, heap4);

    return 0;
}

