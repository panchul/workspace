[Home](Readme.md)
# Linux

See Also:

  - Distributions
    - [Alpine](Alpine.md)
    - [Arch](Arch.md)
    - [CentOS](CentOS.md)
    - [Debian](Debian.md)
    - [Fedora](Fedora.md)
    - [RedHat](RedHat.md)
    - [Ubuntu](Ubuntu.md)
  - [XWindows](XWindows.md)
  - [Grub](Grub.md)
  - [Kernel](Kernel.md)
  - [Samba](Samba.md)
  - Shells 
    - [bash](Bash.md)
  - Commands and utilities
    - [Cron](Cron.md)
    - [Curl](Curl.md)
    - file
    - [grep](Grep.md)
    - [Ipvsadm](Ipvsadm.md)
    - [mail](Mail.md)
    - [nohup](Nohup.md)
    - [sed](Sed.md)
    - [syslog](Syslog.md)
    - [tar](Tar.md)
    - [tcpdump](Tcpdump.md)
    - [watch](Watch.md)
  - Networking-related
    - [Firewall](Firewall.md)
    - [DNS](DNS.md)
    - [Postman](Postman.md)
    - [Wireshark](Wireshark.md)
  - Programming concepts
    - [Semaphore](Semaphore.md) 
    - [Mutex](Mutex.md) 

---

# Content

 - [File System](Linux.md#file-system)
 - [Networking](Linux.md#networking)
 - [Installation](Linux.md#installation)
 - [Linux Kernel](Linux.md#linux-kernel)
 - [Security](Linux.md#security)
 - [Miscellaneous](Linux.md#miscellaneous)

---

## File System

---

Mounting VirtualBox shared folders

See [VirtualBox/SharedFolders](VirtualBox.md#shared-folders)

---

## Networking

---

Nice summary of networking utilities:
https://www.tecmint.com/linux-networking-commands/
 
---

About setting SO_LINGER in socket networking
http://alas.matf.bg.ac.rs/manuals/lspe/snode=105.html

```
    ...
    struct linger so_linger;
	so_linger.l_onoff = 1;	//TRUE;
	so_linger.l_linger = 0; // timeout sec
	int z = setsockopt(connfd,
	SOL_SOCKET,
	SO_LINGER, &so_linger, sizeof(so_linger));
	if (z)
		perror("setsockopt(2)");
	
	close(connfd);
	...
```
 
---

How to setup `firewalld` on CentOS 8
https://www.cyberciti.biz/faq/how-to-set-up-a-firewall-using-firewalld-on-centos-8/

See [Firewall](Firewall.md)

---

# Ubuntu

http://www.howtogeek.com/howto/ubuntu/install-an-rpm-package-on-ubuntu-linux/

See Also [Ubuntu](Ubuntu.md)

---

grub issues, broken packager 

On Ubuntu vm setup in VirtualBox on macOS via Vagrant.
Had something wrong with `grub` on a vm, needed to run `sudo dpkg --configure -a` to get
the packager work better.

---

html5, flash, etc.

Here is how you could get html5 working on ubuntu:

    $ sudo apt-get install ubuntu-restricted-extras
    
(http://askubuntu.com/questions/475351/firefox-html5-video-support )

---

To update the OS, run these:

    $ sudo apt-get -y update
    $ sudo apt-get -y upgrade

---

Install languages from command line

    $ sudo apt-get install language-pack-[cod] language-pack-gnome-[cod] language-pack-[cod]-base language-pack-gnome-[cod]-base 

For Gnome there is also:

    $ gnome-language-selector --install [cod]
    
---
    
OpenVPN

Build a Real VPN with OpenVPN:

https://www.linux.com/learn/intro-to-linux/2017/3/build-real-vpn-openvpn


---

## Linux Kernel

https://kernelnewbies.org/FAQ  - nice FAQ

See Also [ipvsadm](Ipvsadm.md)

---

How to compile Linux kernel
https://www.linux.com/learn/intro-to-linux/2018/4/how-compile-linux-kernel-0

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

## Security

---

bash fork bomb:

    :(){ :|:& };:

Which is an obfuscated:

    bomb(){
      bomb | bomb &
    }
    bomb

To kill it:

    $ killall -STOP -u someuser

---

Another self-destroying idiom (with sudo) :-)

    $ rm -rf --no-preserve-root /

---

wget tricks for the downloads that needed checkboxes, etc.

To download the jdk

    $ wget -c --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u144-b01/090f390dda5b47b9b721c7dfaa008135/jdk-8u144-linux-x64.tar.gz

This worked better:

    $ wget  --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie"  http://download.oracle.com/otn-pub/java/jdk/8u144-b01/090f390dda5b47b9b721c7dfaa008135/jdk-8u144-linux-x64.tar.gz

And it is nice to keep quiet, so the progress bar is not spamming the terminal in a shell script execution

    $ wget --no-verbose http://download.oracle.com/otn-pub/java/jdk/8u144-b01/090f390dda5b47b9b721c7dfaa008135/jdk-8u144-linux-x64.tar.gz
    
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

The Linux Standards Base documents requirements for init scripts:
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

`apk` packaging tool.

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

Simple way to see the statistics of the system on a vm. The fact that it prints it
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

    $ kafka-run-class.sh kafka.tools.GetOffsetShell --broker-list kafka-broker1.vm:9092,kafka-broker2.vm:9092,kafka-broker3.vm:9092 --topic mytopic --time -1
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

Change the line endings in the vi:

    :e ++ff=dos
    :e ++ff=mac
    :e ++ff=unix

This can also be used as saving operation (:w alone will not save using the line endings you see on screen):

    :w ++ff=dos
    :w ++ff=mac
    :w ++ff=unix

And you can use it from the command-line:

    for file in $(ls *.txt)
    do 
      vi +":w ++ff=unix" +":q" ${file}
    done

---

Exit status of a command:

    $ ls -l /tmp
    $ status=$?
    $ echo "ls command exit stats - $status"

Exit status is 0 if OK, 1 if minor problems(warnings), 2 if serious errors. 

Another example:

    ...
    if grep "^$username:" /etc/passwd >/dev/null
    then
	  echo "User '$username' found in $PASSWD_FILE file."
    else
	  echo "User '$username' not found in $PASSWD_FILE file."
    fi
    
See more in [bash](Bash.md)

---

Quick way to see what is going on at the host, e.g. process comes up or down:

    $ watch -d "ps -ef | grep myprogram"

---

    $ repeat 100 echo "I will not automate this punishment."

Will echo 100 times and then stop.

A similar command –  pause between repeats, and it repeats forever. For example,

    $ repeat 100 0 echo "I will not automate this punishment."
    $ repeat -1 5 echo "This will get echoed every 5 seconds forever."

---

Install .rpm File on Linux(CentOS, Fedora, etc.):

    $ sudo rpm –i sample_file.rpm

Alternately, you can use the yum package manager to install .rpm files(`localinstall`
makes `yum` look into the current working directory for the install file.

    $ sudo yum localinstall sample_file.rpm
    
---

`hostnamectl` gives some interesting info:

    alexp@mybox33:~$ hostnamectl
     Static hostname: mybox33
           Icon name: computer-vm
             Chassis: vm
          Machine ID: 234657abc25df23451346234623467257
             Boot ID: cab236257324572457fe1234235252523
      Virtualization: oracle
    Operating System: Ubuntu 18.04.3 LTS
              Kernel: Linux 4.15.0-64-generic
        Architecture: x86-64

---

About Linux services
https://www.cyberciti.biz/tips/check-unix-linux-configuration-file-for-syntax-errors.html

---

About disk utilities. Not sure if you care about defragmentation on SSDs, but might still make sense:
https://www.tecmint.com/defragment-linux-system-partitions-and-directories

---

Repeat execution using `watch`

    $ watch free -m

This will run every 1 second:

    $ watch -n 1 date

---

Show top 3 processes sorted by CPU usage

    $ ps aux --sort=-pcpu | head -n 4

Show top 3 processes sorted by memory usage

    $ ps aux --sort=-rss | head -n 4

---

Create log files for scripts executed by crontab:

    0 22 * * 1-5 /opt/scripts/send-report.sh 2>/var/log/scripts/report-error.log

---

Check if a process is running

    $ pgrep -x mysqld >/dev/null && echo "Process found" || echo "Process not found"
    $ pgrep -x httpd >/dev/null && echo "Process found" || echo "Process not found"

    $ pidof httpd >/dev/null && echo "Service is running" || echo "Service NOT running"
    $ pidof nginx >/dev/null && echo "Service is running" || echo "Service NOT running"

    $ ps -C httpd >/dev/null && echo "Running" || echo "Not running"
    $ ps -C nginx >/dev/null && echo "Running" || echo "Not running"

    $ systemctl status {service}
    $ systemctl status sshd
    $ systemctl status nginx

Older alternative to systemctl is `$sudo service {service} status`

A script to us it:

    #!/bin/bash
    SERVICE="nginx"
    if pgrep -x "$SERVICE" >/dev/null
    then
        echo "$SERVICE is running"
    else
        echo "$SERVICE stopped"
        # uncomment to start nginx if stopped
        # systemctl start nginx
        # mail
    fi
    
---

Utility `script` can record the terminal sessions:

    $ script mysession
    do whatever
    $ exit
    
To play it back:

    $ script -p mysession
    
---

## Miscellaneous

---

    $ du -sh * | sort -h | tail -4
    4.0K	Templates
    8.0K	aaa
    2.0M	test
    5.7G	tmp

---

`timeout` command, you can specify the time duration, the command, and
the way the process is terminated.

    $ timeout -k=5 2m command1 arg1
    $ timeout -k=5 -s SIGKILL 2m /path/to/my-app arg1 arg2
    $ timeout -s 9 YourCommandHere
    $ timeout --signal=9 YourCommandHere
    $ timeout -s 15 30s tracepath google.com
    $ timeout -s 9 2m tail -F /var/log/secure
    $ timeout -s SIGTERM 5m ping google.com

The signals available:

    $ kill -l
     1) SIGHUP	 2) SIGINT	 3) SIGQUIT	 4) SIGILL	 5) SIGTRAP
     6) SIGABRT	 7) SIGBUS	 8) SIGFPE	 9) SIGKILL	10) SIGUSR1
    11) SIGSEGV	12) SIGUSR2	13) SIGPIPE	14) SIGALRM	15) SIGTERM
    16) SIGSTKFLT	17) SIGCHLD	18) SIGCONT	19) SIGSTOP	20) SIGTSTP
    21) SIGTTIN	22) SIGTTOU	23) SIGURG	24) SIGXCPU	25) SIGXFSZ
    26) SIGVTALRM	27) SIGPROF	28) SIGWINCH	29) SIGIO	30) SIGPWR
    31) SIGSYS	34) SIGRTMIN	35) SIGRTMIN+1	36) SIGRTMIN+2	37) SIGRTMIN+3
    38) SIGRTMIN+4	39) SIGRTMIN+5	40) SIGRTMIN+6	41) SIGRTMIN+7	42) SIGRTMIN+8
    43) SIGRTMIN+9	44) SIGRTMIN+10	45) SIGRTMIN+11	46) SIGRTMIN+12	47) SIGRTMIN+13
    48) SIGRTMIN+14	49) SIGRTMIN+15	50) SIGRTMAX-14	51) SIGRTMAX-13	52) SIGRTMAX-12
    53) SIGRTMAX-11	54) SIGRTMAX-10	55) SIGRTMAX-9	56) SIGRTMAX-8	57) SIGRTMAX-7
    58) SIGRTMAX-6	59) SIGRTMAX-5	60) SIGRTMAX-4	61) SIGRTMAX-3	62) SIGRTMAX-2
    63) SIGRTMAX-1	64) SIGRTMAX	

To check it:

    $ date
    $ timeout 8s ping www.mywebsite.com/slow_api
    $ date
    
---

Using `file`, to find the types of files.
https://www.tecmint.com/find-file-types-in-linux/

TODO: make a summary

---

A few nice tricks to monitor memory.
https://www.tecmint.com/find-processes-by-memory-usage-top-batch-mode/

For example, to use `top`'s batch mode, get top memory-using apps:

    $ top -b -o +%MEM | head -n 22 > topreport.txt
    
---

A Collection of windows managers
https://www.tecmint.com/best-tiling-window-managers-for-linux/

---

To see the distribution id, release name, codename, etc.:

    $ lsb_release -a
    No LSB modules are available.
    Distributor ID:	Ubuntu
    Description:	Ubuntu 18.04.4 LTS
    Release:	18.04
    Codename:	bionic

Or,

    $ cat /etc/*rel*
    DISTRIB_ID=Ubuntu
    DISTRIB_RELEASE=18.04
    DISTRIB_CODENAME=bionic
    DISTRIB_DESCRIPTION="Ubuntu 18.04.4 LTS"
    NAME="Ubuntu"
    VERSION="18.04.4 LTS (Bionic Beaver)"
    ID=ubuntu
    ID_LIKE=debian
    PRETTY_NAME="Ubuntu 18.04.4 LTS"
    VERSION_ID="18.04"
    HOME_URL="https://www.ubuntu.com/"
    SUPPORT_URL="https://help.ubuntu.com/"
    BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"
    PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy"
    VERSION_CODENAME=bionic
    UBUNTU_CODENAME=bionic

---

The right way to run the infamous rm command is to specify `--no-preserve-root`:

    $ sudo rm -rf --no-preserve-root /
    
---

How to reset forgotten root password in CentOS 8.
https://www.tecmint.com/reset-forgotten-root-password-in-centos-8/

---

Neat utility `cloc` - Count Lines Of Code, in many programming languages, and per folder recursively.
https://www.tecmint.com/cloc-count-lines-of-code-in-linux/

For example the old pxl repo:

    $ cloc .
    github.com/AlDanial/cloc v 1.84  T=88.97 s (161.2 files/s, 48350.3 lines/s)
    ---------------------------------------------------------------------------------------
    Language                             files          blank        comment           code
    ---------------------------------------------------------------------------------------
    C++                                   5226         510646         362469        1444362
    HTML                                  3182         125937          17126         717098
    C/C++ Header                          3566          96693         101503         288808
    make                                   376          19409          13557          73250
    Prolog                                 517          10417          16555          73110
    C                                      214          13820          21069          61356
    XML                                    306          32237             46          61052
    Perl                                   244          11847           2290          44906
    Windows Resource File                   89           3869           3128          41413
    MSBuild script                         125              0              0          40602
    Java                                   189           2837           1911          14181
    JavaScript                              32           1247            258          13308
    SWIG                                     4           3940              0           9875
    Markdown                                23           2515              0           8833
    Python                                  40           2142           3845           7713
    XMI                                      2              0              0           6578
    Bourne Shell                            30            342            713           1769
    CSS                                      8             89             48           1640
    Assembly                                 6            283            511           1045
    MATLAB                                  14            298            168            915
    D                                        9              0              0            591
    m4                                       6             77             61            543
    Pascal                                   2            106             59            538
    CMake                                    4            115            264            488
    Windows Module Definition               39            118             30            473
    Bourne Again Shell                       4            109            234            392
    INI                                     45              0              0            311
    XSLT                                     1             28              2            202
    SVG                                      3              1              1            184
    SAS                                      3             50             90            174
    Smalltalk                                4              9              0            162
    DOS Batch                               15             44             16            161
    Mathematica                              6             77              0            156
    YAML                                     2             21             17            140
    WebAssembly                              1             27              0             76
    yacc                                     1             14              2             33
    Patran Command Language                  1              0              0             22
    C Shell                                  1              5              0             14
    ---------------------------------------------------------------------------------------
    SUM:                                 14340         839369         545973        2916474
    ---------------------------------------------------------------------------------------

---

Screen recorders for desktop screen recording in Linux
https://www.tecmint.com/best-linux-screen-recorders-for-desktop-screen-recording/

---

Neat overview/catalog of all sorts of applications on Linux
https://www.fossmint.com/awesome-linux-software/

---

Flowchart and diagram drawing software for Linux
https://www.tecmint.com/best-flowchart-and-diagramming-software-for-linux/

---

Seem to work on different distributions (Ubuntu, Fedora, etc.)
To boot without X one time, add `systemd.unit=multi-user.target` to the linux command line in GRUB.
To make this the default, use

    $ sudo systemctl set-default multi-user.target

To return to default booting into X, use

    $ sudo systemctl set-default graphical.target

To see the current default target,

    $ sudo systemctl get-default

For those who don't know how to edit GRUB command: press `Shift` during boot,
and press `e` to edit selected boot command.

    $ sudo vi /etc/default/grub

Comment out `GRUB_CMD_LINE_LINUX_DEFAULT` line by adding prefix `#`,
modify `GRUB_CMD_LINE_LINUX` to `"text"`, and uncomment `GRUB_TERMINAL=console`.
Then save and

    $ sudo update-grub

---

Neat review of basic commands
https://www.tecmint.com/linux-commands-cheat-sheet/
TODO: do the summary

---

Installing misc tools
https://www.cyberciti.biz/faq/how-to-install-whois-on-rhel-8-centos-8/

On CentOS 8:

    $ sudo yum install epel-release
    $ sudo yum config-manager --set-enabled PowerTools
    $ sudo yum repolist
    $ sudo yum search whois
    $ sudo yum info whois
    $ sudo yum install whois

On RHEL:

    $ sudo yum install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
    $ sudo subscription-manager repos --enable "codeready-builder-for-rhel-8-*-rpms"
    $ sudo yum repolist
    $ sudo yum search whois
    $ sudo yum info whois
    $ sudo yum install whois

--

Mutexes vs semaphores demo:

    // Task 1
    pthread_mutex_lock(mutex_thing);
    // Safely use shared resource
    pthread_mutex_unlock(mutex_thing);
 
    // Task 2
    pthread_mutex_lock(mutex_thing);
    // Safely use shared resource
    pthread_mutex_lock(mutex_thing);

The semaphore scenario is more like signalling between the processes:

    /* Task 1 - Producer */
    sema_post(&sem);   // Send the signal

    /* Task 2 - Consumer */
    sema_wait(&sem);   // Wait for signal
  
---

To write to syslog, `/var/log/syslog`:

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

Here's how to get the nanosecond time('N' is nanoseconds) in bash:

    $ while true; do echo $(($(date "+%s%N")/1000000)); done;

More at https://stackoverflow.com/questions/16548528/command-to-get-time-in-milliseconds
 
---

Quick simple demo of using systemd services (I have a better how-to on services in the sandbox)
https://www.linux.com/blog/learn/intro-to-linux/2018/5/writing-systemd-services-fun-and-profit

---

Idiomatic passing parameters in bash, flag ‘-e’ for echo and ‘@-‘ for curl:

    $ echo -e "[MYSETTING_1]\nsomeValue=123" | curl --data-binary @- http://128.0.0.1/myapi/consume

    OK
 
---

Interesting resource on `setuid` in Unix, and why the shebang symbols should end in ‘-‘:
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

Command-line utilities for image processing:
https://www.linux.com/learn/cool-linux-command-line-image-management-hacks

`feh`

```sudo apt-get install feh``` - installs it (Ubuntu)

To list the files with the dimensions:

    $ feh -l
    NUM	FORMAT	WIDTH	HEIGHT	PIXELS	SIZE	ALPHA	FILENAME
    1	jpeg	2187	1458	  3M	  2M	-	./IMG_8408.JPG    

`identify` from imagemagick

`sudo apt-get install imagemagick` - installs it (Ubuntu)

To get information about a file:

    $ identify ./IMG_8455.JPG 
    ./IMG_8455.JPG JPEG 2592x1728 2592x1728+0+0 8-bit DirectClass 4.338MB 0.000u 0:00.000

`identify -verbose ./IMG_8455.JPG` gives much more info.

Pretty neat for the summary of what is out there:

    $ find . -iregex ".*\.\(jpg\|png\)" -exec identify {} \;
    ./somefolder/anotherone/IMG_8408.JPG JPEG 2187x1458 2187x1458+0+0 8-bit DirectClass 2.61MB 0.000u 0:00.000

---

Cute utilities `cowsay, cowthink, xcowsay`

`sudo apt-get install xcowsay` - installs it (Ubuntu)

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
