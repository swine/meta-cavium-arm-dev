GCCMULTILIB_aarch64 = ""
do_configure_prepend () {
export DISABLE_MULTILIB="yes"
}

do_install_append_linux-gnuilp32 () {
	ln -s ${TARGET_SYS_MULTILIB_ORIGINAL} ${D}${libdir}/${TARGET_ARCH}${TARGET_VENDOR}-linux
}

FILES_${PN} += "${libdir}/${TARGET_ARCH}${TARGET_VENDOR}-linux"
