# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.7

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
CMAKE_COMMAND = /Applications/CMake.app/Contents/bin/cmake

# The command to remove a file.
RM = /Applications/CMake.app/Contents/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/cmake-builder

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86/cmake

# Utility rule file for EP_sqlite3.

# Include the progress variables for this target.
include CMakeFiles/EP_sqlite3.dir/progress.make

CMakeFiles/EP_sqlite3: CMakeFiles/EP_sqlite3-complete


CMakeFiles/EP_sqlite3-complete: /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86/Stamp/EP_sqlite3/EP_sqlite3-install
CMakeFiles/EP_sqlite3-complete: /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86/Stamp/EP_sqlite3/EP_sqlite3-mkdir
CMakeFiles/EP_sqlite3-complete: /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86/Stamp/EP_sqlite3/EP_sqlite3-download
CMakeFiles/EP_sqlite3-complete: /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86/Stamp/EP_sqlite3/EP_sqlite3-update
CMakeFiles/EP_sqlite3-complete: /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86/Stamp/EP_sqlite3/EP_sqlite3-patch
CMakeFiles/EP_sqlite3-complete: /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86/Stamp/EP_sqlite3/EP_sqlite3-configure
CMakeFiles/EP_sqlite3-complete: /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86/Stamp/EP_sqlite3/EP_sqlite3-build
CMakeFiles/EP_sqlite3-complete: /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86/Stamp/EP_sqlite3/EP_sqlite3-install
CMakeFiles/EP_sqlite3-complete: /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86/Stamp/EP_sqlite3/EP_sqlite3-force_build
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86/cmake/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Completed 'EP_sqlite3'"
	/Applications/CMake.app/Contents/bin/cmake -E make_directory /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86/cmake/CMakeFiles
	/Applications/CMake.app/Contents/bin/cmake -E touch /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86/cmake/CMakeFiles/EP_sqlite3-complete
	/Applications/CMake.app/Contents/bin/cmake -E touch /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86//Stamp/EP_sqlite3/EP_sqlite3-done

/Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86/Stamp/EP_sqlite3/EP_sqlite3-install: /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86/Stamp/EP_sqlite3/EP_sqlite3-build
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86/cmake/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Performing install step for 'EP_sqlite3'"
	cd /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86/Build/sqlite3 && $(MAKE) install
	cd /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86/Build/sqlite3 && /Applications/CMake.app/Contents/bin/cmake -E touch /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86//Stamp/EP_sqlite3/EP_sqlite3-install

/Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86/Stamp/EP_sqlite3/EP_sqlite3-mkdir:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86/cmake/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Creating directories for 'EP_sqlite3'"
	/Applications/CMake.app/Contents/bin/cmake -E make_directory /Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/externals/sqlite3
	/Applications/CMake.app/Contents/bin/cmake -E make_directory /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86/Build/sqlite3
	/Applications/CMake.app/Contents/bin/cmake -E make_directory /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86//Install/EP_sqlite3
	/Applications/CMake.app/Contents/bin/cmake -E make_directory /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86//tmp/EP_sqlite3
	/Applications/CMake.app/Contents/bin/cmake -E make_directory /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86//Stamp/EP_sqlite3
	/Applications/CMake.app/Contents/bin/cmake -E make_directory /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86//Download/EP_sqlite3
	/Applications/CMake.app/Contents/bin/cmake -E touch /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86//Stamp/EP_sqlite3/EP_sqlite3-mkdir

/Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86/Stamp/EP_sqlite3/EP_sqlite3-download: /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86/Stamp/EP_sqlite3/EP_sqlite3-mkdir
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86/cmake/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "No download step for 'EP_sqlite3'"
	/Applications/CMake.app/Contents/bin/cmake -E echo_append
	/Applications/CMake.app/Contents/bin/cmake -E touch /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86//Stamp/EP_sqlite3/EP_sqlite3-download

/Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86/Stamp/EP_sqlite3/EP_sqlite3-update: /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86/Stamp/EP_sqlite3/EP_sqlite3-download
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86/cmake/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "No update step for 'EP_sqlite3'"
	/Applications/CMake.app/Contents/bin/cmake -E echo_append
	/Applications/CMake.app/Contents/bin/cmake -E touch /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86//Stamp/EP_sqlite3/EP_sqlite3-update

/Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86/Stamp/EP_sqlite3/EP_sqlite3-patch: /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86/Stamp/EP_sqlite3/EP_sqlite3-download
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86/cmake/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Performing patch step for 'EP_sqlite3'"
	cd /Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/externals/sqlite3 && /Applications/CMake.app/Contents/bin/cmake -E copy /Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/cmake-builder/builders/sqlite3/CMakeLists.txt /Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/externals/sqlite3
	cd /Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/externals/sqlite3 && /Applications/CMake.app/Contents/bin/cmake -E touch /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86//Stamp/EP_sqlite3/EP_sqlite3-patch

/Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86/Stamp/EP_sqlite3/EP_sqlite3-configure: /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86/tmp/EP_sqlite3/EP_sqlite3-cfgcmd.txt
/Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86/Stamp/EP_sqlite3/EP_sqlite3-configure: /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86/tmp/EP_sqlite3/EP_sqlite3-cache-RelWithDebInfo.cmake
/Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86/Stamp/EP_sqlite3/EP_sqlite3-configure: /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86/Stamp/EP_sqlite3/EP_sqlite3-update
/Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86/Stamp/EP_sqlite3/EP_sqlite3-configure: /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86/Stamp/EP_sqlite3/EP_sqlite3-patch
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86/cmake/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Performing configure step for 'EP_sqlite3'"
	cd /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86/Build/sqlite3 && /Applications/CMake.app/Contents/bin/cmake -DENABLE_STATIC=YES -DENABLE_SHARED=NO -C/Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86//tmp/EP_sqlite3/EP_sqlite3-cache-RelWithDebInfo.cmake "-GUnix Makefiles" /Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/externals/sqlite3
	cd /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86/Build/sqlite3 && /Applications/CMake.app/Contents/bin/cmake -E touch /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86//Stamp/EP_sqlite3/EP_sqlite3-configure

/Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86/Stamp/EP_sqlite3/EP_sqlite3-build: /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86/Stamp/EP_sqlite3/EP_sqlite3-configure
/Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86/Stamp/EP_sqlite3/EP_sqlite3-build: /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86/Stamp/EP_sqlite3/EP_sqlite3-force_build
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86/cmake/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Performing build step for 'EP_sqlite3'"
	cd /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86/Build/sqlite3 && $(MAKE)
	cd /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86/Build/sqlite3 && /Applications/CMake.app/Contents/bin/cmake -E touch /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86//Stamp/EP_sqlite3/EP_sqlite3-build

/Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86/Stamp/EP_sqlite3/EP_sqlite3-force_build: /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86/Stamp/EP_sqlite3/EP_sqlite3-configure
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86/cmake/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Forcing build for 'EP_sqlite3'"
	/Applications/CMake.app/Contents/bin/cmake -E echo_append

EP_sqlite3: CMakeFiles/EP_sqlite3
EP_sqlite3: CMakeFiles/EP_sqlite3-complete
EP_sqlite3: /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86/Stamp/EP_sqlite3/EP_sqlite3-install
EP_sqlite3: /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86/Stamp/EP_sqlite3/EP_sqlite3-mkdir
EP_sqlite3: /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86/Stamp/EP_sqlite3/EP_sqlite3-download
EP_sqlite3: /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86/Stamp/EP_sqlite3/EP_sqlite3-update
EP_sqlite3: /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86/Stamp/EP_sqlite3/EP_sqlite3-patch
EP_sqlite3: /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86/Stamp/EP_sqlite3/EP_sqlite3-configure
EP_sqlite3: /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86/Stamp/EP_sqlite3/EP_sqlite3-build
EP_sqlite3: /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86/Stamp/EP_sqlite3/EP_sqlite3-force_build
EP_sqlite3: CMakeFiles/EP_sqlite3.dir/build.make

.PHONY : EP_sqlite3

# Rule to build all files generated by this target.
CMakeFiles/EP_sqlite3.dir/build: EP_sqlite3

.PHONY : CMakeFiles/EP_sqlite3.dir/build

CMakeFiles/EP_sqlite3.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/EP_sqlite3.dir/cmake_clean.cmake
.PHONY : CMakeFiles/EP_sqlite3.dir/clean

CMakeFiles/EP_sqlite3.dir/depend:
	cd /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86/cmake && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/cmake-builder /Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/cmake-builder /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86/cmake /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86/cmake /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86/cmake/CMakeFiles/EP_sqlite3.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/EP_sqlite3.dir/depend
