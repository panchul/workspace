

## UNDER CONSTRUCTION

#Linux


See Also:

  - [Alpine](Alpine.md)
  - [Ubuntu](Ubuntu.md)
 
  - [Curl](Curl.md)
  - [Ipvsadm](ipvsadm.md)
  - [tar](tar.md)
  - [tcpdump](tcpdump.md)
  - [nohup](nohup.md)
 
 
---

To write to syslog, ```/var/log/syslog```:

```
   #include <syslog.h>
   int main(int argc, char *argv[])
   {
        openlog("mytestlog", LOG_PERROR, LOG_USER);
        syslog(LOG_INFO, "something %d", 123);
       	closelog();
  	} 
```
 
---

How to compile Linux kernel
https://www.linux.com/learn/intro-to-linux/2018/4/how-compile-linux-kernel-0
 
---

Quick simple demo of using systemd services (I have a better how-to on services in the sandbox)
https://www.linux.com/blog/learn/intro-to-linux/2018/5/writing-systemd-services-fun-and-profit     

---

Idiomatic passing parameters in bash, flag ‘-e’ for echo and ‘@-‘ for curl:

    $ echo -e "[MYSETTING_1]\nsomeValue=123" | curl --data-binary @- http://128.0.0.1/myapi/consume

    OK
 
---

Interesting resource on setuid in Unix, and why the shebang symbols should end in ‘-‘:
http://www.faqs.org/faqs/unix-faq/faq/part4/section-7.html

---

Easily Encrypt your Flash Drives with Linux
[https://www.linux.com/learn/easily-encrypt-your-flash-drives-linux](https://www.linux.com/learn/easily-encrypt-your-flash-drives-linux)


## Installation

### Installing using USB

[https://en.wikipedia.org/wiki/Live_USB](https://en.wikipedia.org/wiki/Live_USB)

LiLi:
[http://www.linuxliveusb.com/en/download](http://www.linuxliveusb.com/en/download)


---

Monit

https://mmonit.com/monit/

---

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

---

#### cowsay, cowthink, xcowsay

```sudo apt-get install xcowsay``` - installs it (Ubuntu)

To get a temporary pop-up with a cute picture saying your line:

    $ xcowsay Hello there, I am using xcowsay. Ok, Moo-o-o-o

The plain text version works fine in the terminal. 

    $ cowsay "Screw you guys I am going home. Moo-o-o-o"
     _________________________________
    / Screw you guys I am going home. \
    \ Moo-o-o-o                       /
     ---------------------------------
            \   ^__^
             \  (oo)\_______
                (__)\       )\/\
                    ||----w |
                    ||     ||

---

# Ubuntu

http://www.howtogeek.com/howto/ubuntu/install-an-rpm-package-on-ubuntu-linux/

See Also [Ubuntu](Ubuntu.md)

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

See Also [ipvsadm](ipvsadm.md)

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

Example of start/stop scrips on RedHat:
https://access.redhat.com/discussions/1455613

The Linux Standards Base documents requirements for initscripts:
    http://refspecs.linuxbase.org/LSB_5.0.0/LSB-Core-generic/LSB-Core-generic/tocsysinit.html


The script is below, here is how to plug it in:

    $ chmod 755 /etc/init.d/oracle_oem
    $ chkconfig oracle_oem on

There is a script 'skeleton' in /etc/init.d/, that should be a template for adding daemons.

Here is the script, add it into file ```/etc/init.d/oracle_oem```
The line ```# chkconfig: 2345 99 01``` is about runlevel actions. See ```man chkconfig```

    #!/bin/bash
    #
    # oracle Start up the oracle software
    #
    # chkconfig: 2345 99 01
    # description: Oracle Enterprise Manager start/stop script \
    #              and because of the backslash, this is the second line in the description
    #
    # source function library
    #
    source /etc/rc.d/init.d/functions
    
    RETVAL=0
    prog="oracle_oem"
    
    lockfile=/var/lock/subsys/$prog
    
    start()
    {
        # "start commands"
    }
    
    stop()
    {
        # "stop commands"
    }
    
    restart()
    {
        stop
        sleep 15
        start
    }
    
    case "$1" in
    start)
        touch $lockfile
        start
        ;;
    stop)
        rm -f $lockfile
        stop
        ;;
    restart)
        restart
        ;;
    *)
        echo $"Usage: $0 {start|stop|restart}"
        RETVAL=2
    esac
    exit $RETVAL


---

Alpine Linux is a lightweight distro. 

https://alpinelinux.org/
https://en.wikipedia.org/wiki/Alpine_Linux

```apk``` packaging tool.

---

Nice page about ssh login. See also [SSH.md](SSH.md)
http://www.linuxproblem.org/art_9.html

---

Quick idiomatic pattern to install a service on Linux with yum:

    if ! rpm -qa | grep -qw ntp; then
        yum install ntp
    fi

And the pattern to set it up running:

    # Start ntpd if it's not already running.
    if ps aux | grep -v grep | grep "[n]tpd" > /dev/null
    then
        echo "ntpd is running." > /dev/null
    else
        /sbin/service ntpd restart > /dev/null
        echo "Started ntpd."
    fi
    # Make sure ntpd is enabled on system startup.
    chkconfig ntpd on

---

To see 100 biggest files this idiom could be helpful:

    $ sudo du -m | sort -n | tail -n 100

du in megabytes.
sorting with numeric mode.
last 100 lines of the output.

Something like this would also work to find what's taking space:

    $ sudo find / -type f -size +1000M -exec ls -lh {} \; 

---

Simple way to see the statistics of the sytem on a vm. The fact that it prints it
one by line, could be a good feed for the kafka console producer/consumer:

    $ vmstat -a 1 -n 100
    procs -----------memory---------- ---swap-- -----io---- -system-- ------cpu-----
    r  b   swpd   free  inact active   si   so    bi    bo   in   cs us sy id wa st
    1  0      0 1569096 326080 993940    0    0    35    15   87  290  1  0 98  0  0
    0  0      0 1568900 326080 993952    0    0     0     0  250  658  1  0 99  0  0
    0  0      0 1568924 326080 993952    0    0     0     0  170  666  2  1 98  0  0
    0  0      0 1568924 326080 993952    0    0     0     0  192  564  1  1 99  0  0
    0  0      0 1568900 326080 993952    0    0     0     0  136  516  1  0 99  0  0
    1  0      0 1568900 326080 993952    0    0     0     0  134  520  1  1 99  0  0
    ^C

Now where the Kafka is:

    $ ./kafka-topics.sh --zookeeper 192.168.10.56:2181,192.168.10.57:2181 --replication-factor 2 --partitions 5 --topic myvmstat --create
    Created topic "myvmstat".

On consumer side:

    $ ./kafka-console-consumer.sh --zookeeper 192.168.10.56:2181,192.168.10.57:2181 --topic myvmstat

On producer side:

    $ vmstat -a 1 -n 100 | ./kafka-console-producer.sh --broker-list 192.168.10.61:9092,192.168.10.62 --topic myvmstat 

See the data stream in.

You can observe the offsets using a command like this:

    $kafka-run-class.sh kafka.tools.GetOffsetShell --broker-list kafka-broker1.vm:9092,kafka-broker2.vm:9092,kafka-broker3.vm:9092 --topic mytopic --time -1
    mytopic:0:109

where -1 means the latest offset. And then '0' is the first partition, '109' is the latest offset (if we fed 102 messages)

---

Adding swap space 
    
    $ dd if=/dev/zero of=/swapfile bs=1024 count=8192000
    $ chmod 600 /swapfile
    $ mkswap /swapfile

Make swapfile immediately available :

    $ swapon  /swapfile

Permanent swap file entry:

    $ echo "/swapfile       none       swap       sw.    0   0" >> /etc/fstab 
---

Quick script I wrote to add a new volume to aws instance, and mount it to ```/data```
(there is a page on aws website that explains what it is)

    mybootstrap.sh
    =========================
    #!/usr/bin/env bash
    
    # not related to volumes, but too cute an idiom to throw out
    sudo sh -c "cat >> /etc/hosts " << 'EOF'
    1.2.3.4  some.server.test.com  
    EOF

    lsblk
    sudo file -s /dev/xvdb
    pause "should be data, if not, check what is going on - you might lose data"
    sudo mkfs -t ext4 /dev/xvdb
    sudo mkdir -p /data
    
    sudo file -s /dev/xvdb
    sudo cp /etc/fstab /etc/fstab.orig
    
    # prints the uuid
    sudo file -s /dev/xvdb | awk '{printf "%s    /data ext4 defaults,nofail 0 2\n", $8}' > myvolume
    sudo sh -c "cat myvolume >> /etc/fstab "
    
    sudo mount -a
    
    ls -la /data
    ===========================

Yay, the volume is there.

---

A few notes on systemd journal rate update
https://www.rootusers.com/how-to-change-log-rate-limiting-in-linux/
(seem to be a neat website)

---

Change the lineendings in the vi:

    :e ++ff=dos
    :e ++ff=mac
    :e ++ff=unix

This can also be used as saving operation (:w alone will not save using the lineendings you see on screen):

    :w ++ff=dos
    :w ++ff=mac
    :w ++ff=unix

And you can use it from the command-line:

    for file in $(ls *.txt)
    do 
      vi +":w ++ff=unix" +":q" ${file}
    done

--

