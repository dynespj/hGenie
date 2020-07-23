#include <stdio.h>
#include <stdlib.h>
#include <pari/pari.h>


void destroyer (GEN x)
{
    printf("destroyer has been called\n");
    return;
}
