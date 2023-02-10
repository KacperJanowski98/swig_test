#include "simple/app.hpp"

auto app::add(int a, int b) -> int
{
    return a + b;
}

auto app::add_new(app_data_t data) -> int
{
    return data.a + data.b;
}
