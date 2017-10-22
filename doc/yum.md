
## Under Construction

# Yum

See Also:
 [Linux](Linux.md)
 [aptitude](aptitude.md)


---

To presume 'yes' on anything, use '-y':

    $ sudo yum -y install java-1.8.0-openjdk

---

To download packages to local location:

    $ yum install --downloadonly --downloaddir=<directory> <package>

```yumdownloader``` is better, redhat says it will work with installed packages
https://access.redhat.com/solutions/10154

    $ yumdownloader <package>
    
---