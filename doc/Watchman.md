# Watchman

An open-source utility to monitor changes in filesystem.

https://github.com/facebook/watchman

---

Quick demo of Watchman:

https://www.tecmint.com/watchman-monitor-file-changes-in-linux/

To install prerequisites:

    ----------- On Debian/Ubuntu ----------- 
    $ sudo apt install autoconf automake build-essential python-setuptools python-dev libssl-dev libtool 
    
    ----------- On RHEL/CentOS -----------
    # yum install autoconf automake python-setuptools python-devel openssl-devel libssl-devel libtool 
    # yum groupinstall 'Development Tools' 
    
    ----------- On Fedora -----------
    $ sudo dnf install autoconf automake python-setuptools openssl-devel libssl-devel libtool 
    $ sudo dnf groupinstall 'Development Tools'  
    
To build from sources:

    $ git clone https://github.com/facebook/watchman.git
    $ cd watchman
    $ git checkout v4.9.0  
    $ ./autogen.sh
    $ ./configure
    $ make
    $ sudo make install
    
---
