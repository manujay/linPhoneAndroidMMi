# Install script for directory: /Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/externals/libxml2

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/liblinphone-sdk/android-x86")
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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY MESSAGE_LAZY PERMISSIONS OWNER_READ OWNER_WRITE OWNER_EXECUTE GROUP_READ GROUP_EXECUTE WORLD_READ WORLD_EXECUTE FILES "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86/Build/xml2/libxml2.a")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/libxml2/libxml" TYPE FILE MESSAGE_LAZY PERMISSIONS OWNER_READ OWNER_WRITE GROUP_READ WORLD_READ FILES
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/externals/libxml2/include/libxml/DOCBparser.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/externals/libxml2/include/libxml/HTMLparser.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/externals/libxml2/include/libxml/HTMLtree.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/externals/libxml2/include/libxml/SAX.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/externals/libxml2/include/libxml/SAX2.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/externals/libxml2/include/libxml/c14n.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/externals/libxml2/include/libxml/catalog.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/externals/libxml2/include/libxml/chvalid.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/externals/libxml2/include/libxml/debugXML.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/externals/libxml2/include/libxml/dict.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/externals/libxml2/include/libxml/encoding.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/externals/libxml2/include/libxml/entities.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/externals/libxml2/include/libxml/globals.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/externals/libxml2/include/libxml/hash.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/externals/libxml2/include/libxml/list.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/externals/libxml2/include/libxml/nanoftp.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/externals/libxml2/include/libxml/nanohttp.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/externals/libxml2/include/libxml/parser.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/externals/libxml2/include/libxml/parserInternals.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/externals/libxml2/include/libxml/pattern.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/externals/libxml2/include/libxml/relaxng.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/externals/libxml2/include/libxml/schemasInternals.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/externals/libxml2/include/libxml/schematron.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/externals/libxml2/include/libxml/threads.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/externals/libxml2/include/libxml/tree.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/externals/libxml2/include/libxml/uri.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/externals/libxml2/include/libxml/valid.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/externals/libxml2/include/libxml/xinclude.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/externals/libxml2/include/libxml/xlink.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/externals/libxml2/include/libxml/xmlIO.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/externals/libxml2/include/libxml/xmlautomata.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/externals/libxml2/include/libxml/xmlerror.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/externals/libxml2/include/libxml/xmlexports.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/externals/libxml2/include/libxml/xmlmemory.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/externals/libxml2/include/libxml/xmlmodule.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/externals/libxml2/include/libxml/xmlreader.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/externals/libxml2/include/libxml/xmlregexp.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/externals/libxml2/include/libxml/xmlsave.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/externals/libxml2/include/libxml/xmlschemas.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/externals/libxml2/include/libxml/xmlschemastypes.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/externals/libxml2/include/libxml/xmlstring.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/externals/libxml2/include/libxml/xmlunicode.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/externals/libxml2/include/libxml/xmlwin32version.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/externals/libxml2/include/libxml/xmlwriter.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/externals/libxml2/include/libxml/xpath.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/externals/libxml2/include/libxml/xpathInternals.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/externals/libxml2/include/libxml/xpointer.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86/Build/xml2/libxml/xmlversion.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86/Build/xml2/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
