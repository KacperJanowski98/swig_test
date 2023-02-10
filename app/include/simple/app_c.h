#pragma once

#include "app/types.h"
#include "stdint.h"

#ifdef __cplusplus
extern "C" {
#endif

int app_add(int a, int b);

int app_add_new(app_data_t data);

#ifdef __cplusplus
}
#endif
