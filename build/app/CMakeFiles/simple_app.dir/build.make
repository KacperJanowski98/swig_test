# CMAKE generated file: DO NOT EDIT!
# Generated by "MinGW Makefiles" Generator, CMake Version 3.24

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

SHELL = cmd.exe

# The CMake executable.
CMAKE_COMMAND = C:\CMake\cmake-3.24.0-x86_64\bin\cmake.exe

# The command to remove a file.
RM = C:\CMake\cmake-3.24.0-x86_64\bin\cmake.exe -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = D:\Projekty\SWIG_template\simple

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = D:\Projekty\SWIG_template\simple\build

# Include any dependencies generated for this target.
include app/CMakeFiles/simple_app.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include app/CMakeFiles/simple_app.dir/compiler_depend.make

# Include the progress variables for this target.
include app/CMakeFiles/simple_app.dir/progress.make

# Include the compile flags for this target's objects.
include app/CMakeFiles/simple_app.dir/flags.make

app/CMakeFiles/simple_app.dir/src/app_c.cpp.obj: app/CMakeFiles/simple_app.dir/flags.make
app/CMakeFiles/simple_app.dir/src/app_c.cpp.obj: app/CMakeFiles/simple_app.dir/includes_CXX.rsp
app/CMakeFiles/simple_app.dir/src/app_c.cpp.obj: D:/Projekty/SWIG_template/simple/app/src/app_c.cpp
app/CMakeFiles/simple_app.dir/src/app_c.cpp.obj: app/CMakeFiles/simple_app.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=D:\Projekty\SWIG_template\simple\build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object app/CMakeFiles/simple_app.dir/src/app_c.cpp.obj"
	cd /d D:\Projekty\SWIG_template\simple\build\app && C:\Qt\Tools\mingw810_64\bin\c++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT app/CMakeFiles/simple_app.dir/src/app_c.cpp.obj -MF CMakeFiles\simple_app.dir\src\app_c.cpp.obj.d -o CMakeFiles\simple_app.dir\src\app_c.cpp.obj -c D:\Projekty\SWIG_template\simple\app\src\app_c.cpp

app/CMakeFiles/simple_app.dir/src/app_c.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/simple_app.dir/src/app_c.cpp.i"
	cd /d D:\Projekty\SWIG_template\simple\build\app && C:\Qt\Tools\mingw810_64\bin\c++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E D:\Projekty\SWIG_template\simple\app\src\app_c.cpp > CMakeFiles\simple_app.dir\src\app_c.cpp.i

app/CMakeFiles/simple_app.dir/src/app_c.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/simple_app.dir/src/app_c.cpp.s"
	cd /d D:\Projekty\SWIG_template\simple\build\app && C:\Qt\Tools\mingw810_64\bin\c++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S D:\Projekty\SWIG_template\simple\app\src\app_c.cpp -o CMakeFiles\simple_app.dir\src\app_c.cpp.s

# Object files for target simple_app
simple_app_OBJECTS = \
"CMakeFiles/simple_app.dir/src/app_c.cpp.obj"

# External object files for target simple_app
simple_app_EXTERNAL_OBJECTS =

app/libsimple_app.a: app/CMakeFiles/simple_app.dir/src/app_c.cpp.obj
app/libsimple_app.a: app/CMakeFiles/simple_app.dir/build.make
app/libsimple_app.a: app/CMakeFiles/simple_app.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=D:\Projekty\SWIG_template\simple\build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX static library libsimple_app.a"
	cd /d D:\Projekty\SWIG_template\simple\build\app && $(CMAKE_COMMAND) -P CMakeFiles\simple_app.dir\cmake_clean_target.cmake
	cd /d D:\Projekty\SWIG_template\simple\build\app && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles\simple_app.dir\link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
app/CMakeFiles/simple_app.dir/build: app/libsimple_app.a
.PHONY : app/CMakeFiles/simple_app.dir/build

app/CMakeFiles/simple_app.dir/clean:
	cd /d D:\Projekty\SWIG_template\simple\build\app && $(CMAKE_COMMAND) -P CMakeFiles\simple_app.dir\cmake_clean.cmake
.PHONY : app/CMakeFiles/simple_app.dir/clean

app/CMakeFiles/simple_app.dir/depend:
	$(CMAKE_COMMAND) -E cmake_depends "MinGW Makefiles" D:\Projekty\SWIG_template\simple D:\Projekty\SWIG_template\simple\app D:\Projekty\SWIG_template\simple\build D:\Projekty\SWIG_template\simple\build\app D:\Projekty\SWIG_template\simple\build\app\CMakeFiles\simple_app.dir\DependInfo.cmake --color=$(COLOR)
.PHONY : app/CMakeFiles/simple_app.dir/depend

