[Home](Readme.md)
# autoconf

See also:

  - [Autoconf](Autoconf.md)
  - [Automake](Automake.md)
  - [Libtool](Libtool.md)
  - [CMake](CMake.md)
  - [Make](Make.md)


https://www.gnu.org/software/autoconf/autoconf.html

---

**Contents**

- [Installing](Autoconf.md#installing)
- [Miscellaneous](Autoconf.md#miscellaneous)

---

## Installing

---

To get the autoconf, etc.:

```bash
    export build=~/devtools # or wherever you'd like to build
    mkdir -p $build
    
    cd $build
    curl -OL http://ftpmirror.gnu.org/autoconf/autoconf-2.68.tar.gz
    tar xzf autoconf-2.68.tar.gz
    cd autoconf-2.68
    ./configure --prefix=$build/autotools-bin
    make
    make install
    export PATH=$PATH:$build/autotools-bin/bin
    
    cd $build
    curl -OL http://ftpmirror.gnu.org/automake/automake-1.11.tar.gz
    tar xzf automake-1.11.tar.gz
    cd automake-1.11
    ./configure --prefix=$build/autotools-bin
    make
    make install
    
    cd $build
    curl -OL http://ftpmirror.gnu.org/libtool/libtool-2.4.tar.gz
    tar xzf libtool-2.4.tar.gz
    cd libtool-2.4
    ./configure --prefix=$build/autotools-bin
    make
    make install
```

---

## Miscellaneous

---

---