

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

Example of ansible.hosts:

    [whole_fleet:children]
    qa
    production

    [qa]
    10.10.11.11 ansible_connection=ssh ansible_user=myuser ansible_ssh_private_key_file=myusers_key.pem

    [production]
    10.10.11.12 ansible_connection=ssh ansible_user=myuser ansible_ssh_private_key_file=myusers_key.pem

---

To run an individual command on servers grouped in ```hostsubset``` in file ansible.hosts:

    ansible --become --connection=ssh --private-key "~/mykeyIStoreLocally.pem" -u myRemoteUsername -i ansible.hosts hostssubset -a "docker ps"

---

Example of using connection local:

    mytest.yml -------------------------------
    ---
    - hosts: 127.0.0.1
      gather_facts: no
      
      tasks:
      - name: Check the date.
        command: date
        register: date
      - name: Print the date.
        debug: var=date.stdout
    -----------------------------------------------

And run it like sl:

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

---

Ansible'ized setup for Kafka on AWS EC2 using Galaxy:

https://galaxy.ansible.com/giladju/setup-kafka-cluster-ec2/

---




