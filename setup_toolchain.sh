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
