# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

WORKSPACE_VM_BOX_WITH_GUI = "box-cutter/ubuntu1404-desktop"
WORKSPACE_VM_BOX_WITH_GUI_URL = "https://atlas.hashicorp.com/box-cutter/ubuntu1404-desktop"

WORKSPACE_VM_BOX_NO_GUI = "ubuntu/trusty64"
WORKSPACE_VM_BOX_NO_GUI_URL = "http://files.vagrantup.com/trusty64.box"

WS_IP_FIRST_24BITS = "192.168.10."
WS_IP_SPACE_YARC_SERVER_START = 10
WS_IP_SPACE_YARC_CLIENT_START = 20
WS_IP_SPACE_CPP_START = 30

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  NYARCServers = 5
  (1..NYARCServers).each do |machine_id|
    config.vm.define "yser#{machine_id}", autostart: false do |box|

      box.vm.box = "#{WORKSPACE_VM_BOX_WITH_GUI}"
      box.vm.box_url = "#{WORKSPACE_VM_BOX_WITH_GUI_URL}"

      box.vm.network :forwarded_port, guest: 22, host: "21#{10+machine_id}"
      box.ssh.forward_agent = true
      box.vm.host_name = "yser#{machine_id}.vm"
      box.vm.network :private_network, ip: "#{WS_IP_FIRST_24BITS}#{WS_IP_SPACE_YARC_SERVER_START+machine_id}"
      box.vm.synced_folder  "projects", "/projects"

      box.vm.provider "virtualbox" do |vb|
        # We do not have to have gui, we can save some memory if we don't.
        vb.gui = true
        vb.memory = "1024"
        vb.customize ["modifyvm", :id, "--vram", "16"]
        vb.cpus = 2
        vb.customize ["modifyvm", :id, "--audio", 'coreaudio']
        #vb.customize ["modifyvm", :id, '--audio', 'coreaudio', '--audiocontroller', 'hda'] # choices: hda sb16 ac97
        ##if RUBY_PLATFORM =~ /darwin/
        ##      vb.customize ["modifyvm", :id, '--audio', 'coreaudio', '--audiocontroller', 'hda'] # choices: hda sb16 ac97
        ##    elsif RUBY_PLATFORM =~ /mingw|mswin|bccwin|cygwin|emx/
        ##      vb.customize ["modifyvm", :id, '--audio', 'dsound', '--audiocontroller', 'ac97']
        ##    end
      end

    ##config.vm.provision "shell", inline: <<-SHELL
    ##  sudo apt-get update
    ###  sudo apt-get install -y apache2
    ##SHELL

      box.vm.provision "generic", type: "ansible" do |ansible|
         ansible.playbook = "ansible/playbooks/dev_generic/bootstrap.yml"
         #ansible.inventory_path = "ansible/ansible.vmhosts"
         ansible.verbose = true
         ansible.host_key_checking = false
      end

      # TODO: do the yarc-specific later
      #box.vm.provision "yarc", type: "ansible" do |ansible|
      #   ansible.playbook = "ansible/playbooks/dev_yarc/bootstrap.yml"
      #   #ansible.inventory_path = "ansible/ansible.vmhosts"
      #   ansible.verbose = true
      #   ansible.host_key_checking = false
      #end
    end
  end

  N_YARC_Clients =5
  (1..N_YARC_Clients).each do |machine_id|
    config.vm.define "ycli#{machine_id}", autostart: false do |box|

      box.vm.box = "#{WORKSPACE_VM_BOX_WITH_GUI}"
      box.vm.box_url = "#{WORKSPACE_VM_BOX_WITH_GUI_URL}"

      box.vm.network :forwarded_port, guest: 22, host: "21#{20+machine_id}"
      box.vm.host_name = "ycli#{machine_id}.vm"
      box.vm.network :private_network, ip: "#{WS_IP_FIRST_24BITS}#{WS_IP_SPACE_YARC_CLIENT_START+machine_id}"
      box.vm.synced_folder  "projects", "/projects"

      box.vm.provider "virtualbox" do |vb|
        vb.gui = true
        vb.memory = "1024"
        vb.customize ["modifyvm", :id, "--vram", "16"]
        vb.cpus = 2
        vb.customize ["modifyvm", :id, "--audio", 'coreaudio']
      end

      box.vm.provision "generic", type: "ansible" do |ansible|
         ansible.playbook = "ansible/playbooks/dev_generic/bootstrap.yml"
         #ansible.inventory_path = "ansible/ansible.vmhosts"
         ansible.verbose = true
         ansible.host_key_checking = false
      end

      # TODO: do the yarc-specific later
      #box.vm.provision "yarc", type: "ansible" do |ansible|
      #   ansible.playbook = "ansible/playbooks/dev_yarc/bootstrap.yml"
      #   #ansible.inventory_path = "ansible/ansible.vmhosts"
      #   ansible.verbose = true
      #   ansible.host_key_checking = false
      #end
    end
  end

  N_CPP = 1
  (1..N_CPP).each do |machine_id|
    config.vm.define "sb_cpp#{machine_id}", autostart: false do |box|

      box.vm.box = "#{WORKSPACE_VM_BOX_WITH_GUI}"
      box.vm.box_url = "#{WORKSPACE_VM_BOX_WITH_GUI_URL}"

      box.vm.network :forwarded_port, guest: 22, host: "21#{30+machine_id}"
      box.vm.host_name = "ycli#{machine_id}.vm"
      box.vm.network :private_network, ip: "#{WS_IP_FIRST_24BITS}#{WS_IP_SPACE_CPP_START+machine_id}"
      box.vm.synced_folder  "projects", "/projects"

      box.vm.provider "virtualbox" do |vb|
        vb.gui = true
        vb.memory = "1024"
        vb.customize ["modifyvm", :id, "--vram", "16"]
        vb.cpus = 2
        vb.customize ["modifyvm", :id, "--audio", 'coreaudio']
      end

      box.vm.provision "generic", type: "ansible" do |ansible|
         ansible.playbook = "ansible/playbooks/dev_generic/bootstrap.yml"
         #ansible.inventory_path = "ansible/ansible.vmhosts"
         ansible.verbose = true
         ansible.host_key_checking = false
      end

      # TODO: do the cpp-specific later
      #box.vm.provision "yarc", type: "ansible" do |ansible|
      #   ansible.playbook = "ansible/playbooks/dev_cpp/bootstrap.yml"
      #   #ansible.inventory_path = "ansible/ansible.vmhosts"
      #   ansible.verbose = true
      #   ansible.host_key_checking = false
      #end
    end
  end

end
