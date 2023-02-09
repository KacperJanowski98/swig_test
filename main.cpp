#include <iostream>
#include "simple/app_c.h"

int main(void)
{
    // app_data_t data{1, 2};
    // app obj;
    int result = app_add(1, 2);
    // int result = obj.add(1, 2);
    std::cout << result << std::endl; 
    return 0;
}
