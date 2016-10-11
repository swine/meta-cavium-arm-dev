#ilp32 patches for gdbserver
FILESEXTRAPATHS_append := "${THISDIR}/files"
SRC_URI += "file://0001-2016-01-25-Andrew-Pinski-apinski-cavium.com.patch"
SRC_URI += "file://0002-Move-AARCH64-ILP32-rejection-handling.patch"
SRC_URI += "file://0003-Add-ILP32-support-to-gdb.patch"
SRC_URI += "file://0004-Handle-ILP32-AARCH64-correctly-for-gdbserver.patch"
SRC_URI += "file://0005-Fix-ILP32-check-until-addrbits-is-changed.patch"
SRC_URI += "file://0006-Fix-is_elf64-order-was-using-it-before-it-was-initia.patch"
SRC_URI += "file://0007-Fix-gdbserver-the-rest-of-the-way-pc-should-be-a-64b.patch"
