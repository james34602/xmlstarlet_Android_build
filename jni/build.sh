#!/bin/sh

case "$(uname -s)" in
  CYGWIN*|MINGW32*|MSYS*) ext=.cmd; plat=windows;;
  *) plat=linux;;
esac;

case $1 in
  clean)
    rm -rf libs obj;
    exit 0;
  ;;
esac;

if [ ! "$NDK_ROOT" ]; then
  NDK_ROOT=`pwd`/android-ndk-r18b;
fi;
if [ ! "$NDK_TOOLCHAIN_VERSION" ]; then
  NDK_TOOLCHAIN_VERSION=clang;
fi;
if [ ! "$APP_ABI" ]; then
  APP_ABI=x86;
fi;
if [ ! "$APP_PLATFORM" ]; then
  APP_PLATFORM=android-17;
fi;

# Set up Android NDK
echo "Fetching $NDK_ROOT"
[ -f "$NDK_ROOT-linux-x86_64.zip" ] || wget https://dl.google.com/android/repository/$NDK_ROOT-$plat-x86_64.zip
[ -d "$NDK_ROOT" ] || unzip -o $NDK_ROOT-$plat-x86_64.zip

# Build
$NDK_ROOT/ndk-build$ext NDK_PROJECT_PATH=. APP_BUILD_SCRIPT=./Android.mk NDK_TOOLCHAIN_VERSION=$NDK_TOOLCHAIN_VERSION APP_ABI=$APP_ABI APP_PLATFORM=$APP_PLATFORM APP_STL=c++_static;
exit 0;
