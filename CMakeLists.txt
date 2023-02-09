cmake_minimum_required(VERSION 3.14)

project(simple LANGUAGES CXX C)

option(SIMPLE_BUILD_WITH_PYTHON "Build python module" ON)

set(CMAKE_C_STANDARD 99)
set(CMAKE_CXX_STANDARD 14)

add_subdirectory(app)

add_executable(simple main.cpp)

target_link_libraries(simple simple_app::lib)
