if [ ! -d ../ip218_release/opt/acrospeed/user ];
then
        echo "-----------------------------------"
        echo "opt/acrospeed/user dosen't  exists!"
        echo "-----------------------------------"
        mkdir ../ip218_release/opt/acrospeed/user
fi
if [ ! -d ../ip218_release/svn.material/lib ];
then
        echo "------------------------"
        echo "tar -zxvf uClibc.tgz"
        echo "------------------------"
        mkdir ../ip218_release/svn.material/lib
        cp ../ip218_release/svn.material/uclibc.tgz ../ip218_release/svn.material/lib/
        tar -zxvf ../ip218_release/svn.material/lib/uclibc.tgz -C /home/ip218_release/svn.material/lib
fi

echo "------------------------"
echo " strip libstdc++.so "
echo "------------------------"
output/staging/usr/bin/mips-linux-strip -g output/target/usr/lib/libstdc++.so.6.0.10

echo "------------------------"
echo " copy toolchain "
echo "------------------------"
rm -rf ../ip218_release/opt/acrospeed/user/*
cp -r output/staging/usr/* ../ip218_release/opt/acrospeed/user/
cp -r output/host/usr/bin/ ../ip218_release/opt/acrospeed/user/bin/

echo "------------------------"
echo " clean lib & copy lib "
echo "------------------------"
cd ../ip218_release
pwd
rm svn.material/lib/lib/*   
cp -r ../buildroot-2010.02-rc1/output/staging/lib/* svn.material/lib/lib/
cp    ../buildroot-2010.02-rc1/output/target/lib/libgcc_s.so.1 svn.material/lib/lib/
cp -r ../buildroot-2010.02-rc1/output/target/usr/lib/libstdc++.* svn.material/lib/lib/
rm svn.material/lib/lib/liblz*
rm svn.material/uclibc.tgz
rm svn.material/lib/uclibc.tgz
cd svn.material/lib
echo "------------------------"
echo " tar uclibc.tgz  "
echo "------------------------"
pwd
tar -czvf uclibc.tgz etc/ lib/ readme_lib.txt  usr/
cp uclibc.tgz ../.
echo "----------------------------"
echo " update build/initramfs/lib "
echo "----------------------------"
cd ../../
rm build/initramfs/lib/*
cp -r svn.material/lib/lib/* build/initramfs/lib
cd ..
echo "----------------------------"
echo " change ip218 setting "
echo "----------------------------"
cp -v ip218_patch/bash.uboot       ip218_release/env/
cp -v ip218_patch/bash.linux       ip218_release/env/
cp -v ip218_patch/Makefile         ip218_release/svn.subMake/
cp -v ip218_patch/Makefile.rootfs  ip218_release/svn.subMake/
cp -v ip218_patch/config.mk        ip218_release/src/u-boot-2009.08
cp -v ip218_patch/Makefile_linux   ip218_release/src/linux/Makefile
cp -v ip218_patch/Makefile_busybox ip218_release/src/busybox-1.23.2/Makefile


