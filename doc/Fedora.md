# Fedora

---

Multimedia plugins for Firefox:

https://docs.fedoraproject.org/en-US/quick-docs/assembly_installing-plugins-for-playing-movies-and-music/

    $ sudo dnf install gstreamer1-plugins-{bad-\*,good-\*,base} gstreamer1-plugin-openh264 gstreamer1-libav --exclude=gstreamer1-plugins-bad-free-devel
    $ sudo dnf install lame\* --exclude=lame-devel
    $ sudo dnf group upgrade --with-optional Multimedia

---

For the kernel modules:

    $ sudo yum install kernel-devel

---

Archieves, like Fedora 25 for legacy CUDA drivers:
https://archives.fedoraproject.org/pub/archive/fedora/linux/releases/

---

To setup Fedora's root password, after initial installation,
use `passed` from under the regular login(that is a sudoer):

    $ sudo passwd root

---

Cuda seems to have the repositories for Fedora 29 latest.

---

Networking CLI interface
https://fedoraproject.org/wiki/Networking/CLI
e.g.

    $ nmcli general status
    
---

Fedora has a few desktops by default.
Switching using Alt-F1, Alt-F2, ..., and Alt-Tab works.

---
