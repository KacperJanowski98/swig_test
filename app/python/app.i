%module(directors="1") pyapp_wrapper

%include "stdint.i"

%{
#include <simple/app/types.h>
#include <simple/app_c.h>
%}

%#include <simple/app/types.h>
%#include <simple/app_c.h>