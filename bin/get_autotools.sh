#!/usr/bin/env bash

export build=~/devtools
export autoconf_version=2.69
export automake_version=1.15
export libtool_version=2.4
mkdir -p $build
    
cd $build
curl -OL "http://ftpmirror.gnu.org/autoconf/autoconf-${autoconf_version}.tar.gz"
tar xzf "autoconf-${autoconf_version}.tar.gz"
cd "autoconf-${autoconf_version}"
./configure --prefix=$build/autotools-bin
make
make install
export PATH=$PATH:${build}/autotools-bin/bin
    
cd $build
curl -OL "http://ftpmirror.gnu.org/automake/automake-${automake_version}.tar.gz"
tar xzf automake-${automake_version}.tar.gz
cd "automake-${automake_version}"
./configure --prefix=${build}/autotools-bin
make
make install
    
cd $build
curl -OL "http://ftpmirror.gnu.org/libtool/libtool-${libtool_version}.tar.gz"
tar xzf l"ibtool-${libtool_version}.tar.gz"
cd "libtool-${libtool_version}"
./configure --prefix=${build}/autotools-bin
make
make install