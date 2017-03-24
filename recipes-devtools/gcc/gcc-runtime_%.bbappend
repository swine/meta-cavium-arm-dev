GCCMULTILIB_aarch64 = ""
do_configure_prepend () {
export DISABLE_MULTILIB="yes"
}

do_install_append_linux-gnuilp32 () {
	ln -s . ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR_MULTILIB_ORIGINAL}-${TARGET_OS}/ilp32
}
