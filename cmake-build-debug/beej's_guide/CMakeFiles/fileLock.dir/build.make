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
include beej's_guide/CMakeFiles/fileLock.dir/depend.make

# Include the progress variables for this target.
include beej's_guide/CMakeFiles/fileLock.dir/progress.make

# Include the compile flags for this target's objects.
include beej's_guide/CMakeFiles/fileLock.dir/flags.make

beej's_guide/CMakeFiles/fileLock.dir/fileLock.cpp.o: beej's_guide/CMakeFiles/fileLock.dir/flags.make
beej's_guide/CMakeFiles/fileLock.dir/fileLock.cpp.o: ../beej's_guide/fileLock.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/wangruoxuan/ClionProjects/unixIPC/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object beej's_guide/CMakeFiles/fileLock.dir/fileLock.cpp.o"
	cd "/Users/wangruoxuan/ClionProjects/unixIPC/cmake-build-debug/beej's_guide" && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/fileLock.dir/fileLock.cpp.o -c "/Users/wangruoxuan/ClionProjects/unixIPC/beej's_guide/fileLock.cpp"

beej's_guide/CMakeFiles/fileLock.dir/fileLock.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/fileLock.dir/fileLock.cpp.i"
	cd "/Users/wangruoxuan/ClionProjects/unixIPC/cmake-build-debug/beej's_guide" && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E "/Users/wangruoxuan/ClionProjects/unixIPC/beej's_guide/fileLock.cpp" > CMakeFiles/fileLock.dir/fileLock.cpp.i

beej's_guide/CMakeFiles/fileLock.dir/fileLock.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/fileLock.dir/fileLock.cpp.s"
	cd "/Users/wangruoxuan/ClionProjects/unixIPC/cmake-build-debug/beej's_guide" && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S "/Users/wangruoxuan/ClionProjects/unixIPC/beej's_guide/fileLock.cpp" -o CMakeFiles/fileLock.dir/fileLock.cpp.s

beej's_guide/CMakeFiles/fileLock.dir/fileLock.cpp.o.requires:

.PHONY : beej's_guide/CMakeFiles/fileLock.dir/fileLock.cpp.o.requires

beej's_guide/CMakeFiles/fileLock.dir/fileLock.cpp.o.provides: beej's_guide/CMakeFiles/fileLock.dir/fileLock.cpp.o.requires
	$(MAKE) -f "beej's_guide/CMakeFiles/fileLock.dir/build.make" "beej's_guide/CMakeFiles/fileLock.dir/fileLock.cpp.o.provides.build"
.PHONY : beej's_guide/CMakeFiles/fileLock.dir/fileLock.cpp.o.provides

beej's_guide/CMakeFiles/fileLock.dir/fileLock.cpp.o.provides.build: beej's_guide/CMakeFiles/fileLock.dir/fileLock.cpp.o


# Object files for target fileLock
fileLock_OBJECTS = \
"CMakeFiles/fileLock.dir/fileLock.cpp.o"

# External object files for target fileLock
fileLock_EXTERNAL_OBJECTS =

beej's_guide/fileLock: beej's_guide/CMakeFiles/fileLock.dir/fileLock.cpp.o
beej's_guide/fileLock: beej's_guide/CMakeFiles/fileLock.dir/build.make
beej's_guide/fileLock: beej's_guide/CMakeFiles/fileLock.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/wangruoxuan/ClionProjects/unixIPC/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable fileLock"
	cd "/Users/wangruoxuan/ClionProjects/unixIPC/cmake-build-debug/beej's_guide" && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/fileLock.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
beej's_guide/CMakeFiles/fileLock.dir/build: beej's_guide/fileLock

.PHONY : beej's_guide/CMakeFiles/fileLock.dir/build

beej's_guide/CMakeFiles/fileLock.dir/requires: beej's_guide/CMakeFiles/fileLock.dir/fileLock.cpp.o.requires

.PHONY : beej's_guide/CMakeFiles/fileLock.dir/requires

beej's_guide/CMakeFiles/fileLock.dir/clean:
	cd "/Users/wangruoxuan/ClionProjects/unixIPC/cmake-build-debug/beej's_guide" && $(CMAKE_COMMAND) -P CMakeFiles/fileLock.dir/cmake_clean.cmake
.PHONY : beej's_guide/CMakeFiles/fileLock.dir/clean

beej's_guide/CMakeFiles/fileLock.dir/depend:
	cd /Users/wangruoxuan/ClionProjects/unixIPC/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/wangruoxuan/ClionProjects/unixIPC "/Users/wangruoxuan/ClionProjects/unixIPC/beej's_guide" /Users/wangruoxuan/ClionProjects/unixIPC/cmake-build-debug "/Users/wangruoxuan/ClionProjects/unixIPC/cmake-build-debug/beej's_guide" "/Users/wangruoxuan/ClionProjects/unixIPC/cmake-build-debug/beej's_guide/CMakeFiles/fileLock.dir/DependInfo.cmake" --color=$(COLOR)
.PHONY : beej's_guide/CMakeFiles/fileLock.dir/depend

