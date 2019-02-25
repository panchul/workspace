

## Under Construction

# Vagrant

See Also:
[Ansible](Ansible.md)

---

[https://www.vagrantup.com/](https://www.vagrantup.com/)

https://circleci.com/blog/its-the-future/ - An article about Docker and Vagrant

---

Keeping things up-to-date

Run ```vagrant box update``` to keep the boxes up to date and not
need to update from within the VMs.

As far as the ```aptitude```-based Linux flavours, run this to update it:

      config.vm.provision "shell", inline: <<-SHELL
        sudo apt-get -y update
      SHELL

You might also want to run this to do the actual updating:

        sudo apt-get -y upgrade

Bootloader might make it more complicated.

---

Example customizing the box

    1      box.vm.provider "virtualbox" do |vb|
    2        vb.gui = true
    3        vb.memory = "2048"
    4        vb.customize ["modifyvm", :id, "--vram", "16"]
    5        vb.cpus = 2
    6        vb.customize ["modifyvm", :id, "--audio", 'coreaudio']
    7      end

Line 6 may not work on Windows.

---

Example provisioning section with shell provisioning:

    1      config.vm.provision "shell", inline: <<-SHELL
    2        apt-get install dos2unix 
    3        dos2unix -n /vagrant/scripts/bootstrap.sh ~/bootstrap.sh
    4        source ~/bootstrap.sh
    5        sudo apt-get install -y apache2
    6      SHELL

Line 2 installs the file converter to remove the ```\r``` that Windows may have added.

Line 5 uses ```-y``` to make sure the installer does not wait for the user entry.

---

Example provisioning section with Ansible provisioning:

    box.vm.provision "dev_cpp", type: "ansible" do |ansible|
        ansible.playbook = "ansible/playbooks/dev_cpp/bootstrap.yml"
        #ansible.inventory_path = "ansible/ansible.vmhosts"
        ansible.verbose = true
        ansible.host_key_checking = false
    end

---

Vagrantfile which uses getopts and allows you to change the name dynamically

Found this online, not sure about dynamic modifications being a preferable way to do things.

    # -*- mode: ruby -*-
    require 'getoptlong'
    
    opts = GetoptLong.new(
      [ '--vm-name',        GetoptLong::OPTIONAL_ARGUMENT ],
    )
    vm_name        = ENV['VM_NAME'] || 'default'
    
    begin
      opts.each do |opt, arg|
        case opt
          when '--vm-name'
            vm_name = arg
        end
      end
      rescue
    end
    
    Vagrant.configure(2) do |config|
      config.vm.define vm_name
      config.vm.provider "virtualbox" do |vbox, override|
        override.vm.box = "ubuntu/wily64"
        # ...
      end
      # ...
    end

So to use different name, you can run for example:

    vagrant --vm-name=my_name up --no-provision

Note: The --vm-name parameter needs to be specified before up command.

or:

    VM_NAME=my_name vagrant up --no-provision

---

Shell provisioning

    dpkg-reconfigure: unable to re-open stdin: No file or directory

Info about resolving it is here [http://serverfault.com/questions/500764/dpkg-reconfigure-unable-to-re-open-stdin-no-file-or-directory](http://serverfault.com/questions/500764/dpkg-reconfigure-unable-to-re-open-stdin-no-file-or-directory) 
Seem to be resolved with adding this before apt-get step:

    export DEBIAN_FRONTEND=noninteractive

---

To control multiple boxes and not having to click y/n there is option ```-f```:

    $ vagrant destroy -f box{1..5}
    
---

To run an Ansible playbook on a Vagrant vm:

Using Vagrant global insecure key(need to set config.ssh.insert_key to false in Vagrantfile):

    $ ansible-playbook --private-key=~/.vagrant.d/insecure_private_key -u vagrant \
    -i .vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory playbook.yml

Using the random private key  from .vagrant/machines/default/virtualbox/private_key:

    $ ansible-playbook --private-key=.vagrant/machines/default/virtualbox/private_key \
    -u vagrant -i .vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory playbook.yml

Or

    $ ansible --private-key=.vagrant/machines/mybox/virtualbox/private_key -u vagrant \
    -i .vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory mybox -a "hostname" 
    mybox | SUCCESS | rc=0 >>
    mybox


More info here: http://docs.ansible.com/ansible/latest/guide_vagrant.html
Short story long, that's what Vagrant Ansible provisioner does:

    $ PYTHONUNBUFFERED=1 ANSIBLE_FORCE_COLOR=true ANSIBLE_HOST_KEY_CHECKING=false \
     ANSIBLE_SSH_ARGS='-o UserKnownHostsFile=/dev/null -o ControlMaster=auto -o ControlPersist=60s' \
     ansible-playbook --private-key=/home/someone/.vagrant.d/insecure_private_key --user=vagrant \
     --connection=ssh --limit='machine1' \
     --inventory-file=/home/someone/coding-in-a-project/.vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory \
     playbook.yml

Actually this worked better, you can get it running the provitioner with '-vvvv' verbosity:

    $ PYTHONUNBUFFERED=1 ANSIBLE_FORCE_COLOR=true ANSIBLE_HOST_KEY_CHECKING=false \
    ANSIBLE_SSH_ARGS='-o UserKnownHostsFile=/dev/null -o IdentitiesOnly=yes -o ControlMaster=auto -o ControlPersist=60s' \
    ansible-playbook --connection=ssh --timeout=30 --limit="myboxname" \
    --inventory-file=/whereverVagrantfilePathIs/.vagrant/provisioners/ansible/inventory -v mytest.yml
    
```mytest.yml``` is this:

    ---
    - hosts:  cpp1
      gather_facts: no

      tasks:
      - name: Check the date.
        command: date
        register: date

      - name: Print the date.
        debug: var=date.stdout

      - name: do the hostname thing
        shell: hostname ; echo something

You get this:

    No config file found; using defaults
    
    PLAY [myboxname] ********************************************************************
    
    TASK [Check the date.] *********************************************************
    changed: [cpp1] => {"changed": true, "cmd": ["date"], "delta": "0:00:00.001773", "end": "2017-09-04 02:56:39.311402", "rc": 0, "start": "2017-09-04 02:56:39.309629", "stderr": "", "stdout": "Mon Sep  4 02:56:39 UTC 2017", "stdout_lines": ["Mon Sep  4 02:56:39 UTC 2017"], "warnings": []}
    
    TASK [Print the date.] *********************************************************
    ok: [myboxname] => {
        "date.stdout": "Mon Sep  4 02:56:39 UTC 2017"
    }
    
    TASK [do the hostname thing] ***************************************************
    changed: [myboxname] => {"changed": true, "cmd": "hostname ; echo something", "delta": "0:00:00.002092", "end": "2017-09-04 02:56:39.475227", "rc": 0, "start": "2017-09-04 02:56:39.473135", "stderr": "", "stdout": "myboxname\nsomething", "stdout_lines": ["myboxname", "something"], "warnings": []}
    
    PLAY RECAP *********************************************************************
    myboxname                       : ok=3    changed=2    unreachable=0    failed=0   

The inventory file has the ```myboxname```:

    # Generated by Vagrant
    ...
    myboxname ansible_ssh_host=127.0.0.1 ansible_ssh_port=2222 ansible_ssh_user='vagrant' ansible_ssh_private_key_file='/PathToWhereVagrantfileIs/.vagrant/machines/myboxname/virtualbox/private_key'
    ...

---

Nice discussion about known issue of ```stdin: is not a tty```
https://github.com/hashicorp/vagrant/issues/1673

---

Sometimes the private network does not seem to work, or some errors pop up. Here is the templates that has no errors:

    # -*- mode: ruby -*-
    # vi: set ft=ruby :

    Vagrant.configure("2") do |config|

      config.vm.box = "puppetlabs/centos-6.6-64-puppet"
      config.ssh.forward_agent = true # So that boxes don't have to setup key-less ssh
      config.ssh.insert_key = false # To generate a new ssh key and don't use the default Vagrant one
 
      # common provisioning for all 
      config.vm.provision "shell", path: "scripts/init.sh"
  
      # configure cluster
      (1..3).each do |i|
        config.vm.define "mynodehost#{i}" do |s|
          s.vm.hostname = "mynodehost#{i}"
          s.vm.network "private_network", ip: "10.30.3.#{i+1}", netmask: "255.255.255.0", virtualbox__intnet: "my-network", drop_nat_interface_default_route: true
          s.vm.provision "shell", path: "scripts/mynodehost.sh", args:"#{i}", privileged: false
        end
      end

      config.vm.provider "virtualbox" do |v|
        #  This setting controls how much cpu time a virtual CPU can use. A value of 50 implies a single virtual CPU can use up to 50% of a single host CPU.
        v.customize ["modifyvm", :id, "--cpuexecutioncap", "50"]
      end
    end

---

To get the information how to ssh to that box, use

    $ vagrant ssh-config myhost1
    Host myhost1
    HostName 127.0.0.1
    User vagrant
    Port 2204
    UserKnownHostsFile /dev/null
    StrictHostKeyChecking yes
    PasswordAuthentication yes
    IdentityFile /Users/fbi/.vagrant/machines/gen1/virtualbox/private_key
    IdentitiesOnly yes
    LogLevel FATAL
    ForwardAgent yes
    
Now you can get in:    

    $ ssh -p 2204 -i /Users/fbi/.vagrant/machines/myhost1/virtualbox/private_key vagrant@127.0.0.1

---

Automatically download the guest additions:
https://dzone.com/articles/automatically-download-and
(not sure if it works, tried it out)

--- 

Some old links, probably when I just started using Vagrant

just following up some tutorials
from http://docs.vagrantup.com/v2/getting-started/project_setup.html

Nice example how to configure the Vagrant file
http://stackoverflow.com/questions/17845637/vagrant-default-name

Here is the doc how to configure UI:
http://docs.vagrantup.com/v2/virtualbox/configuration.html

---