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

Installing Kubernetes on Ubuntu
https://phoenixnap.com/kb/install-kubernetes-on-ubuntu

---

Some HowTOs:
http://www.howtogeek.com/howto/ubuntu/install-an-rpm-package-on-ubuntu-linux/

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

--