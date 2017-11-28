#!/bin/sh

if [ -n "" ]
then
	export AS="/Users/ceinfo/Library/Android/sdk/ndk-bundle/toolchains/llvm/prebuilt/darwin-x86_64/bin/clang"
else
	if [ -n "" ]
	then
		export AS=""
	fi
fi
export CC="/Users/ceinfo/Library/Android/sdk/ndk-bundle/toolchains/llvm/prebuilt/darwin-x86_64/bin/clang"
export CXX="/Users/ceinfo/Library/Android/sdk/ndk-bundle/toolchains/llvm/prebuilt/darwin-x86_64/bin/clang++"
export OBJC="/Users/ceinfo/Library/Android/sdk/ndk-bundle/toolchains/llvm/prebuilt/darwin-x86_64/bin/clang"
export LD="/Users/ceinfo/Library/Android/sdk/ndk-bundle/toolchains/x86-4.9/prebuilt/darwin-x86_64/bin/i686-linux-android-ld"
export AR="/Users/ceinfo/Library/Android/sdk/ndk-bundle/toolchains/x86-4.9/prebuilt/darwin-x86_64/bin/i686-linux-android-ar"
export RANLIB="/Users/ceinfo/Library/Android/sdk/ndk-bundle/toolchains/x86-4.9/prebuilt/darwin-x86_64/bin/i686-linux-android-ranlib"
export STRIP="/Users/ceinfo/Library/Android/sdk/ndk-bundle/toolchains/x86-4.9/prebuilt/darwin-x86_64/bin/i686-linux-android-strip"
export NM="/Users/ceinfo/Library/Android/sdk/ndk-bundle/toolchains/x86-4.9/prebuilt/darwin-x86_64/bin/i686-linux-android-nm"
export CC_NO_LAUNCHER="/Users/ceinfo/Library/Android/sdk/ndk-bundle/toolchains/llvm/prebuilt/darwin-x86_64/bin/clang"
export CXX_NO_LAUNCHER="/Users/ceinfo/Library/Android/sdk/ndk-bundle/toolchains/llvm/prebuilt/darwin-x86_64/bin/clang++"
export OBJC_NO_LAUNCHER="/Users/ceinfo/Library/Android/sdk/ndk-bundle/toolchains/llvm/prebuilt/darwin-x86_64/bin/clang"

ASFLAGS=" "
CPPFLAGS="  -w"
CFLAGS=" "
CXXFLAGS=" "
OBJCFLAGS=" "
LDFLAGS=" "

export PATH="$PATH:/Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86/cmake/programs"
export PKG_CONFIG="/usr/local/bin/pkg-config"
export PKG_CONFIG_PATH=""
export PKG_CONFIG_LIBDIR=""

cd "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-x86/Build/vpx"
make V=0  
