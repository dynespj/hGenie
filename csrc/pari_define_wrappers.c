#include <stdio.h>
#include <stdlib.h>
#include <pari/pari.h>





void myprinter (GEN x) 
{
    pari_printf("The result is: %Ps\n", x);
    return;
}

