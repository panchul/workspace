# Ubuntu

http://www.ubuntu.com

See Also:

  - [Linux](Linux.md)
  - [Alpine](Alpine.md)
  - [CentOS](CentOS.md)
  - [Debian](Debian.md)
  - [Fedora](Fedora.md)
  - [RedHat](RedHat.md)

---

Contents

- [Installing](Ubuntu.md#installing)
- [User Management](Ubuntu.md#User-management)
- [Networking](Ubuntu.md#Networking)
- [Miscellaneous](Ubuntu.md#miscellaneous)

---

## Installing

---

Installing VirtualBox on Ubuntu 20.04 LTS
https://www.cyberciti.biz/faq/how-to-install-virtualbox-on-ubuntu-20-04-linux-lts/

---

Installing Kubernetes on Ubuntu
https://phoenixnap.com/kb/install-kubernetes-on-ubuntu

---

Idiomatic installation sequence. (download, install, update, install more)

    # Only needed during first-time setup:
    wget http://packages.couchbase.com/releases/couchbase-release/couchbase-release-1.0-3-amd64.deb
    sudo dpkg -i couchbase-release-1.0-3-amd64.deb
    # Will install or upgrade packages
    sudo apt-get update
    sudo apt-get install libcouchbase-dev libcouchbase2-bin build-essential

---

Installing email server on Ubuntu.
https://www.tecmint.com/setup-postfix-mail-server-in-ubuntu-debian/

---

Dotnet on Ubuntu 20
https://tecadmin.net/how-to-install-net-core-on-ubuntu-20-04/

---

## User Management

---

To add a user:

    $ adduser newusername

It will ask for password, etc.

To add this user to the sudoers:

    $ usermod -aG sudo newusername

---

## Networking

---

For webservers and [Nginx](Nginx.md), you may also want to enable the firewall port, check the existing config and enable, e.g. like so:

    $ sudo ufw status

    $ sudo ufw enable

or, maybe

    $ sudo ufw allow 'Nginx Full'

Also allow https:

    $ sudo ufw allow 443

---

## Miscellaneous

---

Some HowTOs:
http://www.howtogeek.com/howto/ubuntu/install-an-rpm-package-on-ubuntu-linux/

---
