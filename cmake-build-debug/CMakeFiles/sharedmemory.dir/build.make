# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.6

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /Applications/CLion.app/Contents/bin/cmake/bin/cmake

# The command to remove a file.
RM = /Applications/CLion.app/Contents/bin/cmake/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/wangruoxuan/ClionProjects/unixIPC

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/wangruoxuan/ClionProjects/unixIPC/cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/sharedmemory.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/sharedmemory.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/sharedmemory.dir/flags.make

CMakeFiles/sharedmemory.dir/sharedmemory.cpp.o: CMakeFiles/sharedmemory.dir/flags.make
CMakeFiles/sharedmemory.dir/sharedmemory.cpp.o: ../sharedmemory.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/wangruoxuan/ClionProjects/unixIPC/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/sharedmemory.dir/sharedmemory.cpp.o"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/sharedmemory.dir/sharedmemory.cpp.o -c /Users/wangruoxuan/ClionProjects/unixIPC/sharedmemory.cpp

CMakeFiles/sharedmemory.dir/sharedmemory.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/sharedmemory.dir/sharedmemory.cpp.i"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/wangruoxuan/ClionProjects/unixIPC/sharedmemory.cpp > CMakeFiles/sharedmemory.dir/sharedmemory.cpp.i

CMakeFiles/sharedmemory.dir/sharedmemory.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/sharedmemory.dir/sharedmemory.cpp.s"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/wangruoxuan/ClionProjects/unixIPC/sharedmemory.cpp -o CMakeFiles/sharedmemory.dir/sharedmemory.cpp.s

CMakeFiles/sharedmemory.dir/sharedmemory.cpp.o.requires:

.PHONY : CMakeFiles/sharedmemory.dir/sharedmemory.cpp.o.requires

CMakeFiles/sharedmemory.dir/sharedmemory.cpp.o.provides: CMakeFiles/sharedmemory.dir/sharedmemory.cpp.o.requires
	$(MAKE) -f CMakeFiles/sharedmemory.dir/build.make CMakeFiles/sharedmemory.dir/sharedmemory.cpp.o.provides.build
.PHONY : CMakeFiles/sharedmemory.dir/sharedmemory.cpp.o.provides

CMakeFiles/sharedmemory.dir/sharedmemory.cpp.o.provides.build: CMakeFiles/sharedmemory.dir/sharedmemory.cpp.o


# Object files for target sharedmemory
sharedmemory_OBJECTS = \
"CMakeFiles/sharedmemory.dir/sharedmemory.cpp.o"

# External object files for target sharedmemory
sharedmemory_EXTERNAL_OBJECTS =

sharedmemory: CMakeFiles/sharedmemory.dir/sharedmemory.cpp.o
sharedmemory: CMakeFiles/sharedmemory.dir/build.make
sharedmemory: CMakeFiles/sharedmemory.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/wangruoxuan/ClionProjects/unixIPC/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable sharedmemory"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/sharedmemory.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/sharedmemory.dir/build: sharedmemory

.PHONY : CMakeFiles/sharedmemory.dir/build

CMakeFiles/sharedmemory.dir/requires: CMakeFiles/sharedmemory.dir/sharedmemory.cpp.o.requires

.PHONY : CMakeFiles/sharedmemory.dir/requires

CMakeFiles/sharedmemory.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/sharedmemory.dir/cmake_clean.cmake
.PHONY : CMakeFiles/sharedmemory.dir/clean

CMakeFiles/sharedmemory.dir/depend:
	cd /Users/wangruoxuan/ClionProjects/unixIPC/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/wangruoxuan/ClionProjects/unixIPC /Users/wangruoxuan/ClionProjects/unixIPC /Users/wangruoxuan/ClionProjects/unixIPC/cmake-build-debug /Users/wangruoxuan/ClionProjects/unixIPC/cmake-build-debug /Users/wangruoxuan/ClionProjects/unixIPC/cmake-build-debug/CMakeFiles/sharedmemory.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/sharedmemory.dir/depend

