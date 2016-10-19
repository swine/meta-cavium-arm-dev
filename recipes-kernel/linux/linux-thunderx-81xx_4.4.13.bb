inherit kernel

LICENSE = "GPLv2"
LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
LINUX_VERSION ?= "4.4.13"
PROVIDES += "virtual/kernel"
COMPATIBLE_MACHINE = "cavium-thunderx-81xx"
ARCH = "arm64"
#SRC_URI[md5sum] = "ef1e12f54b359f7e4254b7341ee0c4de"
#SRCREV = "2134d97aa3a7ce38bb51f933f2e20cafde371085"

SRC_URI = "file:///home/mjaggi/OCTEONTX-SDK/linux/kernel/linux-aarch64.tar.gz"
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
