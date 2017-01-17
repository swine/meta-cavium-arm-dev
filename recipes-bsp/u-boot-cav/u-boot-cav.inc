SECTION = "bootloaders"
PROVIDES = "virtual/bootloader"
DEPENDS_append += "libgcc"
LICENSE = "GPL"

S = "${WORKDIR}/u-boot"
PACKAGE_ARCH = "${MACHINE_ARCH}"
MKBFS = "${CAVIUM_UBOOT_SCRIPTS}/make-bootfs.py"
FIP_CREATE = "${CAVIUM_UBOOT_SCRIPTS}/fip_create"
FATFS_TOOL = "${CAVIUM_UBOOT_SCRIPTS}/fatfs-tool"
BOOTFS_IMAGE = "${S}/${CAVIUM_BOARD_NAME}-firmware-uboot.img"
FIP_IMAGE = "${S}/${CAVIUM_BOARD_NAME}-fip.img"
DEPLOY_BOOTFS_IMAGE = "${DEPLOYDIR}/${CAVIUM_BOARD_NAME}-firmware.img"
DTB_DIR = "${CAVIUM_UBOOT_SCRIPTS}"

EXTRA_OEMAKE = 'CROSS_COMPILE=${TARGET_PREFIX} CC="${TARGET_PREFIX}gcc ${TOOLCHAIN_OPTIONS}" V=1'
EXTRA_OEMAKE += 'HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}"'

inherit uboot-config deploy
##include board defines
include u-boot-cav-${CAVIUM_BOARD_NAME}.inc

do_compile () {
	unset LDFLAGS
	unset CFLAGS
	unset CPPFLAGS
	make t81_config
	oe_runmake \
		CFLAGS="-mlittle-endian -I${S}/csr/include -mabi=lp64" u-boot-nodtb.bin
}

do_deploy () {
        ${FIP_CREATE} --dump --bl2 ${ATFBL2_IMAGE} --bl31 ${ATFBL31_IMAGE} --bl33 ${S}/u-boot-nodtb.bin ${FIP_IMAGE}
 	${FATFS_TOOL} -i ${BDK_IMAGE} cp ${DTB_DIR}/*.dtb /      
	${MKBFS} --bs ${BDK_IMAGE} --bl1 ${ATFBL1_IMAGE} --fip  ${FIP_IMAGE} -f ${BOOTFS_IMAGE} 

        cp ${BOOTFS_IMAGE} ${DEPLOY_BOOTFS_IMAGE}
}

addtask deploy after do_compile
addtask fetch before do_compile
addtask deploy after do_compile
