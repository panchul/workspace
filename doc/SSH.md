# SSH protocol

http://en.wikipedia.org/wiki/Secure_Shell
http://www.ssh.com/

**Table of Content**

- [ssh configuring](#SSH-configuring)
- [Open SSH server](#Open-SSH-server)
- [Tunneling](#Tunneling)
- [Miscallaneous](#Miscallaneous)

## SSH configuring

---

Another link on creating and using the identities with git, this one is at gitlab.com

https://gitlab.com/help/ssh/README#generating-a-new-ssh-key-pair

Generate the key pair.

    $ ssh-keygen -t ed25519 -C "<comment>"
    Generating public/private ed25519 key pair.
    Enter file in which to save the key (/home/user/.ssh/id_ed25519):
    ...

(Same for RSA would be something like `ssh-keygen -t rsa -b 2048 -C "email@example.com"`)

Copy the .pub data to the 'SSH keys' at gitlab.com

See that you can login:

    $ ssh -T git@gitlab.com

(for more verbose diagnostics, `ssh -Tvvv git@gitlab.com`)

You can also check your ssh agent, and add your key if it is not in default location:

    $ eval $(ssh-agent -s)
    $ ssh-add <path to private SSH key>

Configure ~/.ssh/config like so:

    # User1 Account Identity
    Host <user_1.gitlab.com>
      Hostname gitlab.com
      PreferredAuthentications publickey
      IdentityFile ~/.ssh/<example_ssh_key1>
    
    # User2 Account Identity
    Host <user_2.gitlab.com>
      Hostname gitlab.com
      PreferredAuthentications publickey
      IdentityFile ~/.ssh/<example_ssh_key2>
      ## can also have:
      # User someusername

Cloning the gitlab repository normally looks like this:

    $ git clone git@gitlab.com:gitlab-org/gitlab.git
    
To clone it for user_1, replace gitlab.com with the SSH alias user_1.gitlab.com:

    $ git clone git@<user_1.gitlab.com>:gitlab-org/gitlab.git
    
Fix a previously cloned repository using the git remote command.
The example below assumes the remote repository is aliased as origin.

    $ git remote set-url origin git@<user_1.gitlab.com>:gitlab-org/gitlab.git
  
---

## Open SSH server

---

Top 20 OpenSSH server best security practices 
https://www.cyberciti.biz/tips/linux-unix-bsd-openssh-server-best-practices.html

---

Setting up sshd and using ufw
https://www.cyberciti.biz/faq/ufw-allow-incoming-ssh-connections-from-a-specific-ip-address-subnet-on-ubuntu-debian

TODO: do the summary


---

Enabling SSH on Ubuntu 18.04
https://linuxize.com/post/how-to-enable-ssh-on-ubuntu-18-04/


    $ sudo apt update
	$ sudo apt install openssh-server
    $ sudo systemctl status ssh
    $ sudo ufw allow ssh

You can find out your own public ip using

    $ ip a

Or visiting https://ifconfig.co/ip

    $ curl ifconfig.co/ip

Here is where you can refresh the instructions to setup the keys:
https://linuxize.com/post/how-to-setup-passwordless-ssh-login/


To start:

    $ sudo systemctl start ssh

To make it start automatically upon booting:

    $ sudo systemctl enable ssh

To stop:

    $ sudo systemctl stop ssh

To disable the automatic start when booting:

    $ sudo systemctl disable ssh

At the server from which you wan to access it, create an identity and do `ssh-copy-id`
(it appends it to the `authorized_keys` file:

    $ ssh-keygen
    
Save the key to `id_rsa_mykey`. Then

    $ ssh-copy-id -i ~/.ssh/id_rsa_mykey myusername@myhost

you can also connect as:

    $ ssh -i ~/.ssh/id_rs_mykey myusername@myhost

And you might need to create an identity in ~/.ssh/config:
    
    Host machinea
    Hostname myhost
    IdentityFile ~/.ssh/id_rsa_mykey
    User myusername

See below, I had more on this.

---

Setting up sshd on fedora  
https://linuxconfig.org/how-to-install-start-and-connect-to-ssh-server-on-fedora-linux

(Fedora network manager cli might be helpful)

    $ dnf install opensh-server
    $ systemctl enable sshd
    $ systemctl start sshd
    
Check that it is up:    
    
    $ systemctl status sshd
    
Socket scan should show that we are listening to port 22:    
    
    $ ss -lt

This is it, we are reado to connect from another machine:

    $ ssh username@thehost
    
---

## Tunneling

---

How to use SSH as a VPN with sshuttle
https://www.techrepublic.com/article/how-to-use-ssh-as-a-vpn-with-sshuttle/

---

Магия SSH
https://habr.com/ru/post/331348/


---

This tunnels an IRC session from client machine ```127.0.0.1``` (local-host) to
remote server ```server.example.com```:

    $ ssh -f -L 1234:localhost:6667 server.example.com sleep 10
    $ irc -c '#users' -p 1234 pinky 127.0.0.1

Option -f brings ssh into background, and the remote command 'sleep 10' allows to start the service
which is to be tunnelled.

---

## Miscallaneous

---

Quick and dirty way to fix 'ssh permission denied(publicey)':

1. update in ```/etc/ssh/sshd_config```:
```
    ... 
    PasswordAuthentication yes
    ...
```

2. Restart ssh service 

    $ sudo systemctl restart sshd

---

1. When you enter ```ssh user@example.com```, your client and the host exchange keys.
2. If you are connecting for the first time, SSH will prompt you for your approval of
 the host key.
3. If you have a private key in your ```~/.ssh``` folder that matches one of the keys
 in ```~/.ssh/authorized_keys```, the connection continues to step 4. Otherwise if
 password authentification is allowed, SSH will prompt you for your password.
4. The transferred key is used to create a session key that is used for the remainder
 of the connection, encrypting all the communication with a cipher such as AES, 3DES, Blowfish or RC4("arcfour")

---

Here is a closer look with the sandboxes ```ssh1```(server) and ```ssh2```(client).
They have the virtual network and host names ```ssh1.vm``` and ```ssh2.vm``` respectively.

On ```ssh1.vm``` for Alice:

Create a group ```alicegroup```, and user ```alice```, unlock the account password:

    vagrant@ssh1:~$ sudo groupadd -force alicegroup
    vagrant@ssh1:~$ sudo useradd --create-home --gid alicegroup alice 
    vagrant@ssh1:~$ sudo passwd alice 
    (Enter the password)

Or as one line:

    vagrant@ssh1:~$ sudo groupadd -f alicegroup ; sudo useradd -m -g alicegroup alice ; sudo passwd alice 

Similar thing on ```ssh2.vm``` for Bob:

    vagrant@ssh2:~$ sudo groupadd -f bobgroup ; sudo useradd -m -g bobgroup bob ; sudo passwd bob 
    (Enter the password)

Generate a pair of authentication keys at the client (do not enter a passphrase):

    vagrant@ssh2:~$ su bob
    Password:
    (enter the password)
    
    bob@ssh2.vm:/home/vagrant$ mkdir -p .ssh ; cd ~/.ssh
    bob@ssh2.vm:~/.ssh$ ls
    
    (nothing here yet, unless we did something with ssh already)
         
    bob@ssh2.vm:~/.ssh $ ssh-keygen -t rsa 
    Generating public/private rsa key pair.
    Enter file in which to save the key (/home/bob/.ssh/id_rsa): 
    Enter passphrase (empty for no passphrase): 
    Enter same passphrase again: 
    Your identification has been saved in /home/bob/.ssh/id_rsa.
    Your public key has been saved in /home/bob/.ssh/id_rsa.pub.
    The key fingerprint is:
    ...
    bob@ssh2:~/.ssh $ ls
    id_rsa  id_rsa.pub

Create directory ~/.ssh if it does not exist (enter alice's password at ssh2.vm):

    bob@ssh2:~/.ssh $ ssh alice@ssh1.vm mkdir -p .ssh
    The authenticity of host 'ssh1.vm (192.168.10.81)' can't be established.
    ECDSA key fingerprint is 2e:01:18:44:fc:0a:98:c5:cd:fe:a2:2b:40:b6:9f:42.
    Are you sure you want to continue connecting (yes/no)? yes
    Warning: Permanently added 'ssh1.vm,192.168.10.81' (ECDSA) to the list of known hosts.    alice@ssh1.vm's password: 
    (enter Alice's password)
    
Append the public key to the ```authorized_keys``` at Alice's ```ssh1.vm`:

    bob@ssh2.vm:~/.ssh $ cat ~/.ssh/id_rsa.pub | ssh alice@ssh1.vm 'cat >> .ssh/authorized_keys'
    alice@ssh1.vm's password: 
    (enter Alice's password)
    
This is it. You can now login without entering a password:

    bob@ssh2.vm:~/ $ ssh alice@ssh1.vm
    
---    

Some old notes on Identity files, etc. Not sure how accurate that was, to lazy to check.
To login from machine A to machine B:

1. run `ssh-keygen` on host A `machinea`. Do not enter the password for the key, save it in
 a file `id_rsa_keya`
2. append `id_rsa_keya.pub` to `~/.ssh/authorized_keys` on host B (`machineb`).

That is it. Connect from host A to host B using, for example:

    $ ssh -i ~/.ssh/id_rsa_keya user@machineb

To not have to enter the key in the command line, you need to create an identity at the
machine A (the client):

    $ echo "Host machinea" >> config
    $ echo "Hostname machineb" >> config
    $ echo "IdentityFile ~/.ssh/id_rsa_keya" >> config
    $ echo "User vagrant" >> config

Now this works like a charm, on machine A:

    $ ssh machineb

no password asked.

---

You can setup an environment variable to make it possible for programs to use SSH to find your
keys. Insert this to .bashrc: 

    if [ -z "$SSH_AUTH_SOCK" ] ; then
        eval `ssh-agent -s`
        ssh-add
    fi
    
---

To trick ssh into using empty known_hosts and not check for host. (not asking to enter 'yes')

    $ ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -i ~/mykey.pem myuser@some.host.address.com

---

Neat Ubuntu install OpenSSH server, from https://www.cyberciti.biz/faq/ubuntu-linux-install-openssh-server/

Login to remote server using bmc/ipmi/kvm over IP (optional)

    $ ssh root@power9-bmc
    $ sudo apt update
    $ sudo apt upgrade
    $ sudo apt install openssh-server

Verify that ssh service running

    $ sudo systemctl status ssh

If not running enable the ssh server and start it:

    $ sudo systemctl enable ssh
    $ sudo systemctl start ssh

    Synchronizing state of ssh.service with SysV service script with /lib/systemd/systemd-sysv-install.
    Executing: /lib/systemd/systemd-sysv-install enable ssh
    Created symlink /etc/systemd/system/sshd.service > /lib/systemd/system/ssh.service.

Here is how open or allow port 22 when using ufw on Ubuntu:

    $ sudo ufw allow ssh
    $ sudo ufw enable
    $ sudo ufw status

Test ssh:

    $ ssh vivek@server-ip
    $ ssh vivek@power9

How to Enable and test SSH in Ubuntu Linux server
You can install copy and install the public key using ssh-copy-id command for password less login:

    $ ssh-copy-id vivek@power9

One can create shortcuts for ssh login / client options. For example create a file named ~/.ssh/config as follows:

    $ nano ~/.ssh/config

Append the following to login into my EC2 Ubuntu server at AWS cloud:

    Host web01
        HostName aws-ec2-www-server1.cyberciti.biz
        Port 22
        IdentityFile  ~/.ssh/AWS_EC2_Virginia_US_East_Ubuntu_Boxes.pem
        User ubuntu

To log in simply type:

    $ ssh web01
    
---

Another summary of the ssh-related operations.
https://dev.to/djangotricks/things-i-want-to-remember-about-ssh-21el

---
