# Install script for directory: /Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/belcard/include

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/liblinphone-sdk/android-arm64")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "RelWithDebInfo")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "0")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/belcard" TYPE FILE MESSAGE_LAZY PERMISSIONS OWNER_READ OWNER_WRITE GROUP_READ WORLD_READ FILES
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/belcard/include/belcard/belcard_addressing.hpp"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/belcard/include/belcard/belcard_communication.hpp"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/belcard/include/belcard/belcard_general.hpp"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/belcard/include/belcard/belcard_geographical.hpp"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/belcard/include/belcard/belcard_identification.hpp"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/belcard/include/belcard/belcard_params.hpp"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/belcard/include/belcard/belcard_property.hpp"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/belcard/include/belcard/belcard_security.hpp"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/belcard/include/belcard/belcard_calendar.hpp"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/belcard/include/belcard/belcard_explanatory.hpp"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/belcard/include/belcard/belcard_generic.hpp"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/belcard/include/belcard/belcard.hpp"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/belcard/include/belcard/belcard_organizational.hpp"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/belcard/include/belcard/belcard_parser.hpp"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/belcard/include/belcard/belcard_rfc6474.hpp"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/belcard/include/belcard/belcard_utils.hpp"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/belcard/include/belcard/vcard_grammar.hpp"
    )
endif()

