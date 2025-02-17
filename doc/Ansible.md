[Home](Readme.md)
# Ansible

See Also:

- [Docker](Docker.md)
- [Npm](Npm.md)
- [Porter](Porter.md)

---

[https://www.ansible.com/](https://www.ansible.com/)

My sandbox for Ansible: [https://github.com/panchul/sb_ansible](https://github.com/panchul/sb_ansible)

---

**Contents**

- [Miscellaneous](Ansible.md#miscellaneous)

---

## Miscellaneous

---

Another demo, updating all packages on ubuntu.
https://www.cyberciti.biz/faq/ansible-apt-update-all-packages-on-ubuntu-debian-linux/

---

Installing Ansible on Fedora.
https://www.cyberciti.biz/faq/how-to-install-ansible-on-fedora-for-it-and-server-automation/

Installing and testing Ansible on CentOS RHEL 8
Neat step-by-step
https://www.tecmint.com/install-ansible-on-centos-rhel-8/

Part 2(or similar):
https://www.tecmint.com/install-and-configure-an-ansible-control-node/

TODO: do the summary


---

Using static and dynamic inventories
https://www.tecmint.com/use-static-and-dynamic-inventory-in-ansible

TODO: write a summary

 
---

Neat summary of Ansible for Ubuntu 18.04lts
https://www.cyberciti.biz/faq/how-to-install-ansible-on-ubuntu-18-04-for-it-automation/
TODO: a walk-through

---

To run a playbook at a Vagrant box one can use:  

```bash
    $ ansible-playbook --connection ssh -u vagrant -i ansible/ansible.vmhosts ansible/playbooks/mybook/mythings2do.yml
```

---

```bash
    $ sudo easy_install pip
    $ sudo pip install ansible
```

run this to fix Ansible python errors:

```bash
    $ pip install --upgrade setuptools --user python
```

---

Quick demo. Executing command at hostB and hostC as userMe, from terminal at hostA.
Create inventory:

```bash
    $ echo -e "[example]\n    hostB\n    hostC\n" >> myInventory
```

Super-simple ansible call, with manual asking for a password
    
```bash
    $ ansible example --connection ssh -i myInventory -m ping -u userMe -k
    SSH password: 
    gen1 | success >> {
        "changed": false, 
        "ping": "pong"
    }
```

If you create the ssh keys as in [SSH](SSH.md), you can run without asking for passwords:

```bash
    $ ansible example --connection ssh -i myInventory --private-key ~/.ssh/id_ras_mykey -m ping -u userMe -k
    gen1 | success >> {
        "changed": false, 
        "ping": "pong"
    }
```

A command with output (not a module, so not '-m', but '-a')

```bash
    $ ansible example -i myhosts --private-key ~/.ssh/id_rsa_mykey -a "free -m " -u vagrant
    gen1 | success | rc=0 >>
                 total       used       free     shared    buffers     cached
    Mem:          2001        627       1374          0         56        396
    -/+ buffers/cache:        174       1827
    Swap:            0          0          0
    
    gen3 | success | rc=0 >>
                 total       used       free     shared    buffers     cached
    Mem:          2000       1727        272          5         66        875
    -/+ buffers/cache:        785       1214
    Swap:         1023          0       1023
```

---

Example of ansible.hosts:

```bash
    [whole_fleet:children]
    qa
    production

    [qa]
    10.10.11.11 ansible_connection=ssh ansible_user=myuser ansible_ssh_private_key_file=myusers_key.pem

    [production]
    10.10.11.12 ansible_connection=ssh ansible_user=myuser ansible_ssh_private_key_file=myusers_key.pem
```

---

To run an individual command on servers grouped in `hostsubset` in file ansible.hosts:

```bash
    ansible --become --connection=ssh --private-key "~/mykeyIStoreLocally.pem" -u myRemoteUsername -i ansible.hosts hostssubset -a "docker ps"
```

---

Example of using connection local:

```yaml
# mytest.yml ------------------------------------
    - hosts: 127.0.0.1
      gather_facts: no
      
      tasks:
      - name: Check the date.
        command: date
        register: date
      - name: Print the date.
        debug: var=date.stdout
# -----------------------------------------------
```

And run it like sl:

```bash
    $ ansible-playbook --connection=local mytest.yml
     [WARNING]: Host file not found: /etc/ansible/hosts
     [WARNING]: provided hosts list is empty, only localhost is available
    
    PLAY [127.0.0.1] ***************************************************************
    
    TASK [Check the date.] *********************************************************
    changed: [127.0.0.1]
    
    TASK [Print the date.] *********************************************************
    ok: [127.0.0.1] => {
        "date.stdout": "Mon Aug 28 15:21:10 EDT 2007"
    }
    
    PLAY RECAP *********************************************************************
    127.0.0.1                  : ok=2    changed=1    unreachable=0    failed=0   
```

---

Ansible'ized setup for Kafka on AWS EC2 using Galaxy:

https://galaxy.ansible.com/giladju/setup-kafka-cluster-ec2/

---

Ansible link
https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html#latest-releases-via-pip
 
Latest Releases Via Pip

Ansible can be installed via “pip”, the Python package manager. If ‘pip’ isn’t already available in your version of Python, you can get pip by:

```bash
    $ sudo easy_install pip
```

Then install Ansible with [1]:

```bash
    $ sudo pip install ansible
```

Or if you are looking for the latest development version:

```bash
    pip install git+https://github.com/ansible/ansible.git@devel
```

If you are installing on OS X Mavericks, you may encounter some noise from your compiler. A workaround is to do the following:

```bash
    $ sudo CFLAGS=-Qunused-arguments CPPFLAGS=-Qunused-arguments pip install ansible
```

Readers that use virtualenv can also install Ansible under virtualenv, though we’d recommend to not worry about it and just install Ansible globally. Do not use easy_install to install ansible directly.

---
