

## Under Construction


[https://www.vagrantup.com/](https://www.vagrantup.com/)


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



