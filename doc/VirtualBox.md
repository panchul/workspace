# VirtualBox

See Also:
  - [Vagrant](Vagrant.md)
  - [Ansible](Ansible.md)
  - [VMWare](VMWare.md)

---

[https://www.virtualbox.org/](https://www.virtualbox.org/)  

Vagrant is a better way to use VirtualBox. However, if you have to,
there is a command-line api to VirtualBox inventory.

---

Idiomatic mount of a shared drive with the host(once you call your share ```MY_SHARE``` on the host):

    $ sudo mount -t vboxsf -o uid=$UID,gid=$(id -g) MY_SHARED ~/MY_SHARED

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

    $ apt-get install build-essentials
    
On Fedora 29:

    $ yum install kernel-develop-...    

---