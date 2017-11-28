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
export LD="/Users/ceinfo/Library/Android/sdk/ndk-bundle/toolchains/aarch64-linux-android-4.9/prebuilt/darwin-x86_64/bin/aarch64-linux-android-ld"
export AR="/Users/ceinfo/Library/Android/sdk/ndk-bundle/toolchains/aarch64-linux-android-4.9/prebuilt/darwin-x86_64/bin/aarch64-linux-android-ar"
export RANLIB="/Users/ceinfo/Library/Android/sdk/ndk-bundle/toolchains/aarch64-linux-android-4.9/prebuilt/darwin-x86_64/bin/aarch64-linux-android-ranlib"
export STRIP="/Users/ceinfo/Library/Android/sdk/ndk-bundle/toolchains/aarch64-linux-android-4.9/prebuilt/darwin-x86_64/bin/aarch64-linux-android-strip"
export NM="/Users/ceinfo/Library/Android/sdk/ndk-bundle/toolchains/aarch64-linux-android-4.9/prebuilt/darwin-x86_64/bin/aarch64-linux-android-nm"
export CC_NO_LAUNCHER="/Users/ceinfo/Library/Android/sdk/ndk-bundle/toolchains/llvm/prebuilt/darwin-x86_64/bin/clang"
export CXX_NO_LAUNCHER="/Users/ceinfo/Library/Android/sdk/ndk-bundle/toolchains/llvm/prebuilt/darwin-x86_64/bin/clang++"
export OBJC_NO_LAUNCHER="/Users/ceinfo/Library/Android/sdk/ndk-bundle/toolchains/llvm/prebuilt/darwin-x86_64/bin/clang"

ASFLAGS=" "
CPPFLAGS="  -w"
CFLAGS=" "
CXXFLAGS=" "
OBJCFLAGS=" "
LDFLAGS=" "

export PATH="$PATH:/Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-arm64/cmake/programs"
export PKG_CONFIG="/usr/local/bin/pkg-config"
export PKG_CONFIG_PATH=""
export PKG_CONFIG_LIBDIR=""

cd "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/WORK/android-arm64/Build/vpx"

if [ ! -f "vpx_config.h" ]
then
	 
	CC=$CC_NO_LAUNCHER LD=$CC_NO_LAUNCHER ASFLAGS=$ASFLAGS CFLAGS=$CFLAGS LDFLAGS=$LDFLAGS "/Users/ceinfo/LinPhoneAndroidProject/linphone-android/submodules/externals/libvpx/configure"  "--prefix=/Users/ceinfo/LinPhoneAndroidProject/linphone-android/liblinphone-sdk/android-arm64" "--target=arm64-android-gcc" "--prefix=/Users/ceinfo/LinPhoneAndroidProject/linphone-android/liblinphone-sdk/android-arm64" "--target=arm64-android-gcc" "--enable-static" "--disable-shared" "--enable-error-concealment" "--enable-multithread" "--enable-realtime-only" "--enable-spatial-resampling" "--enable-vp8" "--disable-vp9" "--enable-libs" "--disable-install-docs" "--disable-debug-libs" "--disable-examples" "--disable-unit-tests" "--as=yasm" "--sdk-path=/Users/ceinfo/Library/Android/sdk/ndk-bundle/" 
fi