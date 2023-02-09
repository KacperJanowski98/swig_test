cmake_minimum_required(VERSION 3.14)

project(simple_app LANGUAGES C CXX)

set(PROJECT_VERSION 0.1.0)

add_library(simple_app)
add_library(simple_app::lib ALIAS simple_app)

target_include_directories(simple_app
    PUBLIC
        ${CMAKE_CURRENT_LIST_DIR}/include
)

target_sources(simple_app
    PRIVATE
        include/simple/app/types.h
        # include/simple/app.hpp
        include/simple/app_c.h

        # src/app.cpp
        src/app_c.cpp
)

# target_link_libraries(simple_app)

if (SIMPLE_BUILD_WITH_PYTHON)
    add_subdirectory(python)
endif()
