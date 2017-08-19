

## Under Construction

# Ansible

[https://www.ansible.com/](https://www.ansible.com/)


---

To run a playbook at a Vagrant box one can use:  

    ansible-playbook --connection ssh -u vagrant -i ansible/ansible.vmhosts ansible/playbooks/mybook/mythings2do.yml

---

    $ sudo easy_install pip
    $ sudo pip install ansible
 
run this to fix Ansible python errors:

    $ pip install --upgrade setuptools --user python

---

Quick demo. Executing command at hostB and hostC as userMe, from terminal at hostA.
Create inventory:

    $ echo -e "[example]\n    hostB\n    hostC\n" >> myInventory

Super-simple ansible call, with manual asking for a password
    
    $ ansible example --connection ssh -i myInventory -m ping -u userMe -k
    SSH password: 
    gen1 | success >> {
        "changed": false, 
        "ping": "pong"
    }

If you create the ssh keys as in [SSH](SSH.md), you can run without asking for passwords:

    $ ansible example --connection ssh -i myInventory --private-key ~/.ssh/id_ras_mykey -m ping -u userMe -k
    gen1 | success >> {
        "changed": false, 
        "ping": "pong"
    }

A command with output (not a module, so not '-m', but '-a')

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

---

