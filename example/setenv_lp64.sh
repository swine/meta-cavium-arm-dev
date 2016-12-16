export YOCTO_BUILD_DIR=/home/manish/Code/YTest/poky/build/
export TARGET=aarch64-poky-linux
export CROSS_COMPILE=${YOCTO_BUILD_DIR}/tmp/sysroots/x86_64-linux/usr/bin/${TARGET}/${TARGET}-
export SYSROOT=${YOCTO_BUILD_DIR}/tmp/sysroots/cavium-thunderx-81xx
export CC="${CROSS_COMPILE}gcc  --sysroot=${SYSROOT}"
export AR=${CROSS_COMPILE}ar
export AS=${CROSS_COMPILE}as 
export LD="${CROSS_COMPILE}ld --sysroot=${SYSROOT}"
export STRIP=${CROSS_COMPILE}strip

export CONFIGURE_FLAGS="--target=${TARGET} --host=${TARGET} --build=x86_64-linux --with-libtool-sysroot=$SYSROOT"
export LDFLAGS="-Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed"
export CFLAGS=" -O2 "
export ARCH=arm64
