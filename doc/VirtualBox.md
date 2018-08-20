

## Under Construction

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

