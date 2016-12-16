git clone -b krogoth git://git.yoctoproject.org/poky poky_2_1
cd poky_2_1
git clone -b krogoth https://github.com/mjaggi-cavium/meta-cavium-arm.git --depth 1
git clone -b krogoth http://git.linaro.org/openembedded/meta-linaro.git
git reset --hard f73006031ef8bca7b8851724832c6f37ed63ec89

git am -q --whitespace=nowarn ./meta-cavium-arm/ML_poky_patches/0001-Updated-the-meta-layer-to-include-ilp32-and-multilib.patch
git am -q --whitespace=nowarn ./meta-cavium-arm/ML_poky_patches/0002-Updated-glibc-2.23-based-ilp32-patches.patch
git am -q --whitespace=nowarn ./meta-cavium-arm/ML_poky_patches/0003-Update-linux-libc-headers-to-match-the-kernel-in-the.patch 
git am -q --whitespace=nowarn ./meta-cavium-arm/ML_poky_patches/0004-Disable-gmp.patch
cd meta-linaro
git reset --hard 642142732447482e66daf85cd8af83fc7ac95f23
git am -q --whitespace=nowarn ../meta-cavium-arm/ML_poky_patches/meta-linaro/0001-Modified-DEFAULT_TUNE-and-added-BASE_LIB_tune-aarch6.patch
git am -q --whitespace=nowarn ../meta-cavium-arm/ML_poky_patches/meta-linaro/0002-Remove-dependency-on-networking-layer.patch 


