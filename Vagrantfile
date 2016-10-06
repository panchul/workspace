# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

WORKSPACE_VM_BOX_WITH_GUI = "box-cutter/ubuntu1404-desktop"
WORKSPACE_VM_BOX_WITH_GUI_URL = "https://atlas.hashicorp.com/box-cutter/ubuntu1404-desktop"

WORKSPACE_VM_BOX_NO_GUI = "ubuntu/trusty64"
WORKSPACE_VM_BOX_NO_GUI_URL = "http://files.vagrantup.com/trusty64.box"

##################################################
#
# !! When editing, sync the following with hosts_append.txt and ansible.vmhosts
#

WS_IP_FIRST_24BITS = "192.168.10."
WS_NETWORK_NAME = "vagrant_ws"

WS_IP_SPACE_GENERIC_START = 2

WS_IP_SPACE_YARC_SERVER_START = 10
N_YARC_Servers = 3

WS_IP_SPACE_YARC_CLIENT_START = 20
N_YARC_Clients =3

WS_IP_SPACE_CPP_START = 25
N_CPP = 1

WS_IP_SPACE_ERL_START = 30
N_ERL = 5

WS_IP_SPACE_SCALA_START = 35
N_SCALA = 5

WS_IP_SPACE_MYSQL_START = 40

WS_IP_SPACE_HAPROXY_START = 45

WS_IP_SPACE_SHELL_START = 50

WS_IP_SPACE_PERL_START = 51

WS_IP_SPACE_JAVASCRIPT_START = 53
N_JAVASCRIPT = 1

WS_IP_SPACE_ZOOKEEPER_START = 55
N_ZOOKEEPER = 1

WS_IP_SPACE_KAFKA_BROKER_START = 60
N_KAFKA_BROKER = 1


# NOTE: ! Do not use those Starts over 99 - we are re-using it for port forwarding.

##################################################


Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # Simplest generic box, with only shell provisioning  
  config.vm.define "gen1", autostart: false do |box|
    machine_id = 1
    box.vm.box = "#{WORKSPACE_VM_BOX_WITH_GUI}"
    box.vm.box_url = "#{WORKSPACE_VM_BOX_WITH_GUI_URL}"

    #  box.vm.network :forwarded_port, guest: 22, host: "21#{WS_IP_SPACE_GENERIC_START+machine_id}"
    box.ssh.forward_agent = true
    box.vm.hostname = "gen#{machine_id}.vm"
    box.vm.network :private_network, ip: "#{WS_IP_FIRST_24BITS}#{WS_IP_SPACE_GENERIC_START+machine_id}", netmask: "255.255.255.0", virtual_box__intnet: "{#WS_NETWORK_NAME}", drop_nat_interface_default_route: true
#    box.vm.network "private_network", ip: "#{WS_IP_FIRST_24BITS}#{WS_IP_SPACE_GENERIC_START+machine_id}", netmask: "255.255.255.0", virtual_box__intnet: true
    box.vm.synced_folder  "projects", "/projects"

    box.vm.provider "virtualbox" do |vb|
      # We do not have to have gui, we can save some memory if we don't.
      vb.gui = true
      vb.memory = "2048"
      vb.customize ["modifyvm", :id, "--vram", "16"]
      vb.cpus = 2

      # win7 machine did not take this.
      #vb.customize ["modifyvm", :id, "--audio", 'coreaudio']
    end

    box.vm.provision "shell", inline: <<-SHELL
      export DEBIAN_FRONTEND=noninteractive
      apt-get install -y dos2unix 
      mkdir -p /home/vagrant/tmp_provisioning
      dos2unix -q -n /vagrant/scripts/bootstrap.sh /home/vagrant/tmp_provisioning/bootstrap.sh
      source /home/vagrant/tmp_provisioning/bootstrap.sh
    SHELL
  end

  # another simple one
  config.vm.define "gen2", autostart: false do |box|
    machine_id = 2
    box.vm.box = "#{WORKSPACE_VM_BOX_WITH_GUI}"
    box.vm.box_url = "#{WORKSPACE_VM_BOX_WITH_GUI_URL}"

    #  box.vm.network :forwarded_port, guest: 22, host: "21#{WS_IP_SPACE_GENERIC_START+machine_id}"
    box.ssh.forward_agent = true
    box.vm.host_name = "gen#{machine_id}.vm"
    box.vm.network :private_network, ip: "#{WS_IP_FIRST_24BITS}#{WS_IP_SPACE_GENERIC_START+machine_id}", netmask: "255.255.255.0", virtual_box__intnet: "{#WS_NETWORK_NAME}"
    box.vm.synced_folder  "projects", "/projects"

    box.vm.provider "virtualbox" do |vb|
      # We do not have to have gui, we can save some memory if we don't.
      vb.gui = true
      vb.memory = "2048"
      vb.customize ["modifyvm", :id, "--vram", "16"]
      vb.cpus = 2

      # win7 machine did not take this.
      #vb.customize ["modifyvm", :id, "--audio", 'coreaudio']
    end

    box.vm.provision "shell", inline: <<-SHELL
      export DEBIAN_FRONTEND=noninteractive
      apt-get install -y dos2unix 
      mkdir -p /home/vagrant/tmp_provisioning
      dos2unix -q -n /vagrant/scripts/bootstrap.sh /home/vagrant/tmp_provisioning/bootstrap.sh
      source /home/vagrant/tmp_provisioning/bootstrap.sh
    SHELL
  end

  # A more feature-rich generic box
  config.vm.define "gen3", autostart: false do |box|
    machine_id = 3
    box.vm.box = "#{WORKSPACE_VM_BOX_WITH_GUI}"
    box.vm.box_url = "#{WORKSPACE_VM_BOX_WITH_GUI_URL}"

    #  box.vm.network :forwarded_port, guest: 22, host: "21#{WS_IP_SPACE_GENERIC_START+machine_id}"
    box.ssh.forward_agent = true
    box.vm.host_name = "gen#{machine_id}.vm"
    box.vm.network "private_network", ip: "#{WS_IP_FIRST_24BITS}#{WS_IP_SPACE_GENERIC_START+machine_id}", netmask: "255.255.255.0", virtual_box__intnet: "{#WS_NETWORK_NAME}", drop_nat_interface_default_route: true
    box.vm.synced_folder  "projects", "/projects"

    box.vm.provider "virtualbox" do |vb|
      # We do not have to have gui, we can save some memory if we don't.
      vb.gui = true
      vb.memory = "2048"
      vb.customize ["modifyvm", :id, "--vram", "16"]
      vb.cpus = 2

      # win7 machine did not take this.
      #vb.customize ["modifyvm", :id, "--audio", 'coreaudio']
    end

    box.vm.provision "shell", inline: <<-SHELL
      export DEBIAN_FRONTEND=noninteractive
      apt-get install -y dos2unix 
      mkdir -p /home/vagrant/tmp_provisioning
      dos2unix -q -n /vagrant/scripts/bootstrap.sh /home/vagrant/tmp_provisioning/bootstrap.sh
      source /home/vagrant/tmp_provisioning/bootstrap.sh
    SHELL

    box.vm.provision "dev_generic", type: "ansible" do |ansible|
       ansible.playbook = "ansible/playbooks/dev_generic/bootstrap.yml"
       #ansible.inventory_path = "ansible/ansible.vmhosts"
       ansible.verbose = true
       ansible.host_key_checking = false
    end
   
    box.vm.provision "dev_cpp", type: "ansible" do |ansible|
       ansible.playbook = "ansible/playbooks/dev_cpp/bootstrap.yml"
       #ansible.inventory_path = "ansible/ansible.vmhosts"
       ansible.verbose = true
       ansible.host_key_checking = false
    end

  end

  config.vm.define "shell1", autostart: false do |box|
    machine_id = 1
    box.vm.box = "#{WORKSPACE_VM_BOX_WITH_GUI}"
    box.vm.box_url = "#{WORKSPACE_VM_BOX_WITH_GUI_URL}"

    box.ssh.forward_agent = true
    box.vm.host_name = "shell#{machine_id}.vm"
    box.vm.network :private_network, ip: "#{WS_IP_FIRST_24BITS}#{WS_IP_SPACE_SHELL_START+machine_id}"
    box.vm.synced_folder  "projects", "/projects"
    # box.vm.synced_folder  "projects_sbshell#{machine_id}", "/projects_sbshell#{machine_id}"

    box.vm.provider "virtualbox" do |vb|
      # We do not have to have gui, we can save some memory if we don't.
      vb.gui = true
      vb.memory = "2048"
      vb.customize ["modifyvm", :id, "--vram", "16"]
      vb.cpus = 2

      # win machines did not take this.
      #vb.customize ["modifyvm", :id, "--audio", 'coreaudio']
    end

    box.vm.provision "shell", inline: <<-SHELL
      export DEBIAN_FRONTEND=noninteractive
      apt-get install -y dos2unix 
      mkdir -p /home/vagrant/tmp_provisioning
      dos2unix -q -n /vagrant/scripts/bootstrap.sh /home/vagrant/tmp_provisioning/bootstrap.sh
      source /home/vagrant/tmp_provisioning/bootstrap.sh
    SHELL
  end

  config.vm.define "perl1", autostart: false do |box|
    machine_id = 1
    box.vm.box = "#{WORKSPACE_VM_BOX_WITH_GUI}"
    box.vm.box_url = "#{WORKSPACE_VM_BOX_WITH_GUI_URL}"

    box.ssh.forward_agent = true
    box.vm.host_name = "perl#{machine_id}.vm"
    box.vm.network :private_network, ip: "#{WS_IP_FIRST_24BITS}#{WS_IP_SPACE_PERL_START+machine_id}"
    box.vm.synced_folder  "projects", "/projects"
    # box.vm.synced_folder  "projects_sbperl#{machine_id}", "/projects_sbperl#{machine_id}"

    box.vm.provider "virtualbox" do |vb|
      # We do not have to have gui, we can save some memory if we don't.
      vb.gui = true
      vb.memory = "2048"
      vb.customize ["modifyvm", :id, "--vram", "16"]
      vb.cpus = 2

      # win machines did not take this.
      #vb.customize ["modifyvm", :id, "--audio", 'coreaudio']
    end

    box.vm.provision "shell", inline: <<-SHELL
      export DEBIAN_FRONTEND=noninteractive
      apt-get install -y dos2unix 
      mkdir -p /home/vagrant/tmp_provisioning
      dos2unix -q -n /vagrant/scripts/bootstrap.sh /home/vagrant/tmp_provisioning/bootstrap.sh
      source /home/vagrant/tmp_provisioning/bootstrap.sh
    SHELL
  end

  (1..N_YARC_Servers).each do |machine_id|
    config.vm.define "yser#{machine_id}", autostart: false do |box|

      box.vm.box = "#{WORKSPACE_VM_BOX_WITH_GUI}"
      box.vm.box_url = "#{WORKSPACE_VM_BOX_WITH_GUI_URL}"

     # box.vm.network :forwarded_port, guest: 22, host: "21#{WS_IP_SPACE_YARC_SERVER_START+machine_id}"
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

      box.vm.provision "shell", inline: <<-SHELL
        export DEBIAN_FRONTEND=noninteractive
        apt-get install -y dos2unix 
        mkdir -p /home/vagrant/tmp_provisioning
        dos2unix -q -n /vagrant/scripts/bootstrap.sh /home/vagrant/tmp_provisioning/bootstrap.sh
        source /home/vagrant/tmp_provisioning/bootstrap.sh
      SHELL

      box.vm.provision "dev_generic", type: "ansible" do |ansible|
         ansible.playbook = "ansible/playbooks/dev_generic/bootstrap.yml"
         #ansible.inventory_path = "ansible/ansible.vmhosts"
         ansible.verbose = true
         ansible.host_key_checking = false
      end
    end
  end

  (1..N_YARC_Clients).each do |machine_id|
    config.vm.define "ycli#{machine_id}", autostart: false do |box|

      box.vm.box = "#{WORKSPACE_VM_BOX_WITH_GUI}"
      box.vm.box_url = "#{WORKSPACE_VM_BOX_WITH_GUI_URL}"

     # box.vm.network :forwarded_port, guest: 22, host: "21#{WS_IP_SPACE_YARC_CLIENT_START+machine_id}"
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

      box.vm.provision "shell", inline: <<-SHELL
        export DEBIAN_FRONTEND=noninteractive
        apt-get install -y dos2unix 
        mkdir -p /home/vagrant/tmp_provisioning
        dos2unix -q -n /vagrant/scripts/bootstrap.sh /home/vagrant/tmp_provisioning/bootstrap.sh
        source /home/vagrant/tmp_provisioning/bootstrap.sh
      SHELL

      box.vm.provision "dev_generic", type: "ansible" do |ansible|
         ansible.playbook = "ansible/playbooks/dev_generic/bootstrap.yml"
         #ansible.inventory_path = "ansible/ansible.vmhosts"
         ansible.verbose = true
         ansible.host_key_checking = false
      end
    end
  end

  (1..N_CPP).each do |machine_id|
    config.vm.define "cpp#{machine_id}", autostart: false do |box|

      box.vm.box = "#{WORKSPACE_VM_BOX_WITH_GUI}"
      box.vm.box_url = "#{WORKSPACE_VM_BOX_WITH_GUI_URL}"

    #  box.vm.network :forwarded_port, guest: 22, host: "21#{WS_IP_SPACE_CPP_START+machine_id}"
      box.vm.host_name = "cpp#{machine_id}.vm"
      box.vm.network :private_network, ip: "#{WS_IP_FIRST_24BITS}#{WS_IP_SPACE_CPP_START+machine_id}"
      box.vm.synced_folder  "projects", "/projects"
      # box.vm.synced_folder  "projects_sbcpp#{machine_id}", "/projects_sbcpp#{machine_id}"

      box.vm.provider "virtualbox" do |vb|
        vb.gui = true
        vb.memory = "2048"
        vb.customize ["modifyvm", :id, "--vram", "16"]
        vb.cpus = 2
      #  vb.customize ["modifyvm", :id, "--audio", 'coreaudio']
      end

      box.vm.provision "shell", inline: <<-SHELL
        export DEBIAN_FRONTEND=noninteractive
        apt-get install -y dos2unix 
        mkdir -p /home/vagrant/tmp_provisioning
        dos2unix -q -n /vagrant/scripts/bootstrap.sh /home/vagrant/tmp_provisioning/bootstrap.sh
        source /home/vagrant/tmp_provisioning/bootstrap.sh
      SHELL

      box.vm.provision "dev_generic", type: "ansible" do |ansible|
         ansible.playbook = "ansible/playbooks/dev_generic/bootstrap.yml"
         ansible.inventory_path = "ansible/ansible.vmhosts"
         ansible.verbose = true
         ansible.host_key_checking = false
      end

      box.vm.provision "dev_cpp", type: "ansible" do |ansible|
         ansible.playbook = "ansible/playbooks/dev_cpp/bootstrap.yml"
         #ansible.inventory_path = "ansible/ansible.vmhosts"
         ansible.verbose = true
         ansible.host_key_checking = false
      end
    end
  end

  (1..N_ERL).each do |machine_id|
    config.vm.define "erlang#{machine_id}", autostart: false do |box|

      box.vm.box = "#{WORKSPACE_VM_BOX_WITH_GUI}"
      box.vm.box_url = "#{WORKSPACE_VM_BOX_WITH_GUI_URL}"

    #  box.vm.network :forwarded_port, guest: 22, host: "21#{WS_IP_SPACE_ERL_START+machine_id}"
      box.vm.host_name = "erlang#{machine_id}.vm"
      box.vm.network :private_network, ip: "#{WS_IP_FIRST_24BITS}#{WS_IP_SPACE_ERL_START+machine_id}"
      box.vm.synced_folder  "projects", "/projects"
      # box.vm.synced_folder  "projects_sberl#{machine_id}", "/projects_sberl#{machine_id}"

      box.vm.provider "virtualbox" do |vb|
        vb.gui = true
        vb.memory = "2048"
        vb.customize ["modifyvm", :id, "--vram", "16"]
        vb.cpus = 2

      # Windows does not take it well
      #  vb.customize ["modifyvm", :id, "--audio", 'coreaudio']

      end

      box.vm.provision "shell", inline: <<-SHELL
        export DEBIAN_FRONTEND=noninteractive
        apt-get install -y dos2unix 
        mkdir -p /home/vagrant/tmp_provisioning
        dos2unix -q -n /vagrant/scripts/bootstrap.sh /home/vagrant/tmp_provisioning/bootstrap.sh
        source /home/vagrant/tmp_provisioning/bootstrap.sh
        source /home/vagrant/tmp_provisioning/git.sh
        source /home/vagrant/tmp_provisioning/erlang.sh
      SHELL

      box.vm.provision "dev_generic", type: "ansible" do |ansible|
         ansible.playbook = "ansible/playbooks/dev_generic/bootstrap.yml"
         #ansible.inventory_path = "ansible/ansible.vmhosts"
         ansible.verbose = true
         ansible.host_key_checking = false
      end

      box.vm.provision "dev_erl", type: "ansible" do |ansible|
         ansible.playbook = "ansible/playbooks/dev_erl/bootstrap.yml"
         #ansible.inventory_path = "ansible/ansible.vmhosts"
         ansible.verbose = true
         ansible.host_key_checking = false
      end
    end
  end

  (1..N_SCALA).each do |machine_id|
    config.vm.define "scala#{machine_id}", autostart: false do |box|

      box.vm.box = "#{WORKSPACE_VM_BOX_WITH_GUI}"
      box.vm.box_url = "#{WORKSPACE_VM_BOX_WITH_GUI_URL}"

      # box.vm.network :forwarded_port, guest: 22, host: "21#{WS_IP_SPACE_SCALA_START+machine_id}"
      # box.ssh.forward_agent = true
      # box.ssh.insert_key = false
      # box.vm.boot_timeout = 1200
      
      box.vm.host_name = "scala#{machine_id}.vm"
      box.vm.network :private_network, ip: "#{WS_IP_FIRST_24BITS}#{WS_IP_SPACE_SCALA_START+machine_id}"
      box.vm.synced_folder  "projects", "/projects"
      # box.vm.synced_folder  "projects_sbsc#{machine_id}", "/projects_sbsc#{machine_id}"

      box.vm.provider "virtualbox" do |vb|
        vb.gui = true
        vb.memory = "4096"
        # vb.memory = "2048"
        vb.customize ["modifyvm", :id, "--vram", "16"]
        vb.cpus = 2
        vb.customize ["modifyvm", :id, "--audio", 'coreaudio']
      end

      box.vm.provision "shell", inline: <<-SHELL
        export DEBIAN_FRONTEND=noninteractive
        apt-get install -y dos2unix 
        mkdir -p /home/vagrant/tmp_provisioning
        dos2unix -q -n /vagrant/scripts/bootstrap.sh /home/vagrant/tmp_provisioning/bootstrap.sh
        source /home/vagrant/tmp_provisioning/bootstrap.sh
        source /home/vagrant/tmp_provisioning/git.sh
        source /home/vagrant/tmp_provisioning/jdk.sh
        source /home/vagrant/tmp_provisioning/sbt.sh
        source /home/vagrant/tmp_provisioning/scala.sh
      SHELL

      box.vm.provision "dev_generic", type: "ansible" do |ansible|
         ansible.playbook = "ansible/playbooks/dev_generic/bootstrap.yml"
         #ansible.inventory_path = "ansible/ansible.vmhosts"
         ansible.verbose = true
         ansible.host_key_checking = false
      end
   
      box.vm.provision "dev_scala", type: "ansible" do |ansible|
         ansible.playbook = "ansible/playbooks/dev_scala/bootstrap.yml"
        #ansible.inventory_path = "ansible/ansible.vmhosts"
         ansible.verbose = true
         ansible.host_key_checking = false
      end

      box.vm.provision "shell", path: "scripts/kafka.sh", args:"#{machine_id}", privileged: false

    end
  end

  (1..N_ZOOKEEPER).each do |machine_id|
    config.vm.define "zookeeper#{machine_id}", autostart: false do |box|

      box.vm.box = "#{WORKSPACE_VM_BOX_WITH_GUI}"
      box.vm.box_url = "#{WORKSPACE_VM_BOX_WITH_GUI_URL}"

      # box.vm.network :forwarded_port, guest: 22, host: "21#{WS_IP_SPACE_ZOOKEEPER_START+machine_id}"
      box.vm.host_name = "zookeeper#{machine_id}.vm"
      box.vm.network :private_network, ip: "#{WS_IP_FIRST_24BITS}#{WS_IP_SPACE_ZOOKEEPER_START+machine_id}"
      box.vm.synced_folder  "projects", "/projects"
#      box.vm.synced_folder  "projects_sbsc#{machine_id}", "/projects_sbsc#{machine_id}"

      box.vm.provider "virtualbox" do |vb|
        vb.gui = true
        vb.memory = "2048"
        vb.customize ["modifyvm", :id, "--vram", "16"]
        vb.cpus = 2
        vb.customize ["modifyvm", :id, "--audio", 'coreaudio']
      end

      box.vm.provision "shell", inline: <<-SHELL
        export DEBIAN_FRONTEND=noninteractive
        apt-get install -y dos2unix 
        mkdir -p /home/vagrant/tmp_provisioning
        dos2unix -q -n /vagrant/scripts/bootstrap.sh /home/vagrant/tmp_provisioning/bootstrap.sh
        source /home/vagrant/tmp_provisioning/bootstrap.sh
        source /home/vagrant/tmp_provisioning/git.sh
        source /home/vagrant/tmp_provisioning/jdk.sh
        source /home/vagrant/tmp_provisioning/zookeeper.sh #{machine_id}
      SHELL
      
      box.vm.provision "dev_generic", type: "ansible" do |ansible|
         ansible.playbook = "ansible/playbooks/dev_generic/bootstrap.yml"
         #ansible.inventory_path = "ansible/ansible.vmhosts"
         ansible.verbose = true
         ansible.host_key_checking = false
      end
   
      box.vm.provision "dev_scala", type: "ansible" do |ansible|
         ansible.playbook = "ansible/playbooks/dev_scala/bootstrap.yml"
         #ansible.inventory_path = "ansible/ansible.vmhosts"
         ansible.verbose = true
         ansible.host_key_checking = false
      end

      # we do not have to have it on this vm.
      # box.vm.provision "shell", path: "scripts/kafka.sh", args:"#{machine_id}", privileged: false
    end
  end

  (1..N_KAFKA_BROKER).each do |machine_id|
    config.vm.define "kafka_broker#{machine_id}", autostart: false do |box|

      box.vm.box = "#{WORKSPACE_VM_BOX_WITH_GUI}"
      box.vm.box_url = "#{WORKSPACE_VM_BOX_WITH_GUI_URL}"

      # box.vm.network :forwarded_port, guest: 22, host: "21#{WS_IP_SPACE_KAFKA_BROKER_START+machine_id}"
      box.vm.host_name = "kafka-broker#{machine_id}.vm"
      box.vm.network :private_network, ip: "#{WS_IP_FIRST_24BITS}#{WS_IP_SPACE_KAFKA_BROKER_START+machine_id}"
      box.vm.synced_folder  "projects", "/projects"
#      box.vm.synced_folder  "projects_sbsc#{machine_id}", "/projects_sbsc#{machine_id}"

      box.vm.provider "virtualbox" do |vb|
        vb.gui = true
        vb.memory = "2048"
        vb.customize ["modifyvm", :id, "--vram", "16"]
        vb.cpus = 2
        vb.customize ["modifyvm", :id, "--audio", 'coreaudio']
      end

      box.vm.provision "shell", inline: <<-SHELL
        export DEBIAN_FRONTEND=noninteractive
        apt-get install -y dos2unix 
        mkdir -p /home/vagrant/tmp_provisioning
        dos2unix -q -n /vagrant/scripts/bootstrap.sh /home/vagrant/tmp_provisioning/bootstrap.sh
        source /home/vagrant/tmp_provisioning/bootstrap.sh
        source /home/vagrant/tmp_provisioning/git.sh
        source /home/vagrant/tmp_provisioning/jdk.sh
      SHELL
      
      box.vm.provision "dev_generic", type: "ansible" do |ansible|
         ansible.playbook = "ansible/playbooks/dev_generic/bootstrap.yml"
         #ansible.inventory_path = "ansible/ansible.vmhosts"
         ansible.verbose = true
         ansible.host_key_checking = false
      end
   
      box.vm.provision "dev_scala", type: "ansible" do |ansible|
         ansible.playbook = "ansible/playbooks/dev_scala/bootstrap.yml"
         #ansible.inventory_path = "ansible/ansible.vmhosts"
         ansible.verbose = true
         ansible.host_key_checking = false
      end

      box.vm.provision "shell", path: "scripts/kafka.sh", args:"#{machine_id}", privileged: false
      
      box.vm.provision "shell", path: "scripts/kafka_start_broker.sh", args:"#{machine_id}", privileged: false
    end
  end

  (1..N_JAVASCRIPT).each do |machine_id|
    config.vm.define "javascript#{machine_id}", autostart: false do |box|

      box.vm.box = "#{WORKSPACE_VM_BOX_WITH_GUI}"
      box.vm.box_url = "#{WORKSPACE_VM_BOX_WITH_GUI_URL}"

      # box.vm.network :forwarded_port, guest: 22, host: "21#{WS_IP_SPACE_JAVASCRIPT_START+machine_id}"
      box.vm.host_name = "javascript#{machine_id}.vm"
      box.vm.network :private_network, ip: "#{WS_IP_FIRST_24BITS}#{WS_IP_SPACE_JAVASCRIPT_START+machine_id}"
      box.vm.synced_folder  "projects", "/projects"

      box.vm.provider "virtualbox" do |vb|
        vb.gui = true
        vb.memory = "2048"
        vb.customize ["modifyvm", :id, "--vram", "16"]
        vb.cpus = 2
      end

      box.vm.provision "shell", inline: <<-SHELL
        export DEBIAN_FRONTEND=noninteractive
        apt-get install -y dos2unix 
        mkdir -p /home/vagrant/tmp_provisioning
        dos2unix -q -n /vagrant/scripts/bootstrap.sh /home/vagrant/tmp_provisioning/bootstrap.sh
        source /home/vagrant/tmp_provisioning/bootstrap.sh
      SHELL

      # Skipping Ansible, let the vm work with windows provisioners too
      #box.vm.provision "dev_generic", type: "ansible" do |ansible|
      #   ansible.playbook = "ansible/playbooks/dev_generic/bootstrap.yml"
      #   #ansible.inventory_path = "ansible/ansible.vmhosts"
      #   ansible.verbose = true
      #   ansible.host_key_checking = false
      #end

    end
  end

end


