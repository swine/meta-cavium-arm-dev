SRC_URI = "${UBOOT_TAR}"
LIC_FILES_CHKSUM = "file://README;md5=0a6bf9bc0593273e7e569690ee754fb3"

PV = "v2016.03+"

BDK_IMAGE = "${CAVIUM_UBOOT_SCRIPTS}/${CAVIUM_BOARD_NAME}-bdk.bin"
ATFBS_IMAGE= "${CAVIUM_UBOOT_SCRIPTS}/${CAVIUM_BOARD_NAME}-bootstrap.bin"
ATFBL1_IMAGE= "${CAVIUM_UBOOT_SCRIPTS}/${CAVIUM_BOARD_NAME}-bl1.bin"
ATFFIP_IMAGE= "${CAVIUM_UBOOT_SCRIPTS}/${CAVIUM_BOARD_NAME}-fip.bin"