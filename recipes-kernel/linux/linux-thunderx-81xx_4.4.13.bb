inherit kernel

LICENSE = "GPLv2"
LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
LINUX_VERSION ?= "4.4.13"
PROVIDES += "virtual/kernel"
COMPATIBLE_MACHINE = "cavium-thunderx-81xx"
ARCH = "arm64"

SRC_URI = "${KERNEL_SRC}"
SRC_URI += "file://defconfig"

S = "${WORKDIR}/linux-aarch64"

do_package_qa() {
	echo "do_package_qa commented hack"
}


addtask deploy after do_install
addtask shared_workdir after do_compile before do_install
FILES_kernel-image += "/boot/Image*"
KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT}"
LDFLAGS += "-lssl -lcrypto"
