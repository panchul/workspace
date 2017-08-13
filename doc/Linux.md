

## UNDER CONSTRUCTION

Easily Encrypt your Flash Drives with Linux
[https://www.linux.com/learn/easily-encrypt-your-flash-drives-linux](https://www.linux.com/learn/easily-encrypt-your-flash-drives-linux)


## Installation

### Installing using USB

[https://en.wikipedia.org/wiki/Live_USB](https://en.wikipedia.org/wiki/Live_USB)

LiLi:
[http://www.linuxliveusb.com/en/download](http://www.linuxliveusb.com/en/download)


## Utilities

Some nice projects are worth mentioning. I might had to stash them fo later,
when I have time to explore them more and maybe create a sub-page.

### Monit

https://mmonit.com/monit/


### Graphics
 
Command-line untilities for image processing:
https://www.linux.com/learn/cool-linux-command-line-image-management-hacks

#### ```feh```

```sudo apt-get install feh``` - installs it (Ubuntu)

To list the files with the dimentions:
    
    $ feh -l
    NUM	FORMAT	WIDTH	HEIGHT	PIXELS	SIZE	ALPHA	FILENAME
    1	jpeg	2187	1458	  3M	  2M	-	./IMG_8408.JPG    

#### ```identify``` from imagemagick

```sudo apt-get install imagemagick``` - installs it (Ubuntu)

To get information about a file:

    $ identify ./IMG_8455.JPG 
    ./IMG_8455.JPG JPEG 2592x1728 2592x1728+0+0 8-bit DirectClass 4.338MB 0.000u 0:00.000

```identify -verbose ./IMG_8455.JPG``` gives much more info. 

Pretty neat for the summary of what is out there:

    $ find . -iregex ".*\.\(jpg\|png\)" -exec identify {} \;
    ./somefolder/anotherone/IMG_8408.JPG JPEG 2187x1458 2187x1458+0+0 8-bit DirectClass 2.61MB 0.000u 0:00.000

#### xcowsay

```sudo apt-get install xcowsay``` - installs it (Ubuntu)

To get a temporary pop-up with a cute picture saying your line:

    $ xcowsay Hello there, I am using xcowsay. Ok, Moo-o-o-o

## Ubuntu

http://www.howtogeek.com/howto/ubuntu/install-an-rpm-package-on-ubuntu-linux/

## Misc. Troubleshooting

---

#### grub issues, broken packager 

On Ubuntu vm setup in VirtualBox on MacOS via Vagrant.
Had something wrong with ```grub``` on a vm, needed to run ```sudo dpkg --configure -a``` to get
the packager work better.

---

#### html5, flash, etc.

Here is how you could get html5 working on ubuntu:

    sudo apt-get install ubuntu-restricted-extras
    
(http://askubuntu.com/questions/475351/firefox-html5-video-support )

---

#### To update the OS, run these:

    sudo apt-get -y update
    sudo apt-get -y upgrade

---

#### Install languages from command line

    sudo apt-get install language-pack-[cod] language-pack-gnome-[cod] language-pack-[cod]-base language-pack-gnome-[cod]-base 

For Gnome there is also:

    gnome-language-selector --install [cod]
    
---
    
#### OpenVPN

Build a Real VPN with OpenVPN:

https://www.linux.com/learn/intro-to-linux/2017/3/build-real-vpn-openvpn


---

Linux Kernel

https://kernelnewbies.org/FAQ  - nice FAQ


---

You can use this to get the name of the release:

    $ lsb_release -cs
    trusty

This also works similarly:

    $ cat /etc/*rel*
    DISTRIB_ID=Ubuntu
    DISTRIB_RELEASE=16.04
    DISTRIB_CODENAME=xenial
    DISTRIB_DESCRIPTION="Ubuntu 16.04.2 LTS"
    NAME="Ubuntu"
    VERSION="16.04.2 LTS (Xenial Xerus)"
    ID=ubuntu
    ID_LIKE=debian
    PRETTY_NAME="Ubuntu 16.04.2 LTS"
    VERSION_ID="16.04"
    HOME_URL="http://www.ubuntu.com/"
    SUPPORT_URL="http://help.ubuntu.com/"
    BUG_REPORT_URL="http://bugs.launchpad.net/ubuntu/"
    VERSION_CODENAME=xenial
    UBUNTU_CODENAME=xenial


---

wget tricks for the downloads that needed checkboxes, etc.

To download the jdk
$ wget -c --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u144-b01/090f390dda5b47b9b721c7dfaa008135/jdk-8u144-linux-x64.tar.gz

This worked better:
$ wget  --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie"  http://download.oracle.com/otn-pub/java/jdk/8u144-b01/090f390dda5b47b9b721c7dfaa008135/jdk-8u144-linux-x64.tar.gz

---

Sample usage of xargs:
    
    $ find . -name "*.txt" | xargs dos2unix

The quotation marks are important - may not work without them.

See also [Find](Find.md)

---
 
A few tricks into getting file content into the cut/past buffer:

Windows:

    cd %userprofile%/.ssh
    clip < somefile.txt

On Mac OS X or Linux:

    pbcopy < somefile.txt

On Linux ```xclip``` will work too:

    sudo apt-get install xclip
    xclip -sel clip < somefile.txt

---

About Steven's book on network programming, etc. On Mac:

    1. download, ungzip, and untar unpv12e.tar.gz from the net.
    2. cd to the unpv12e directory
    3. cp /usr/share/automake-1.15/config.* .

AVP: Actually, ```automake-1.15/lib/config.*```
And I had to add a bunch of tools to PATH.

    4. ./configure
    5. cd lib
    6. Edit the file lib/mcast_join.c replacing
    IPV6_ADD_MEMBERSHIP with IPV6_JOIN_GROUP
    7. Edit the file lib/mcast_leave.c replacing
    IPV6_DROP_MEMBERSHIP with IPV6_LEAVE_GROUP
    8. Still in the lib directory:
    make

To get the autoconf, etc.:

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
    curl -OL http://ftpmirror.gnu.org/automake/automake-1.15.tar.gz
    tar xzf automake-1.15.tar.gz
    cd automake-1.15
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

See also: [Autoconf](Autoconf.md)
See also: [Automake](Automake.md)
See also: [Libtool](Libtool.md)

---
