# Yum

See Also:

 - [Linux](Linux.md)
 - [aptitude](Aptitude.md)

---

List and backup all installed packages:

    $ rpm -qa --qf "%{NAME}\n" |\
    sort > /nas/installed-software-mm-dd-yyyy.log

Use the cat command to review list:

    $ cat /nas/installed-software-mm-dd-yyyy.log

To restore:

    $ yum -y install $(cat /nas/installed-software-mm-dd-yyyy.log)

More on backup-ing:

https://www.cyberciti.biz/tips/linux-get-list-installed-software-reinstallation-restore.html

---

To presume 'yes' on anything, use '-y':

    $ sudo yum -y install java-1.8.0-openjdk

---

To download packages to local location:

    $ yum install --downloadonly --downloaddir=<directory> <package>

`yumdownloader` is better, redhat says it will work with installed packages
https://access.redhat.com/solutions/10154

    $ yumdownloader <package>
    
---

Repositories are in `/etc/yum.repos.d/` directory.

To disable, you can change `enabled=1` to `enabled=0`

See if the package was installed using `rpm`:

    $ rpm -qa | grep -i mypackage
    
If there are no packages like that, it is ok to rust remove the files(with `rm`).    

Otherwise:

    $ rpm -e mypackage
    
---
