#!/usr/bin/env bash

# mirror of get_autotools.sh in the bin directory

AUTOTOOLS_INSTALLER_DIR=/vagrant/install

export build=/home/vagrant/devtools
export autoconf_version=2.69
export automake_version=1.15
export libtool_version=2.4

# Something was breaking without it
export PATH=$PATH:$build/autotools-bin/bin:$build/autoconf-${autoconf_version}
sudo echo "export PATH=\$PATH:$build/autotools-bin/bin" >> ~/.bashrc

mkdir -p $build
    
cd $build

if [ ! -f  "$AUTOTOOLS_INSTALLER_DIR/autoconf-${autoconf_version}.tar.gz" ]; then
    cd $AUTOTOOLS_INSTALLER_DIR
    curl -OL "http://ftpmirror.gnu.org/autoconf/autoconf-${autoconf_version}.tar.gz"
    cd $build
fi

tar xzf "$AUTOTOOLS_INSTALLER_DIR/autoconf-${autoconf_version}.tar.gz"
cd "autoconf-${autoconf_version}"
./configure --prefix=$build/autotools-bin
make
make install
export PATH=$PATH:${build}/autotools-bin/bin
    
cd $build

if [ ! -f  "$AUTOTOOLS_INSTALLER_DIR/automake-${automake_version}.tar.gz" ]; then
    cd $AUTOTOOLS_INSTALLER_DIR
    curl -OL "http://ftpmirror.gnu.org/automake/automake-${automake_version}.tar.gz"
    cd $build
fi

tar xzf "$AUTOTOOLS_INSTALLER_DIR/automake-${automake_version}.tar.gz"
cd "automake-${automake_version}"
./configure --prefix=${build}/autotools-bin
make
make install
    
cd $build

if [ ! -f  "$AUTOTOOLS_INSTALLER_DIR/libtool-${libtool_version}.tar.gz" ]; then
    cd $AUTOTOOLS_INSTALLER_DIR
    curl -OL "http://ftpmirror.gnu.org/libtool/libtool-${libtool_version}.tar.gz"
    cd $build
fi
tar xzf "$AUTOTOOLS_INSTALLER_DIR/libtool-${libtool_version}.tar.gz"
cd "libtool-${libtool_version}"
./configure --prefix=${build}/autotools-bin
make
make install

sudo echo "export PATH=\$PATH:$build/autotools-bin/bin" >> ~/.bashrc

