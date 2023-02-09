set(CMAKE_SWIG_FLAGS)

find_package(SWIG 4.0 REQUIRED)
include(UseSWIG)

find_package(Python3 REQUIRED COMPONENTS Interpreter Development)
list(APPEND CMAKE_SWIG_FLAGS "-py3" "-DPY3")

execute_process(
        COMMAND ${Python3_EXECUTABLE} -m pip install build wheel pytest pytest-mock
        RESULT_VARIABLE code
        OUTPUT_QUIET
)

if (NOT ${code} EQUAL 0)
    message(FATAL_ERROR "Failed to install python dependencies")
endif ()

# -----------------------------------------------------------------------------------------

set(PYTHON_PROJECT_NAME pyapp)
set(SWIG_PROJECT_NAME pyapp_wrapper)
set(pyapp_project_dir ${CMAKE_CURRENT_BINARY_DIR}/pyapp)

set_property(SOURCE app.i PROPERTY CPLUSPLUS ON)
set_property(SOURCE app.i PROPERTY SWIG_MODULE_NAME ${SWIG_PROJECT_NAME})

swig_add_library(${SWIG_PROJECT_NAME}
        TYPE MODULE
        LANGUAGE python
        OUTPUT_DIR ${pyapp_project_dir}
        SOURCES app.i
        )

set_property(TARGET ${SWIG_PROJECT_NAME} PROPERTY SWIG_USE_TARGET_INCLUDE_DIRECTORIES ON)

target_include_directories(${SWIG_PROJECT_NAME}
        PRIVATE
        ${Python3_INCLUDE_DIRS}
        )

target_compile_options(${SWIG_PROJECT_NAME}
        PRIVATE
        -Wno-maybe-uninitialized
        -Wno-missing-field-initializers
        -Wno-unused-parameter
        )

target_link_options(${SWIG_PROJECT_NAME}
     PRIVATE
        --disable-shared
        $<$<BOOL:${WIN32}>:--static>
    )

target_link_libraries(${SWIG_PROJECT_NAME} 
        PUBLIC 
        simple_app::lib
        ${Python3_LIBRARIES}
        )

configure_file(
        ${CMAKE_CURRENT_LIST_DIR}/__init__.py.in
        ${pyapp_project_dir}/__init__.py
        @ONLY
)

configure_file(
        ${CMAKE_CURRENT_LIST_DIR}/setup.py.in
        ${CMAKE_CURRENT_BINARY_DIR}/setup.py.in
        @ONLY
)

file(GENERATE
        OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/setup.py
        INPUT ${CMAKE_CURRENT_BINARY_DIR}/setup.py.in
        )

file(GENERATE OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/_version.py CONTENT "__version__ = \"${PROJECT_VERSION}\"\n")

add_custom_command(TARGET ${SWIG_PROJECT_NAME}
        POST_BUILD
        WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
        COMMAND ${CMAKE_COMMAND} -E copy $<TARGET_FILE:${SWIG_PROJECT_NAME}> ${pyapp_project_dir}
        )

file(GLOB_RECURSE PYTHON_DEPENDS ${CMAKE_CURRENT_LIST_DIR}/*)
list(FILTER PYTHON_DEPENDS INCLUDE REGEX ^.+\\.py.*)

set(PYTHON_PACKAGE_STAMP "${CMAKE_CURRENT_BINARY_DIR}/python-package.stamp")
add_custom_command(
        OUTPUT ${PYTHON_PACKAGE_STAMP}
        DEPENDS ${SWIG_PROJECT_NAME} ${PYTHON_DEPENDS}
        COMMAND ${CMAKE_COMMAND} -E copy_directory ${CMAKE_CURRENT_LIST_DIR}/pyapp ${pyapp_project_dir}
        # COMMAND ${CMAKE_COMMAND} -E copy_directory ${CMAKE_CURRENT_LIST_DIR}/tests ${CMAKE_CURRENT_BINARY_DIR}/tests
        # COMMAND ${Python3_EXECUTABLE} -m pytest ${CMAKE_CURRENT_BINARY_DIR}
        COMMAND ${Python3_EXECUTABLE} -m build ${CMAKE_CURRENT_BINARY_DIR}
        COMMAND ${CMAKE_COMMAND} -E touch "${PYTHON_PACKAGE_STAMP}"
        USES_TERMINAL
)

add_custom_target(pyapp-build-python ALL
        DEPENDS ${PYTHON_PACKAGE_STAMP}
        )