#ilp32 patches for gdbserver
DIRX = "/home/mjaggi/poky_gdb/meta-cavium-arm/recipes-devtools/gdb/gdb/"
SRC_URI += "file://${DIRX}0001-2016-01-25-Andrew-Pinski-apinski-cavium.com.patch"
SRC_URI += "file://${DIRX}0002-Move-AARCH64-ILP32-rejection-handling.patch"
SRC_URI += "file://${DIRX}0003-Add-ILP32-support-to-gdb.patch"
SRC_URI += "file://${DIRX}0004-Handle-ILP32-AARCH64-correctly-for-gdbserver.patch"

