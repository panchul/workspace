

## Under Construction


[https://www.vagrantup.com/](https://www.vagrantup.com/)
https://circleci.com/blog/its-the-future/ - An article about Docker and Vagrant


### Keeping things up-to-date

Run ```vagrant box update``` to keep the boxes up to date and not
need to update from within the VMs.

As far as the ```aptitude```-based Linux flavours, run this to update it:

      config.vm.provision "shell", inline: <<-SHELL
        sudo apt-get -y update
      SHELL

You might also want to run this to do the actual updating:

        sudo apt-get -y upgrade

Bootloader might make it more complicated.


## Vagrantfile misc.


#### Example customizing the box

```
1      box.vm.provider "virtualbox" do |vb|
2        vb.gui = true
3        vb.memory = "2048"
4        vb.customize ["modifyvm", :id, "--vram", "16"]
5        vb.cpus = 2
6        vb.customize ["modifyvm", :id, "--audio", 'coreaudio']
7      end
```

Line 6 may not work on Windows.



#### Example provisioning section with shell provisioning:

```
1      config.vm.provision "shell", inline: <<-SHELL
2        apt-get install dos2unix 
3        dos2unix -n /vagrant/scripts/bootstrap.sh ~/bootstrap.sh
4        source ~/bootstrap.sh
5        sudo apt-get install -y apache2
6      SHELL
```

Line 2 installs the file converter to remove the ```\r``` that Windows may have added.

Line 5 uses ```-y``` to make sure the installer does not wait for the user entry.

#### Example provisioning section with Ansible provisioning:

```
      box.vm.provision "dev_cpp", type: "ansible" do |ansible|
         ansible.playbook = "ansible/playbooks/dev_cpp/bootstrap.yml"
         #ansible.inventory_path = "ansible/ansible.vmhosts"
         ansible.verbose = true
         ansible.host_key_checking = false
      end
```


## Shell provisioning

### ﻿dpkg-reconfigure: unable to re-open stdin: No file or directory

Info about resolving it is here [﻿http://serverfault.com/questions/500764/dpkg-reconfigure-unable-to-re-open-stdin-no-file-or-directory](http://serverfault.com/questions/500764/dpkg-reconfigure-unable-to-re-open-stdin-no-file-or-directory) 
Seem to be resolved with adding this before apt-get step:

    export DEBIAN_FRONTEND=noninteractive

