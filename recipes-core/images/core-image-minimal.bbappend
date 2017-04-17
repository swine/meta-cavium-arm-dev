do_buildFIT() {
	cp  ${81XX_ITS_FILE}  ${S}/81xx.its
        sed -i -e "s,81XX_KERNEL_IMG,${DEPLOY_DIR_IMAGE}/Image," ${S}/81xx.its
        sed -i -e "s,81XX_DTB,${81XX_DTB_FILE}," ${S}/81xx.its
        sed -i -e "s,81XX_ROOTFS_EXT4,${DEPLOY_DIR_IMAGE}/core-image-minimal-${MACHINE}.ext4," ${S}/81xx.its

        mkimage -f ${S}/81xx.its  ${DEPLOY_DIR_IMAGE}/${MACHINE}.itb
}

do_update_dyn_linker() {
ln -s ../libilp32/ld-2.23.so  ${IMAGE_ROOTFS}/lib/ld-linux-aarch64_ilp32.so.1
}

IMAGE_PREPROCESS_COMMAND += "do_update_dyn_linker"

addtask buildFIT after do_build
