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

# Utility rule file for EP_gsm.

# Include the progress variables for this target.
include CMakeFiles/EP_gsm.dir/progress.make

CMakeFiles/EP_gsm: CMakeFiles/EP_gsm-complete


CMakeFiles/EP_gsm-complete: /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86/Stamp/EP_gsm/EP_gsm-install
CMakeFiles/EP_gsm-complete: /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86/Stamp/EP_gsm/EP_gsm-mkdir
CMakeFiles/EP_gsm-complete: /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86/Stamp/EP_gsm/EP_gsm-download
CMakeFiles/EP_gsm-complete: /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86/Stamp/EP_gsm/EP_gsm-update
CMakeFiles/EP_gsm-complete: /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86/Stamp/EP_gsm/EP_gsm-patch
CMakeFiles/EP_gsm-complete: /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86/Stamp/EP_gsm/EP_gsm-configure
CMakeFiles/EP_gsm-complete: /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86/Stamp/EP_gsm/EP_gsm-build
CMakeFiles/EP_gsm-complete: /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86/Stamp/EP_gsm/EP_gsm-install
CMakeFiles/EP_gsm-complete: /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86/Stamp/EP_gsm/EP_gsm-force_build
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86/cmake/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Completed 'EP_gsm'"
	/Applications/CMake.app/Contents/bin/cmake -E make_directory /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86/cmake/CMakeFiles
	/Applications/CMake.app/Contents/bin/cmake -E touch /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86/cmake/CMakeFiles/EP_gsm-complete
	/Applications/CMake.app/Contents/bin/cmake -E touch /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86//Stamp/EP_gsm/EP_gsm-done

/Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86/Stamp/EP_gsm/EP_gsm-install: /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86/Stamp/EP_gsm/EP_gsm-build
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86/cmake/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Performing install step for 'EP_gsm'"
	cd /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86/Build/gsm && $(MAKE) install
	cd /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86/Build/gsm && /Applications/CMake.app/Contents/bin/cmake -E touch /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86//Stamp/EP_gsm/EP_gsm-install

/Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86/Stamp/EP_gsm/EP_gsm-mkdir:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86/cmake/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Creating directories for 'EP_gsm'"
	/Applications/CMake.app/Contents/bin/cmake -E make_directory /Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/externals/gsm
	/Applications/CMake.app/Contents/bin/cmake -E make_directory /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86/Build/gsm
	/Applications/CMake.app/Contents/bin/cmake -E make_directory /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86//Install/EP_gsm
	/Applications/CMake.app/Contents/bin/cmake -E make_directory /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86//tmp/EP_gsm
	/Applications/CMake.app/Contents/bin/cmake -E make_directory /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86//Stamp/EP_gsm
	/Applications/CMake.app/Contents/bin/cmake -E make_directory /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86//Download/EP_gsm
	/Applications/CMake.app/Contents/bin/cmake -E touch /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86//Stamp/EP_gsm/EP_gsm-mkdir

/Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86/Stamp/EP_gsm/EP_gsm-download: /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86/Stamp/EP_gsm/EP_gsm-mkdir
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86/cmake/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "No download step for 'EP_gsm'"
	/Applications/CMake.app/Contents/bin/cmake -E echo_append
	/Applications/CMake.app/Contents/bin/cmake -E touch /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86//Stamp/EP_gsm/EP_gsm-download

/Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86/Stamp/EP_gsm/EP_gsm-update: /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86/Stamp/EP_gsm/EP_gsm-download
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86/cmake/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "No update step for 'EP_gsm'"
	/Applications/CMake.app/Contents/bin/cmake -E echo_append
	/Applications/CMake.app/Contents/bin/cmake -E touch /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86//Stamp/EP_gsm/EP_gsm-update

/Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86/Stamp/EP_gsm/EP_gsm-patch: /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86/Stamp/EP_gsm/EP_gsm-download
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86/cmake/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "No patch step for 'EP_gsm'"
	/Applications/CMake.app/Contents/bin/cmake -E echo_append
	/Applications/CMake.app/Contents/bin/cmake -E touch /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86//Stamp/EP_gsm/EP_gsm-patch

/Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86/Stamp/EP_gsm/EP_gsm-configure: /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86/tmp/EP_gsm/EP_gsm-cfgcmd.txt
/Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86/Stamp/EP_gsm/EP_gsm-configure: /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86/tmp/EP_gsm/EP_gsm-cache-RelWithDebInfo.cmake
/Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86/Stamp/EP_gsm/EP_gsm-configure: /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86/Stamp/EP_gsm/EP_gsm-update
/Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86/Stamp/EP_gsm/EP_gsm-configure: /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86/Stamp/EP_gsm/EP_gsm-patch
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86/cmake/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Performing configure step for 'EP_gsm'"
	cd /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86/Build/gsm && /Applications/CMake.app/Contents/bin/cmake -DENABLE_STATIC=YES -DENABLE_SHARED=NO -C/Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86//tmp/EP_gsm/EP_gsm-cache-RelWithDebInfo.cmake "-GUnix Makefiles" /Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/externals/gsm
	cd /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86/Build/gsm && /Applications/CMake.app/Contents/bin/cmake -E touch /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86//Stamp/EP_gsm/EP_gsm-configure

/Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86/Stamp/EP_gsm/EP_gsm-build: /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86/Stamp/EP_gsm/EP_gsm-configure
/Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86/Stamp/EP_gsm/EP_gsm-build: /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86/Stamp/EP_gsm/EP_gsm-force_build
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86/cmake/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Performing build step for 'EP_gsm'"
	cd /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86/Build/gsm && $(MAKE)
	cd /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86/Build/gsm && /Applications/CMake.app/Contents/bin/cmake -E touch /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86//Stamp/EP_gsm/EP_gsm-build

/Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86/Stamp/EP_gsm/EP_gsm-force_build: /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86/Stamp/EP_gsm/EP_gsm-configure
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86/cmake/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Forcing build for 'EP_gsm'"
	/Applications/CMake.app/Contents/bin/cmake -E echo_append

EP_gsm: CMakeFiles/EP_gsm
EP_gsm: CMakeFiles/EP_gsm-complete
EP_gsm: /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86/Stamp/EP_gsm/EP_gsm-install
EP_gsm: /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86/Stamp/EP_gsm/EP_gsm-mkdir
EP_gsm: /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86/Stamp/EP_gsm/EP_gsm-download
EP_gsm: /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86/Stamp/EP_gsm/EP_gsm-update
EP_gsm: /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86/Stamp/EP_gsm/EP_gsm-patch
EP_gsm: /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86/Stamp/EP_gsm/EP_gsm-configure
EP_gsm: /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86/Stamp/EP_gsm/EP_gsm-build
EP_gsm: /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86/Stamp/EP_gsm/EP_gsm-force_build
EP_gsm: CMakeFiles/EP_gsm.dir/build.make

.PHONY : EP_gsm

# Rule to build all files generated by this target.
CMakeFiles/EP_gsm.dir/build: EP_gsm

.PHONY : CMakeFiles/EP_gsm.dir/build

CMakeFiles/EP_gsm.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/EP_gsm.dir/cmake_clean.cmake
.PHONY : CMakeFiles/EP_gsm.dir/clean

CMakeFiles/EP_gsm.dir/depend:
	cd /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86/cmake && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/cmake-builder /Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/cmake-builder /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86/cmake /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86/cmake /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86/cmake/CMakeFiles/EP_gsm.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/EP_gsm.dir/depend
