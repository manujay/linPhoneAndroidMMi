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
CMAKE_BINARY_DIR = /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-arm64/cmake

# Utility rule file for EP_ortp.

# Include the progress variables for this target.
include CMakeFiles/EP_ortp.dir/progress.make

CMakeFiles/EP_ortp: CMakeFiles/EP_ortp-complete


CMakeFiles/EP_ortp-complete: /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-arm64/Stamp/EP_ortp/EP_ortp-install
CMakeFiles/EP_ortp-complete: /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-arm64/Stamp/EP_ortp/EP_ortp-mkdir
CMakeFiles/EP_ortp-complete: /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-arm64/Stamp/EP_ortp/EP_ortp-download
CMakeFiles/EP_ortp-complete: /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-arm64/Stamp/EP_ortp/EP_ortp-update
CMakeFiles/EP_ortp-complete: /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-arm64/Stamp/EP_ortp/EP_ortp-patch
CMakeFiles/EP_ortp-complete: /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-arm64/Stamp/EP_ortp/EP_ortp-configure
CMakeFiles/EP_ortp-complete: /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-arm64/Stamp/EP_ortp/EP_ortp-build
CMakeFiles/EP_ortp-complete: /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-arm64/Stamp/EP_ortp/EP_ortp-install
CMakeFiles/EP_ortp-complete: /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-arm64/Stamp/EP_ortp/EP_ortp-force_build
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-arm64/cmake/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Completed 'EP_ortp'"
	/Applications/CMake.app/Contents/bin/cmake -E make_directory /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-arm64/cmake/CMakeFiles
	/Applications/CMake.app/Contents/bin/cmake -E touch /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-arm64/cmake/CMakeFiles/EP_ortp-complete
	/Applications/CMake.app/Contents/bin/cmake -E touch /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-arm64//Stamp/EP_ortp/EP_ortp-done

/Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-arm64/Stamp/EP_ortp/EP_ortp-install: /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-arm64/Stamp/EP_ortp/EP_ortp-build
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-arm64/cmake/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Performing install step for 'EP_ortp'"
	cd /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-arm64/Build/ortp && $(MAKE) install
	cd /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-arm64/Build/ortp && /Applications/CMake.app/Contents/bin/cmake -E touch /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-arm64//Stamp/EP_ortp/EP_ortp-install

/Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-arm64/Stamp/EP_ortp/EP_ortp-mkdir:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-arm64/cmake/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Creating directories for 'EP_ortp'"
	/Applications/CMake.app/Contents/bin/cmake -E make_directory /Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/oRTP
	/Applications/CMake.app/Contents/bin/cmake -E make_directory /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-arm64/Build/ortp
	/Applications/CMake.app/Contents/bin/cmake -E make_directory /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-arm64//Install/EP_ortp
	/Applications/CMake.app/Contents/bin/cmake -E make_directory /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-arm64//tmp/EP_ortp
	/Applications/CMake.app/Contents/bin/cmake -E make_directory /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-arm64//Stamp/EP_ortp
	/Applications/CMake.app/Contents/bin/cmake -E make_directory /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-arm64//Download/EP_ortp
	/Applications/CMake.app/Contents/bin/cmake -E touch /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-arm64//Stamp/EP_ortp/EP_ortp-mkdir

/Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-arm64/Stamp/EP_ortp/EP_ortp-download: /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-arm64/Stamp/EP_ortp/EP_ortp-mkdir
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-arm64/cmake/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "No download step for 'EP_ortp'"
	/Applications/CMake.app/Contents/bin/cmake -E echo_append
	/Applications/CMake.app/Contents/bin/cmake -E touch /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-arm64//Stamp/EP_ortp/EP_ortp-download

/Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-arm64/Stamp/EP_ortp/EP_ortp-update: /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-arm64/Stamp/EP_ortp/EP_ortp-download
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-arm64/cmake/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "No update step for 'EP_ortp'"
	/Applications/CMake.app/Contents/bin/cmake -E echo_append
	/Applications/CMake.app/Contents/bin/cmake -E touch /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-arm64//Stamp/EP_ortp/EP_ortp-update

/Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-arm64/Stamp/EP_ortp/EP_ortp-patch: /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-arm64/Stamp/EP_ortp/EP_ortp-download
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-arm64/cmake/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "No patch step for 'EP_ortp'"
	/Applications/CMake.app/Contents/bin/cmake -E echo_append
	/Applications/CMake.app/Contents/bin/cmake -E touch /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-arm64//Stamp/EP_ortp/EP_ortp-patch

/Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-arm64/Stamp/EP_ortp/EP_ortp-configure: /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-arm64/Stamp/EP_bctoolbox/EP_bctoolbox-done
/Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-arm64/Stamp/EP_ortp/EP_ortp-configure: /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-arm64/tmp/EP_ortp/EP_ortp-cfgcmd.txt
/Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-arm64/Stamp/EP_ortp/EP_ortp-configure: /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-arm64/tmp/EP_ortp/EP_ortp-cache-RelWithDebInfo.cmake
/Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-arm64/Stamp/EP_ortp/EP_ortp-configure: /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-arm64/Stamp/EP_ortp/EP_ortp-update
/Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-arm64/Stamp/EP_ortp/EP_ortp-configure: /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-arm64/Stamp/EP_ortp/EP_ortp-patch
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-arm64/cmake/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Performing configure step for 'EP_ortp'"
	cd /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-arm64/Build/ortp && /Applications/CMake.app/Contents/bin/cmake -DENABLE_DOC=NO -DENABLE_STATIC=NO -DENABLE_SHARED=YES -C/Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-arm64//tmp/EP_ortp/EP_ortp-cache-RelWithDebInfo.cmake "-GUnix Makefiles" /Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/oRTP
	cd /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-arm64/Build/ortp && /Applications/CMake.app/Contents/bin/cmake -E touch /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-arm64//Stamp/EP_ortp/EP_ortp-configure

/Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-arm64/Stamp/EP_ortp/EP_ortp-build: /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-arm64/Stamp/EP_ortp/EP_ortp-configure
/Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-arm64/Stamp/EP_ortp/EP_ortp-build: /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-arm64/Stamp/EP_ortp/EP_ortp-force_build
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-arm64/cmake/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Performing build step for 'EP_ortp'"
	cd /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-arm64/Build/ortp && $(MAKE)
	cd /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-arm64/Build/ortp && /Applications/CMake.app/Contents/bin/cmake -E touch /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-arm64//Stamp/EP_ortp/EP_ortp-build

/Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-arm64/Stamp/EP_ortp/EP_ortp-force_build: /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-arm64/Stamp/EP_ortp/EP_ortp-configure
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-arm64/cmake/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Forcing build for 'EP_ortp'"
	/Applications/CMake.app/Contents/bin/cmake -E echo_append

EP_ortp: CMakeFiles/EP_ortp
EP_ortp: CMakeFiles/EP_ortp-complete
EP_ortp: /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-arm64/Stamp/EP_ortp/EP_ortp-install
EP_ortp: /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-arm64/Stamp/EP_ortp/EP_ortp-mkdir
EP_ortp: /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-arm64/Stamp/EP_ortp/EP_ortp-download
EP_ortp: /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-arm64/Stamp/EP_ortp/EP_ortp-update
EP_ortp: /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-arm64/Stamp/EP_ortp/EP_ortp-patch
EP_ortp: /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-arm64/Stamp/EP_ortp/EP_ortp-configure
EP_ortp: /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-arm64/Stamp/EP_ortp/EP_ortp-build
EP_ortp: /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-arm64/Stamp/EP_ortp/EP_ortp-force_build
EP_ortp: CMakeFiles/EP_ortp.dir/build.make

.PHONY : EP_ortp

# Rule to build all files generated by this target.
CMakeFiles/EP_ortp.dir/build: EP_ortp

.PHONY : CMakeFiles/EP_ortp.dir/build

CMakeFiles/EP_ortp.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/EP_ortp.dir/cmake_clean.cmake
.PHONY : CMakeFiles/EP_ortp.dir/clean

CMakeFiles/EP_ortp.dir/depend:
	cd /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-arm64/cmake && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/cmake-builder /Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/cmake-builder /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-arm64/cmake /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-arm64/cmake /Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-arm64/cmake/CMakeFiles/EP_ortp.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/EP_ortp.dir/depend

