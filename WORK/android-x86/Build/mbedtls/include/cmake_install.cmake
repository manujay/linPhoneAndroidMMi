# Install script for directory: /Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/externals/mbedtls/include

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/mbedtls" TYPE FILE MESSAGE_LAZY PERMISSIONS OWNER_READ OWNER_WRITE GROUP_READ WORLD_READ FILES
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/externals/mbedtls/include/mbedtls/aes.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/externals/mbedtls/include/mbedtls/aesni.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/externals/mbedtls/include/mbedtls/arc4.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/externals/mbedtls/include/mbedtls/asn1.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/externals/mbedtls/include/mbedtls/asn1write.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/externals/mbedtls/include/mbedtls/base64.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/externals/mbedtls/include/mbedtls/bignum.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/externals/mbedtls/include/mbedtls/blowfish.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/externals/mbedtls/include/mbedtls/bn_mul.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/externals/mbedtls/include/mbedtls/camellia.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/externals/mbedtls/include/mbedtls/ccm.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/externals/mbedtls/include/mbedtls/certs.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/externals/mbedtls/include/mbedtls/check_config.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/externals/mbedtls/include/mbedtls/cipher.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/externals/mbedtls/include/mbedtls/cipher_internal.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/externals/mbedtls/include/mbedtls/cmac.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/externals/mbedtls/include/mbedtls/compat-1.3.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/externals/mbedtls/include/mbedtls/config.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/externals/mbedtls/include/mbedtls/ctr_drbg.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/externals/mbedtls/include/mbedtls/debug.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/externals/mbedtls/include/mbedtls/des.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/externals/mbedtls/include/mbedtls/dhm.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/externals/mbedtls/include/mbedtls/ecdh.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/externals/mbedtls/include/mbedtls/ecdsa.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/externals/mbedtls/include/mbedtls/ecjpake.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/externals/mbedtls/include/mbedtls/ecp.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/externals/mbedtls/include/mbedtls/entropy.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/externals/mbedtls/include/mbedtls/entropy_poll.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/externals/mbedtls/include/mbedtls/error.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/externals/mbedtls/include/mbedtls/gcm.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/externals/mbedtls/include/mbedtls/havege.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/externals/mbedtls/include/mbedtls/hmac_drbg.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/externals/mbedtls/include/mbedtls/md.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/externals/mbedtls/include/mbedtls/md2.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/externals/mbedtls/include/mbedtls/md4.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/externals/mbedtls/include/mbedtls/md5.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/externals/mbedtls/include/mbedtls/md_internal.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/externals/mbedtls/include/mbedtls/memory_buffer_alloc.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/externals/mbedtls/include/mbedtls/net.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/externals/mbedtls/include/mbedtls/net_sockets.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/externals/mbedtls/include/mbedtls/oid.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/externals/mbedtls/include/mbedtls/padlock.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/externals/mbedtls/include/mbedtls/pem.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/externals/mbedtls/include/mbedtls/pk.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/externals/mbedtls/include/mbedtls/pk_internal.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/externals/mbedtls/include/mbedtls/pkcs11.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/externals/mbedtls/include/mbedtls/pkcs12.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/externals/mbedtls/include/mbedtls/pkcs5.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/externals/mbedtls/include/mbedtls/platform.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/externals/mbedtls/include/mbedtls/platform_time.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/externals/mbedtls/include/mbedtls/ripemd160.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/externals/mbedtls/include/mbedtls/rsa.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/externals/mbedtls/include/mbedtls/sha1.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/externals/mbedtls/include/mbedtls/sha256.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/externals/mbedtls/include/mbedtls/sha512.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/externals/mbedtls/include/mbedtls/ssl.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/externals/mbedtls/include/mbedtls/ssl_cache.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/externals/mbedtls/include/mbedtls/ssl_ciphersuites.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/externals/mbedtls/include/mbedtls/ssl_cookie.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/externals/mbedtls/include/mbedtls/ssl_internal.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/externals/mbedtls/include/mbedtls/ssl_ticket.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/externals/mbedtls/include/mbedtls/threading.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/externals/mbedtls/include/mbedtls/timing.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/externals/mbedtls/include/mbedtls/version.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/externals/mbedtls/include/mbedtls/x509.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/externals/mbedtls/include/mbedtls/x509_crl.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/externals/mbedtls/include/mbedtls/x509_crt.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/externals/mbedtls/include/mbedtls/x509_csr.h"
    "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/externals/mbedtls/include/mbedtls/xtea.h"
    )
endif()

