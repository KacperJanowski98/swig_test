#include "simple/app_c.h"

int app_add(int a, int b)
{
    return a + b;
}

int app_add_new(app_data_t data)
{
    return data.a + data.b;
}