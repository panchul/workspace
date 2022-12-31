# VirtualBox

[https://www.virtualbox.org/](https://www.virtualbox.org/)  

Vagrant is a better way to use VirtualBox. However, if you have to,
there is a command-line api to VirtualBox inventory.

See Also:
  - [Vagrant](Vagrant.md)
  - [Ansible](Ansible.md)
  - [VMWare](VMWare.md)

##Content

 - [Installing](#installing)
 - [Shared Folders](#shared-folders)
 - [Miscellaneous](#miscellaneous)

## Installing

---

Installing VirtualBox on Ubuntu 20.04 LTS
https://www.cyberciti.biz/faq/how-to-install-virtualbox-on-ubuntu-20-04-linux-lts/

---

Issues with the kernel drivers:

https://www.howtogeek.com/658047/how-to-fix-virtualboxs-%E2%80%9Ckernel-driver-not-installed-rc-1908-error/

(let the Oracle do stuff in the privacy tab in system settings)

---

## Shared Folders

---

Idiomatic mount of a shared drive with the host(once you call your share `MY_SHARE` on the host):

    $ sudo mount -t vboxsf -o uid=$UID,gid=$(id -g) MY_SHARED ~/MY_SHARED

---

Mounting VirtualBox shared folders

https://gist.github.com/estorgio/1d679f962e8209f8a9232f7593683265







---

## Miscellaneous

---

List virtual machines:

    $ VBoxManage list vms

or only the ones running:

    $ VBoxManage list runningvms

---

Setting up a network between vm and host
https://www.tecmint.com/network-between-guest-vm-and-host-virtualbox/

---

For the guest additions, kernel headers

On Ubuntu:

    $ apt-get install build-essential
    
On Fedora 29:

    $ yum install kernel-develop-...    

---
