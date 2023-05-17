# tar

See Also:

 - [Linux](Linux.md)

---

**Contents**

- [Miscellaneous](Tar.md#miscellaneous)

---

## Miscellaneous

---

Using tar over ssh
From https://www.cyberciti.biz/faq/howto-use-tar-command-through-network-over-ssh-session/

Syntax for using tar command over ssh.

Ssh into box and run the tar command:

    $ ssh user@box tar czf - /dir1/ > /destination/file.tar.gz

or

    $ ssh user@box 'cd /dir1/ && tar -cf - file | gzip -9' >file.tar.gz

The following command backups `/wwwdata` directory to `dumpserver.nixcraft.in` (IP 192.168.1.201) host over ssh session:

    $ tar zcvf - /wwwdata | ssh user@dumpserver.nixcraft.in "cat > /backup/wwwdata.tar.gz"

OR

    $ tar zcvf - /wwwdata | ssh vivek@192.168.1.201 "cat > /backup/wwwdata.tar.gz"

Sample outputs:

    tar: Removing leading `/' from member names
    /wwwdata/
    /wwwdata/n/nixcraft.in/
    /wwwdata/c/cyberciti.biz/
    ....
    ..
    ...
    Password:

In this example archive /data2/ with gpg:

    $ tar zcf - /data2/ | gpg -e | ssh vivek@nas03 'cat - > data2-dd-mm-yyyy.tar.gz.gpg'

Please note that you may get an error that read as follows with ssh command when using with
sudo or any other command that needs a pseudo-terminal allocation:

    sudo: sorry, you must have a tty to run sudo

To avoid this problem pass the -t option to the ssh command:

    $ tar zcvf - /wwwdata | ssh -t vivek@192.168.1.201 "sudo cat > /backup/wwwdata.tar.gz"

Use of tar command over ssh sessions

Copying from the remote machine (server1.cyberciti.biz) to local system is as follows:

    $ cd /path/local/dir/
    $ ssh vivek@server1.cyberciti.biz 'tar zcf - /some/dir' | tar zxf -

Linux system hard drive backup/mirror using tar and ssh
Let us copy the entire hard disk drive named /dev/sdvf from local machine to the remote AWS EC2 cloud backup server:

    $ dd if=/dev/sdvf | ssh backupimg@vpc-aws-mumbai-backup-001 'dd of=prod-disk-hostname-sdvf-dd-mm-yyyy.img'

To restore a local drive from the image on the server, reverse the command:
One can restore a local hard disk drive from the image stored on the remote AWS EC2 cloud backup server as follows:

    $ ssh backupimg@vpc-aws-mumbai-backup-001 'dd if=prod-disk-hostname-sdvf-dd-mm-yyyy.img' | dd of=/dev/sdvf

Moving data to a new Linux system

The problem with scp and other command copying the directory structure is that Symbolic links, special
devices, sockets, named pipes, and other stuff not copied. Hence, we use tar over ssh. For example,
copy all data from nuc-box. Open the terminal on x230 laptop and run the ssh command along with tar command:

    $ ssh vivek@nuc-box 'tar czf - /home/vivek' | tar xvzf - -C /home/vivek
    
Use tar command through network over SSH session for tape device

The default first SCSI tape drive under Linux is /dev/st0. You can read more about tape drives naming
 convention used under Linux here. You can also use dd command for clarity purpose:

    $ tar cvzf - /wwwdata | ssh root@192.168.1.201 "dd of=/backup/wwwdata.tar.gz"

It is also possible to dump backup to remote tape device:

    $ tar cvzf - /wwwdata | ssh root@192.168.1.201 "cat > /dev/nst0"

One can can use mt command to rewind tape and then dump it using cat command:

    $ tar cvzf - /wwwdata | ssh root@192.168.1.201 $(mt -f /dev/nst0 rewind; cat > /dev/nst0)$

---

How to extract tar over ssh

    $ cat my-data.tar.gz | ssh user@server1.cyberciti.biz "tar zxvf -"
    $ cat my-data.tar.gz | ssh user@server1.cyberciti.biz "cd /path/to/dest/; tar zxvf -"

In this example, restore tar backup over ssh session from the remote machine to local dir:

    $ cd /
    $ ssh root@192.168.1.201 "cat /backup/wwwdata.tar.gz" | tar zxvf -

Use ssh keys to get rid of passwords(for scripts, cron jobs, etc).

---

The `pv` command allows you to see the progress of data through a pipeline:
    
    $ cd /dir/to/backup/
    $ tar zcf - . | pv | ssh vivek@server1.cyberciti.biz "cat > /backups/box42/backup-dd-mm-yyyy.tgz"
    $ cd /tmp/data/
    $ tar zcf - . | \
    pv | \
    ssh vivek@centos7 "cat > /tmp/data.tgz"<

---

Some more examples of tar over ssh:

    $ tar cvjf - * | ssh vivek@nixcraft "(cd /dest/; tar xjf -)"
    $ tar cvzf - mydir/ | ssh vivek@backupbox "cat > /backups/myfile.tgz"
    $ tar cvzf - /var/www/html | ssh vivek@server1.cyberciti.biz "dd of=/backups/www.tar.gz"
    $ ssh vivek@box2 "cat /backups/www.tar.gz" | tar xvzf -
    $ tar cvjf - * | ssh root@home.nas02 "(cd /dest/; tar xjf - )"

---

A note about SSHFS - a FUSE filesystem
You can use sshfs to mount a remote directory and run tar command:

    $ mkdir /data/
    $ sshfs vivek@server1.cyberciti.biz:/ /data/
    $ tar -zcvf /data/file.tar.gz /home/vivek/

---

The path thing. How option `-C` works
Create files in a subdir of a subdir

    $ mkdir -p tmp/tmp2
    $ echo "file content" > tmp/tmp2/myfile.txt

Option `-C` moves to that directory right before the compression starts:    
    
    $ tar c -C tmp -zf tmp/myarch.tgz tmp2/myfile.txt

Archive is created in that directory, before the move.

    $ cp tmp/myarch.tgz ./
    $ ls
    myarch.tgz	tmp

When we extract the achive, the `tmp` subdir is not there anymore:
    
    $ tar xzf myarch.tgz
    $ ls
    myarch.tgz	tmp		tmp2
    $ ls tmp2
    myfile.txt

---
