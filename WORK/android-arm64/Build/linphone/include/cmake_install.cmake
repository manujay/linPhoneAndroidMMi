# Install script for directory: /Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/linphone/include

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/linphone" TYPE FILE MESSAGE_LAZY PERMISSIONS OWNER_READ OWNER_WRITE GROUP_READ WORLD_READ FILES
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/linphone/include/linphone/account_creator.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/linphone/include/linphone/account_creator_service.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/linphone/include/linphone/address.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/linphone/include/linphone/auth_info.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/linphone/include/linphone/buffer.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/linphone/include/linphone/call.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/linphone/include/linphone/callbacks.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/linphone/include/linphone/call_log.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/linphone/include/linphone/call_params.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/linphone/include/linphone/call_stats.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/linphone/include/linphone/chat.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/linphone/include/linphone/conference.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/linphone/include/linphone/contactprovider.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/linphone/include/linphone/content.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/linphone/include/linphone/core.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/linphone/include/linphone/core_utils.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/linphone/include/linphone/defs.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/linphone/include/linphone/dictionary.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/linphone/include/linphone/error_info.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/linphone/include/linphone/event.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/linphone/include/linphone/factory.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/linphone/include/linphone/friend.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/linphone/include/linphone/friendlist.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/linphone/include/linphone/im_encryption_engine.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/linphone/include/linphone/im_notif_policy.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/linphone/include/linphone/info_message.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/linphone/include/linphone/ldapprovider.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/linphone/include/linphone/logging.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/linphone/include/linphone/lpconfig.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/linphone/include/linphone/misc.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/linphone/include/linphone/nat_policy.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/linphone/include/linphone/payload_type.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/linphone/include/linphone/player.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/linphone/include/linphone/presence.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/linphone/include/linphone/proxy_config.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/linphone/include/linphone/ringtoneplayer.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/linphone/include/linphone/sipsetup.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/linphone/include/linphone/tunnel.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/linphone/include/linphone/types.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/linphone/include/linphone/vcard.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/linphone/include/linphone/video_definition.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/linphone/include/linphone/wrapper_utils.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/linphone/include/linphone/xmlrpc.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/linphone/include/linphone/headers.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/linphone/include/linphone/linphonecore.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/linphone/include/linphone/linphonecore_utils.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/linphone/include/linphone/linphonefriend.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/linphone/include/linphone/linphonepresence.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/linphone/include/linphone/linphone_proxy_config.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/linphone/include/linphone/linphone_tunnel.h"
    )
endif()

