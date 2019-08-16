apt-get update
apt-get install -y vim
apt-get install -y wget
apt-get install -y curl
apt-get install -y bzip2
wget https://buildroot.org/downloads/buildroot-2010.02-rc1.tar.bz2
bunzip2 buildroot-2010.02-rc1.tar.bz2
tar -xvf buildroot-2010.02-rc1.tar
apt-get install -y gcc-4.8 g++-4.8 g++-4.8-multilib gcc-4.8-multilib
apt-get install -y make
apt-get install -y bison flex gettext
apt-get install -y g++
apt-get install -y libncurses5-dev
apt-get install -y patch

wget http://ftp.gnu.org/gnu/texinfo/texinfo-4.13.tar.gz
gzip -dc < texinfo-4.13.tar.gz | tar -xf -
cd texinfo-4.13
./configure
make
make install
cd ..

cd buildroot-2010.02-rc1
mkdir dl
cd dl
wget http://ftp.gwdg.de/pub/linux/sources.redhat.com/binutils/releases/binutils-2.20.tar.bz2
wget https://www.nektar.info/thirdparty/zlib-1.2.3.tar.bz2
wget http://sources.buildroot.net/module-init-tools-3.2.2.tar.bz2
wget https://launchpad.net/genext2fs/main/1.4/+download/genext2fs-1.4.tar.gz
wget http://repository.timesys.com/buildsources/f/fakeroot/fakeroot-1.9.5/fakeroot-1.9.5.tar.gz
cp fakeroot-1.9.5.tar.gz fakeroot_1.9.5.tar.gz
cd ..
cd ..
cp uClibc-0.9.30.2_patch/* buildroot-2010.02-rc1/toolchain/uClibc/
cp gcc_4.3.4_patch/* buildroot-2010.02-rc1/toolchain/gcc/4.3.4/
cp .config buildroot-2010.02-rc1/
cd buildroot-2010.02-rc1-patch/
./buildroot.patch.sh

