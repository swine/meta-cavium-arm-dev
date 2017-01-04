SECTION = "bootloaders"
PROVIDES = "virtual/bootloader"
DEPENDS_append += "libgcc"
LICENSE = "GPL"

S = "${WORKDIR}/u-boot"
PACKAGE_ARCH = "${MACHINE_ARCH}"
MKBFS = "${CAVIUM_UBOOT_SCRIPTS}/make-bootfs.py"
FATFS_TOOL = "${CAVIUM_UBOOT_SCRIPTS}/fatfs-tool"
BOOTFS_IMAGE = "${S}/${CAVIUM_BOARD_NAME}-firmware-uboot.img"
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
	echo ${CAVIUM_BOARD_NAME} > ~/a.txt
	make thunderx_81xx_config
	oe_runmake \
		CFLAGS="-mlittle-endian -I${S}/csr/include -mabi=lp64" u-boot-nodtb.bin
}

do_deploy () {
	${MKBFS} --uboot u-boot-nodtb.bin -f ${BOOTFS_IMAGE}
 	${FATFS_TOOL} -i ${BDK_IMAGE} cp ${DTB_DIR}/*.dtb /      
	${MKBFS} --bs ${BDK_IMAGE} --bl0  ${ATFBS_IMAGE} -f ${BOOTFS_IMAGE} 
	${MKBFS} --fip ${ATFFIP_IMAGE} --bl1 ${ATFBL1_IMAGE} -f ${BOOTFS_IMAGE}

        cp ${BOOTFS_IMAGE} ${DEPLOY_BOOTFS_IMAGE}
}

addtask deploy after do_compile
addtask fetch before do_compile
addtask deploy after do_compile
