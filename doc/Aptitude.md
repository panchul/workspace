# Aptitude and APT

`aptitude`, that is, `apt-get`, etc. is a Debian packaging tool.
(Advanced Package Tool)

See Also:

 - dpkg 
 - [Linux](Linux.md)
 - [npm](Npm.md)
 - packman
 - snap
 - [yum](Yum.md)

---

**Contents**

- [Miscellaneous](Aptitude.md#miscellaneous)

---

## Miscellaneous

---

---

Nuances between `apt` and `aptitude`
https://www.tecmint.com/difference-between-apt-and-aptitude

---

To skip the stdin's asking for key `y`, use `'-y'`:

    sudo apt-get install -y somenicepackage
    
---

To install a .deb file:
    
    $ sudo dpkg -i /path/to/deb/file
    $ sudo apt-get install -f .

or

    $ sudo apt install /path/to/package/name.deb
    
---
