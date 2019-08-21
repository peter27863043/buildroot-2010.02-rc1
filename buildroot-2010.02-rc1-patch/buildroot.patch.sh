#copy the following files
cp -v atk.mk ../buildroot-2010.02-rc1/package/atk
cp -v Makefile ../buildroot-2010.02-rc1/output/toolchain/gcc-4.3.4-initial
cp -v toplev_inline_patch.patch  ../buildroot-2010.02-rc1/toolchain/gcc/4.3.4/
cp -v backwards_compat.patch ../buildroot-2010.02-rc1/package/module-init-tools/
cp -v busybox-1.16.0-Makefile.patch ../buildroot-2010.02-rc1/package/busybox/
cp -v linux-2.6.32.7-timeconst.pl.patch ../buildroot-2010.02-rc1/toolchain/kernel-headers/
cp -v makedevs.c ../buildroot-2010.02-rc1/target/makedevs/

#cp -v module-init-3.2.2.Makefile ../buildroot-2010.02-rc1/output/toolchain/module-init-tools-3.2.2/Makefile
#cp -v backwards_compat.c ../buildroot-2010.02-rc1/output/toolchain/module-init-tools-3.2.2
# toolchain/patch-kernel.sh /home/buildroot-2010.02-rc1/output/build/busybox-1.16.0 package/busybox busybox-1.16.0-\*.patch
#cp -v BusyboxMakefile ../buildroot-2010.02-rc1/output/build/busybox-1.16.0/Makefile
cp -v makedevs.c ../buildroot-2010.02-rc1/output/build/makedevs-host
#cp -v timeconst.pl ../buildroot-2010.02-rc1/output//build/linux-2.6.32.7/kernel
