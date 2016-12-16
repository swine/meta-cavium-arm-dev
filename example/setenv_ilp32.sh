export YOCTO_BUILD_DIR=/home/mjaggi/krogoth/poky_2_1/build/
export TARGET=aarch64-pokymllib32-linux-gnuilp32
export CROSS_COMPILE=${YOCTO_BUILD_DIR}/tmp/sysroots/x86_64-linux/usr/bin/${TARGET}/${TARGET}-
export SYSROOT=${YOCTO_BUILD_DIR}/tmp/sysroots/lib32-cavium-thunderx-81xx
export CC="${CROSS_COMPILE}gcc -mabi=ilp32  --sysroot=${SYSROOT}"
export AR=${CROSS_COMPILE}ar
export AS=${CROSS_COMPILE}as 
export LD="${CROSS_COMPILE}ld --sysroot=${SYSROOT}"
export STRIP=${CROSS_COMPILE}strip
export CONFIGURE_FLAGS="--target=${TARGET} --host=${TARGET} --build=x86_64-linux --with-libtool-sysroot=$SYSROOT"
export LDFLAGS="-Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed"
export CFLAGS="-mabi=ilp32 -O2 "
export ARCH=aarch64_ilp32
