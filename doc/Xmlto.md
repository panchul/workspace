# XMLTo

https://fedoraproject.org/wiki/Infrastructure/Fedorahosted-retirement


---

// from http://www.linuxfromscratch.org/blfs/view/cvs/pst/xmlto.html

Install xmlto by running the following commands:

    LINKS="/usr/bin/links" \
    ./configure --prefix=/usr &&
    make

From the link above: 
 LINKS="/usr/bin/links": This environment variable fixes a bug causing xmlto to think that links command
 is the same as elinks. Setting this variable does not cause problem if links is not installed, unless
 you have ELinks installed, and wishes to use it for text backend post-processing, in which case, remove it.

To test the results, issue: make check.
Now, as the root user:

    make install

---
