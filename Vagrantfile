# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

# TODO: something got messed up with ubuntu boxes. Network acts out, especially with gui. Use w/o gui for now.
#WORKSPACE_VM_BOX_WITH_GUI = "ubuntu/bionic64"
##WORKSPACE_VM_BOX_WITH_GUI_URL = "https://atlas.hashicorp.com/box-cutter/ubuntu1404-desktop"

#WORKSPACE_VM_BOX_WITH_GUI = "box-cutter/ubuntu1604-desktop"
##WORKSPACE_VM_BOX_WITH_GUI = "box-cutter/ubuntu1610-desktop"
#WORKSPACE_VM_BOX_WITH_GUI_URL = "https://atlas.hashicorp.com/box-cutter/ubuntu1604-desktop"
##WORKSPACE_VM_BOX_WITH_GUI_URL = "https://app.vagrantup.com/box-cutter/boxes/ubuntu1604-desktop"

# 14.04
# WORKSPACE_VM_BOX_NO_GUI = "ubuntu/trusty64"
# WORKSPACE_VM_BOX_NO_GUI_URL = "http://files.vagrantup.com/trusty64.box"
# this was ok
# WORKSPACE_VM_BOX_WITH_GUI = "box-cutter/ubuntu1404-desktop"
# WORKSPACE_VM_BOX_WITH_GUI_URL = "https://atlas.hashicorp.com/box-cutter/ubuntu1404-desktop"

# 16.04
# WORKSPACE_VM_BOX_NO_GUI = "ubuntu/xenial64"
# WORKSPACE_VM_BOX_NO_GUI_URL = "http://files.vagrantup.com/xenial64.box"

# 18
WORKSPACE_VM_BOX_WITH_GUI = "ubuntu/bionic64"
WORKSPACE_VM_BOX_NO_GUI = "ubuntu/bionic64"
# maybe upgrade to 18 too
#WORKSPACE_VM_BOX_WITH_GUI_URL = "https://app.vagrantup.com/box-cutter/boxes/ubuntu1604-desktop"



WORKSPACE_VM_BOOT_TIMEOUT = 2400

##################################################
#
# !! When editing, sync the following with hosts_append.txt and ansible.vmhosts
#

WS_IP_FIRST_24BITS = "192.168.10."
WS_NETWORK_NAME = "vagrant_ws"

# The ssh ports will be 2201...
# the host 127.0.0.1
WS_SSH_PORT_SPACE_START = 2300

WS_IP_SPACE_TEST_START = 1

WS_IP_SPACE_GENERIC_START = 2

WS_IP_SPACE_YARC_SERVER_START = 10
N_YARC_Servers = 3

WS_IP_SPACE_YARC_CLIENT_START = 20
N_YARC_Clients =3

WS_IP_SPACE_CPP_START = 25
N_CPP = 2

WS_IP_SPACE_ERL_START = 30
N_ERL = 2

WS_IP_SPACE_SCALA_START = 35
N_SCALA = 2

WS_IP_SPACE_MYSQL_START = 40
N_MYSQL = 1

WS_IP_SPACE_HAPROXY_START = 45
N_HAPROXY = 3

WS_IP_SPACE_SHELL_START = 50

WS_IP_SPACE_PERL_START = 51

WS_IP_SPACE_JAVASCRIPT_START = 53
N_JAVASCRIPT = 1

WS_IP_SPACE_ZOOKEEPER_START = 55
N_ZOOKEEPER = 4

WS_IP_SPACE_KAFKA_BROKER_START = 60
N_KAFKA_BROKER = 5

WS_IP_SPACE_GOLANG_START = 65
N_GOLANG = 1

WS_IP_SPACE_DOCKER_START = 70
N_DOCKER = 1

WS_IP_SPACE_APACHE_START = 72
N_APACHE = 3

WS_IP_SPACE_GIT_START = 75
N_GIT = 2

WS_IP_SPACE_JENKINS_START = 78
N_JENKINS = 1

WS_IP_SPACE_SSH_START = 80
N_SSH = 3

WS_IP_SPACE_NGINX_START = 83
N_NGINX = 3

WS_IP_SPACE_WP_START = 86
N_WP = 3

WS_IP_SPACE_SMTP_START = 89
N_SMTP = 3

WS_IP_SPACE_ELIXIR_START = 92
N_ELIXIR = 3

WS_IP_SPACE_POSTGRES_START = 95
N_POSTGRES = 3

WS_IP_SPACE_CONFLUENT_KAFKA_BROKER_START = 98
N_CONFLUENT_KAFKA_BROKER = 5


# NOTE: ! Do not use those Starts over 99 - we are re-using it for port forwarding.

#######################################################################


Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

# This was helpful for 16.04
# https://gist.github.com/maxivak/c318fd085231b9ab934e631401c876b1

  # box to test Vagrant itself  
  config.vm.define "test1", autostart: false do |box|
    machine_id = 1

    box.vm.box = "ubuntu/xenial64"
    # box.vm.boot_timeout = WORKSPACE_VM_BOOT_TIMEOUT
      
    box.vm.provider "virtualbox" do |vb|
      # We do not have to have gui, we can save some memory if we don't.
      #vb.gui = true
      vb.memory = "2048"
      vb.customize ["modifyvm", :id, "--vram", "16"]
      vb.cpus = 2

      # win7 machine did not take this.
      #vb.customize ["modifyvm", :id, "--audio", 'coreaudio']
      
      ## For NAT adapter
      #vb.customize ["modifyvm", :id, "--nictype1", "Am79C973"]
      ## For host-only adapter
      #vb.customize ["modifyvm", :id, "--nictype2", "Am79C973"]

    end
    #  box.vm.network :forwarded_port, guest: 22, host: "21#{WS_IP_SPACE_GENERIC_START+machine_id}"
    #box.ssh.forward_agent = true
    box.vm.hostname = "test#{machine_id}.vm"
    box.vm.network :private_network, ip: "#{WS_IP_FIRST_24BITS}#{WS_IP_SPACE_TEST_START+machine_id}", netmask: "255.255.255.0", virtual_box__intnet: "{#WS_NETWORK_NAME}", drop_nat_interface_default_route: true, auto_config: false
##    box.vm.network "private_network", ip: "#{WS_IP_FIRST_24BITS}#{WS_IP_SPACE_GENERIC_START+machine_id}", netmask: "255.255.255.0", virtual_box__intnet: true
    box.vm.synced_folder  "projects", "/projects"

#    config.vm.provision "shell", inline: <<-SHELL
#      rm -f /etc/network/interfaces.d/eth1.cfg
#      echo "auto eth1" >> /etc/network/interfaces.d/eth1.cfg
#      echo "iface eth1 inet static" >> /etc/network/interfaces.d/eth1.cfg
#      echo "address #{WS_IP_FIRST_24BITS}#{WS_IP_SPACE_GENERIC_START+machine_id}" >> /etc/network/interfaces.d/eth1.cfg
#      echo "netmask 255.255.255.0" >> /etc/network/interfaces.d/eth1.cfg
#      ifdown eth1 && ifup eth1
#    SHELL
  
#    box.vm.provision "shell", inline: <<-SHELL
#      export DEBIAN_FRONTEND=noninteractive
#      apt-get install -y dos2unix 
#      mkdir -p /home/vagrant/tmp_provisioning
#      dos2unix -q -n /vagrant/scripts/bootstrap.sh /home/vagrant/tmp_provisioning/bootstrap.sh
#      source /home/vagrant/tmp_provisioning/bootstrap.sh
#    SHELL

  end

#######################################################################

  # Simplest generic box, with only shell provisioning  
  config.vm.define "gen1", autostart: false do |box|
    machine_id = 1

    #box.vm.box = "#{WORKSPACE_VM_BOX_NO_GUI}"
    ##box.vm.box = "ubuntu/xenial64"
    
    box.vm.box = "#{WORKSPACE_VM_BOX_WITH_GUI}"
    #box.vm.box_url = "#{WORKSPACE_VM_BOX_WITH_GUI_URL}"

    box.vm.boot_timeout = WORKSPACE_VM_BOOT_TIMEOUT

    #  box.vm.network :forwarded_port, guest: 22, host: "21#{WS_IP_SPACE_GENERIC_START+machine_id}"
    box.ssh.forward_agent = true
    box.vm.hostname = "gen#{machine_id}.vm"
#    box.vm.network :private_network, ip: "#{WS_IP_FIRST_24BITS}#{WS_IP_SPACE_GENERIC_START+machine_id}", netmask: "255.255.255.0", virtual_box__intnet: "{#WS_NETWORK_NAME}", drop_nat_interface_default_route: true, auto_config: false
#    box.vm.network "private_network", ip: "#{WS_IP_FIRST_24BITS}#{WS_IP_SPACE_GENERIC_START+machine_id}", netmask: "255.255.255.0", virtual_box__intnet: true
    box.vm.network :private_network, ip: "#{WS_IP_FIRST_24BITS}#{WS_IP_SPACE_GENERIC_START+machine_id}", netmask: "255.255.255.0", virtual_box__intnet: "{#WS_NETWORK_NAME}"
    box.vm.synced_folder  "projects", "/projects"
      
    box.vm.provider "virtualbox" do |vb|
      # We do not have to have gui, we can save some memory if we don't.
      #vb.gui = true
      vb.memory = "2048"
      vb.customize ["modifyvm", :id, "--vram", "16"]
      vb.cpus = 2

      # win7 machine did not take this.
      #vb.customize ["modifyvm", :id, "--audio", 'coreaudio']
      
#      # For NAT adapter
#      vb.customize ["modifyvm", :id, "--nictype1", "Am79C973"]
#      # For host-only adapter
#      vb.customize ["modifyvm", :id, "--nictype2", "Am79C973"]

    end

#    config.vm.provision "shell", inline: <<-SHELL
#      rm -f /etc/network/interfaces.d/eth1.cfg
#      echo "auto eth1" >> /etc/network/interfaces.d/eth1.cfg
#      echo "iface eth1 inet static" >> /etc/network/interfaces.d/eth1.cfg
#      echo "address #{WS_IP_FIRST_24BITS}#{WS_IP_SPACE_GENERIC_START+machine_id}" >> /etc/network/interfaces.d/eth1.cfg
#      echo "netmask 255.255.255.0" >> /etc/network/interfaces.d/eth1.cfg
#      ifdown eth1 && ifup eth1
#    SHELL
  
    box.vm.provision "shell", inline: <<-SHELL
      export DEBIAN_FRONTEND=noninteractive
    #  apt-get install -y dos2unix 
      mkdir -p /home/vagrant/tmp_provisioning
      cp /vagrant/scripts/bootstrap.sh /home/vagrant/tmp_provisioning/bootstrap.sh
    #  dos2unix -q /home/vagrant/tmp_provisioning/bootstrap.sh
      /home/vagrant/tmp_provisioning/bootstrap.sh
    #  /home/vagrant/tmp_provisioning/git_install.sh
    SHELL
  end

#######################################################################

  # another simple one
  config.vm.define "gen2", autostart: false do |box|
    machine_id = 2
    box.vm.box = "#{WORKSPACE_VM_BOX_WITH_GUI}"
    #box.vm.box_url = "#{WORKSPACE_VM_BOX_WITH_GUI_URL}"

    box.vm.boot_timeout = WORKSPACE_VM_BOOT_TIMEOUT

    #  box.vm.network :forwarded_port, guest: 22, host: "21#{WS_IP_SPACE_GENERIC_START+machine_id}"
    #box.ssh.forward_agent = true
    box.vm.host_name = "gen#{machine_id}.vm"
    box.vm.network :private_network, ip: "#{WS_IP_FIRST_24BITS}#{WS_IP_SPACE_GENERIC_START+machine_id}", netmask: "255.255.255.0", virtual_box__intnet: "{#WS_NETWORK_NAME}"
    box.vm.synced_folder  "projects", "/projects"

    box.vm.provider "virtualbox" do |vb|
      # We do not have to have gui, we can save some memory if we don't.
      vb.gui = false # true
      vb.memory = "3048"
      vb.customize ["modifyvm", :id, "--vram", "16"]
      vb.cpus = 2

      # win7 machine did not take this.
      #vb.customize ["modifyvm", :id, "--audio", 'coreaudio']
    end

    box.vm.provision "shell", inline: <<-SHELL
      export DEBIAN_FRONTEND=noninteractive
      #apt-get install -y dos2unix 
      mkdir -p /home/vagrant/tmp_provisioning
      cp /vagrant/scripts/bootstrap.sh /home/vagrant/tmp_provisioning/bootstrap.sh
      #dos2unix -q -n /vagrant/scripts/bootstrap.sh /home/vagrant/tmp_provisioning/bootstrap.sh
      /home/vagrant/tmp_provisioning/bootstrap.sh
      /home/vagrant/tmp_provisioning/git_install.sh
    SHELL
  end

  # A more feature-rich generic box
  config.vm.define "gen3", autostart: false do |box|
    machine_id = 3
    box.vm.box = "#{WORKSPACE_VM_BOX_WITH_GUI}"
    # box.vm.box_url = "#{WORKSPACE_VM_BOX_WITH_GUI_URL}"

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
      /home/vagrant/tmp_provisioning/bootstrap.sh
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

  (1..N_YARC_Servers).each do |machine_id|
    config.vm.define "yser#{machine_id}", autostart: false do |box|

      box.vm.box = "#{WORKSPACE_VM_BOX_WITH_GUI}"
     # box.vm.box_url = "#{WORKSPACE_VM_BOX_WITH_GUI_URL}"

     # box.vm.network :forwarded_port, guest: 22, host: "21#{WS_IP_SPACE_YARC_SERVER_START+machine_id}"
      box.ssh.forward_agent = true
      box.vm.host_name = "yser#{machine_id}.vm"
      box.vm.network :private_network, ip: "#{WS_IP_FIRST_24BITS}#{WS_IP_SPACE_YARC_SERVER_START+machine_id}"
      box.vm.synced_folder  "projects", "/projects"

      box.vm.provider "virtualbox" do |vb|
        # We do not have to have gui, we can save some memory if we don't.
        vb.gui = false # true
        #vb.memory = "1024"
        vb.memory = "4096"
        vb.customize ["modifyvm", :id, "--vram", "16"]
        vb.cpus = 4
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
      # apt-get install -y dos2unix 
        mkdir -p /home/vagrant/tmp_provisioning
        cp /vagrant/scripts/bootstrap.sh /home/vagrant/tmp_provisioning/bootstrap.sh
      # dos2unix -q -n /vagrant/scripts/bootstrap.sh /home/vagrant/tmp_provisioning/bootstrap.sh
        /home/vagrant/tmp_provisioning/bootstrap.sh
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
      # box.vm.box_url = "#{WORKSPACE_VM_BOX_WITH_GUI_URL}"

     # box.vm.network :forwarded_port, guest: 22, host: "21#{WS_IP_SPACE_YARC_CLIENT_START+machine_id}"
      box.vm.host_name = "ycli#{machine_id}.vm"
      box.vm.network :private_network, ip: "#{WS_IP_FIRST_24BITS}#{WS_IP_SPACE_YARC_CLIENT_START+machine_id}"
      box.vm.synced_folder  "projects", "/projects"

      box.vm.provider "virtualbox" do |vb|
        vb.gui = false # true
        vb.memory = "1024"
        vb.customize ["modifyvm", :id, "--vram", "16"]
        vb.cpus = 2
        vb.customize ["modifyvm", :id, "--audio", 'coreaudio']
      end

      box.vm.provision "shell", inline: <<-SHELL
        export DEBIAN_FRONTEND=noninteractive
       #apt-get install -y dos2unix 
        mkdir -p /home/vagrant/tmp_provisioning
        cp /vagrant/scripts/bootstrap.sh /home/vagrant/tmp_provisioning/bootstrap.sh
       #dos2unix -q -n /vagrant/scripts/bootstrap.sh /home/vagrant/tmp_provisioning/bootstrap.sh
        /home/vagrant/tmp_provisioning/bootstrap.sh
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
      # box.vm.box_url = "#{WORKSPACE_VM_BOX_WITH_GUI_URL}"

    #  box.vm.network :forwarded_port, guest: 22, host: "21#{WS_IP_SPACE_CPP_START+machine_id}"
      box.vm.host_name = "cpp#{machine_id}.vm"
      box.vm.network :private_network, ip: "#{WS_IP_FIRST_24BITS}#{WS_IP_SPACE_CPP_START+machine_id}"
      box.vm.synced_folder  "projects", "/projects"
      # box.vm.synced_folder  "projects_sbcpp#{machine_id}", "/projects_sbcpp#{machine_id}"

      box.vm.provider "virtualbox" do |vb|
        vb.gui = false # true
        vb.memory = "2048"
        vb.customize ["modifyvm", :id, "--vram", "16"]
        vb.cpus = 2
      #  vb.customize ["modifyvm", :id, "--audio", 'coreaudio']
      end

      box.vm.provision "shell", inline: <<-SHELL
        export DEBIAN_FRONTEND=noninteractive
       #apt-get install -y dos2unix 
        mkdir -p /home/vagrant/tmp_provisioning
        cp /vagrant/scripts/bootstrap.sh /home/vagrant/tmp_provisioning/bootstrap.sh
       #dos2unix -q -n /vagrant/scripts/bootstrap.sh /home/vagrant/tmp_provisioning/bootstrap.sh
        /home/vagrant/tmp_provisioning/bootstrap.sh
        
        /home/vagrant/tmp_provisioning/gcc_install.sh
        /home/vagrant/tmp_provisioning/m4_install.sh
        /home/vagrant/tmp_provisioning/autotools_install.sh
        /home/vagrant/tmp_provisioning/python_install.sh
                
        /home/vagrant/tmp_provisioning/git_install.sh
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
      # box.vm.box_url = "#{WORKSPACE_VM_BOX_WITH_GUI_URL}"

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
       #apt-get install -y dos2unix 
        mkdir -p /home/vagrant/tmp_provisioning
        cp /vagrant/scripts/bootstrap.sh /home/vagrant/tmp_provisioning/bootstrap.sh
       #dos2unix -q -n /vagrant/scripts/bootstrap.sh /home/vagrant/tmp_provisioning/bootstrap.sh
        /home/vagrant/tmp_provisioning/bootstrap.sh
        /home/vagrant/tmp_provisioning/git_install.sh
        /home/vagrant/tmp_provisioning/erlang.sh
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

      box.vm.box = "#{WORKSPACE_VM_BOX_NO_GUI}"
      # box.vm.box = "#{WORKSPACE_VM_BOX_WITH_GUI}"
      # box.vm.box_url = "#{WORKSPACE_VM_BOX_WITH_GUI_URL}"

      # box.vm.network :forwarded_port, guest: 22, host: "21#{WS_IP_SPACE_SCALA_START+machine_id}"
      # box.ssh.forward_agent = true
      # box.ssh.insert_key = false
      box.vm.boot_timeout = WORKSPACE_VM_BOOT_TIMEOUT
      
      box.vm.host_name = "scala#{machine_id}.vm"
      box.vm.network :private_network, ip: "#{WS_IP_FIRST_24BITS}#{WS_IP_SPACE_SCALA_START+machine_id}"
      box.vm.synced_folder  "projects", "/projects"
      # box.vm.synced_folder  "projects_sbsc#{machine_id}", "/projects_sbsc#{machine_id}"

      box.vm.provider "virtualbox" do |vb|
        # TODO: The desktop version of the vm is screwed up. :-( It would be nice to repair for using IntelliJ
        #vb.gui = true
        vb.memory = "4096"
        # vb.memory = "2048"
        vb.customize ["modifyvm", :id, "--vram", "16"]
        vb.cpus = 2
        vb.customize ["modifyvm", :id, "--audio", 'coreaudio']
      end

      box.vm.provision "shell", inline: <<-SHELL
        export DEBIAN_FRONTEND=noninteractive
       #apt-get install -y dos2unix 
        mkdir -p /home/vagrant/tmp_provisioning
        cp /vagrant/scripts/bootstrap.sh /home/vagrant/tmp_provisioning/bootstrap.sh
       #dos2unix -q -n /vagrant/scripts/bootstrap.sh /home/vagrant/tmp_provisioning/bootstrap.sh
        /home/vagrant/tmp_provisioning/bootstrap.sh
        
        /home/vagrant/tmp_provisioning/gcc_install.sh
        /home/vagrant/tmp_provisioning/m4_install.sh
        /home/vagrant/tmp_provisioning/autotools_install.sh
        /home/vagrant/tmp_provisioning/python_install.sh
                
        /home/vagrant/tmp_provisioning/git_install.sh
        /home/vagrant/tmp_provisioning/jdk_install.sh
        /home/vagrant/tmp_provisioning/sbt_install.sh
        /home/vagrant/tmp_provisioning/scala_install.sh
      SHELL

      box.vm.provision "dev_generic", type: "ansible" do |ansible|
         ansible.playbook = "ansible/playbooks/dev_generic/bootstrap.yml"
         ansible.inventory_path = "ansible/ansible.vmhosts"
         ansible.verbose = true
         ansible.host_key_checking = false
      end
   
      box.vm.provision "dev_scala", type: "ansible" do |ansible|
         ansible.playbook = "ansible/playbooks/dev_scala/bootstrap.yml"
         ansible.inventory_path = "ansible/ansible.vmhosts"
         ansible.verbose = true
         ansible.host_key_checking = false
      end

      box.vm.provision "shell", path: "scripts/kafka_install.sh", args:"#{machine_id}", privileged: false

    end
  end

  (1..N_MYSQL).each do |machine_id|
    config.vm.define "mysql#{machine_id}", autostart: false do |box|

      box.vm.box = "#{WORKSPACE_VM_BOX_NO_GUI}"
      # box.vm.box = "#{WORKSPACE_VM_BOX_WITH_GUI}"
      # box.vm.box_url = "#{WORKSPACE_VM_BOX_WITH_GUI_URL}"

      # box.vm.network :forwarded_port, guest: 22, host: "21#{WS_IP_SPACE_MYSQLSTART+machine_id}"
      # box.ssh.forward_agent = true
      # box.ssh.insert_key = false
      box.vm.boot_timeout = WORKSPACE_VM_BOOT_TIMEOUT
      
      box.vm.host_name = "haproxy#{machine_id}.vm"
      box.vm.network :private_network, ip: "#{WS_IP_FIRST_24BITS}#{WS_IP_SPACE_MYSQL_START+machine_id}"
      box.vm.synced_folder  "projects", "/projects"

      box.vm.provider "virtualbox" do |vb|
        # TODO: The desktop version of the vm is screwed up. :-( It would be nice to repair for using IntelliJ
        #vb.gui = true
        vb.memory = "4096"
        # vb.memory = "2048"
        vb.customize ["modifyvm", :id, "--vram", "16"]
        vb.cpus = 2
        vb.customize ["modifyvm", :id, "--audio", 'coreaudio']
      end

      box.vm.provision "shell", inline: <<-SHELL
        export DEBIAN_FRONTEND=noninteractive
       #apt-get install -y dos2unix 
        mkdir -p /home/vagrant/tmp_provisioning
        cp /vagrant/scripts/bootstrap.sh /home/vagrant/tmp_provisioning/bootstrap.sh
       #dos2unix -q -n /vagrant/scripts/bootstrap.sh /home/vagrant/tmp_provisioning/bootstrap.sh
        /home/vagrant/tmp_provisioning/bootstrap.sh
        /home/vagrant/tmp_provisioning/mysql_install.sh
        # TODO: finish mysql boxes
      SHELL

      box.vm.provision "dev_generic", type: "ansible" do |ansible|
         ansible.playbook = "ansible/playbooks/generic/bootstrap.yml"
         #ansible.inventory_path = "ansible/ansible.vmhosts"
         ansible.verbose = true
         ansible.host_key_checking = false
      end
   
    end
  end

  (1..N_HAPROXY).each do |machine_id|
    config.vm.define "haproxy#{machine_id}", autostart: false do |box|

      box.vm.box = "#{WORKSPACE_VM_BOX_NO_GUI}"
      # box.vm.box = "#{WORKSPACE_VM_BOX_WITH_GUI}"
      # box.vm.box_url = "#{WORKSPACE_VM_BOX_WITH_GUI_URL}"

      # box.vm.network :forwarded_port, guest: 22, host: "21#{WS_IP_SPACE_HAPROXY_START+machine_id}"
      # box.ssh.forward_agent = true
      # box.ssh.insert_key = false
      box.vm.boot_timeout = WORKSPACE_VM_BOOT_TIMEOUT
      
      box.vm.host_name = "haproxy#{machine_id}.vm"
      box.vm.network :private_network, ip: "#{WS_IP_FIRST_24BITS}#{WS_IP_SPACE_HAPROXY_START+machine_id}"
      box.vm.synced_folder  "projects", "/projects"

      box.vm.provider "virtualbox" do |vb|
        # TODO: The desktop version of the vm is screwed up. :-( It would be nice to repair for using IntelliJ
        #vb.gui = true
        vb.memory = "4096"
        # vb.memory = "2048"
        vb.customize ["modifyvm", :id, "--vram", "16"]
        vb.cpus = 2
        vb.customize ["modifyvm", :id, "--audio", 'coreaudio']
      end

      box.vm.provision "shell", inline: <<-SHELL
        export DEBIAN_FRONTEND=noninteractive
       #apt-get install -y dos2unix 
        mkdir -p /home/vagrant/tmp_provisioning
        cp /vagrant/scripts/bootstrap.sh /home/vagrant/tmp_provisioning/bootstrap.sh
       #dos2unix -q -n /vagrant/scripts/bootstrap.sh /home/vagrant/tmp_provisioning/bootstrap.sh
        /home/vagrant/tmp_provisioning/bootstrap.sh
        /home/vagrant/tmp_provisioning/haproxy.sh
        # TODO: finish haproxy boxes
      SHELL

      box.vm.provision "dev_generic", type: "ansible" do |ansible|
         ansible.playbook = "ansible/playbooks/generic/bootstrap.yml"
         #ansible.inventory_path = "ansible/ansible.vmhosts"
         ansible.verbose = true
         ansible.host_key_checking = false
      end
   
    end
  end

  config.vm.define "shell1", autostart: false do |box|
    machine_id = 1
    box.vm.box = "#{WORKSPACE_VM_BOX_NO_GUI}"
    #box.vm.box = "#{WORKSPACE_VM_BOX_WITH_GUI}"
    #box.vm.box_url = "#{WORKSPACE_VM_BOX_WITH_GUI_URL}"

    box.ssh.forward_agent = true
    box.vm.host_name = "shell#{machine_id}.vm"
    box.vm.network :private_network, ip: "#{WS_IP_FIRST_24BITS}#{WS_IP_SPACE_SHELL_START+machine_id}"
    box.vm.synced_folder  "projects", "/projects"
    # box.vm.synced_folder  "projects_sbshell#{machine_id}", "/projects_sbshell#{machine_id}"

    box.vm.provider "virtualbox" do |vb|
      # We do not have to have gui, we can save some memory if we don't.
      #vb.gui = true
      vb.memory = "2048"
      vb.customize ["modifyvm", :id, "--vram", "16"]
      vb.cpus = 2

      # win machines did not take this.
      #vb.customize ["modifyvm", :id, "--audio", 'coreaudio']
    end

    box.vm.provision "shell", inline: <<-SHELL
      export DEBIAN_FRONTEND=noninteractive
     #apt-get install -y dos2unix 
      mkdir -p /home/vagrant/tmp_provisioning
      cp /vagrant/scripts/bootstrap.sh /home/vagrant/tmp_provisioning/bootstrap.sh
     #dos2unix -q -n /vagrant/scripts/bootstrap.sh /home/vagrant/tmp_provisioning/bootstrap.sh
      /home/vagrant/tmp_provisioning/bootstrap.sh
    SHELL
  end

  config.vm.define "perl1", autostart: false do |box|
    machine_id = 1
    box.vm.box = "#{WORKSPACE_VM_BOX_WITH_GUI}"
    # box.vm.box_url = "#{WORKSPACE_VM_BOX_WITH_GUI_URL}"

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

  (1..N_JAVASCRIPT).each do |machine_id|
    config.vm.define "javascript#{machine_id}", autostart: false do |box|

      box.vm.box = "#{WORKSPACE_VM_BOX_WITH_GUI}"
      # box.vm.box_url = "#{WORKSPACE_VM_BOX_WITH_GUI_URL}"

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
       #apt-get install -y dos2unix 
        mkdir -p /home/vagrant/tmp_provisioning
        cp /vagrant/scripts/bootstrap.sh /home/vagrant/tmp_provisioning/bootstrap.sh
       #dos2unix -q -n /vagrant/scripts/bootstrap.sh /home/vagrant/tmp_provisioning/bootstrap.sh
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

  (1..N_ZOOKEEPER).each do |machine_id|
    config.vm.define "zookeeper#{machine_id}", autostart: false do |box|

      config.ssh.shell = "bash -c 'BASH_ENV=/etc/profile exec bash'"

      box.vm.box = "#{WORKSPACE_VM_BOX_NO_GUI}"
      #box.vm.box = "#{WORKSPACE_VM_BOX_WITH_GUI}"
      #box.vm.box_url = "#{WORKSPACE_VM_BOX_WITH_GUI_URL}"

      # box.vm.network :forwarded_port, guest: 22, host: "21#{WS_IP_SPACE_ZOOKEEPER_START+machine_id}"
      box.vm.host_name = "zookeeper#{machine_id}.vm"
      box.vm.network :private_network, ip: "#{WS_IP_FIRST_24BITS}#{WS_IP_SPACE_ZOOKEEPER_START+machine_id}"
      box.vm.synced_folder  "projects", "/projects"
#      box.vm.synced_folder  "projects_sbsc#{machine_id}", "/projects_sbsc#{machine_id}"

      box.vm.provider "virtualbox" do |vb|
        vb.memory = "2048"
        vb.cpus = 2
      end

      box.vm.provision "shell", inline: <<-SHELL
        export DEBIAN_FRONTEND=noninteractive
      #  apt-get install -y dos2unix 
        mkdir -p /home/vagrant/tmp_provisioning
        cp /vagrant/scripts/bootstrap.sh /home/vagrant/tmp_provisioning/bootstrap.sh
      #  dos2unix -q /home/vagrant/tmp_provisioning/bootstrap.sh
        /home/vagrant/tmp_provisioning/bootstrap.sh
      #  /home/vagrant/tmp_provisioning/git_install.sh
        /home/vagrant/tmp_provisioning/jdk_install.sh
      # /home/vagrant/tmp_provisioning/zookeeper_install.sh
        /home/vagrant/tmp_provisioning/zookeeper_install.sh
      SHELL
      
      box.vm.provision "generic", type: "ansible" do |ansible|
         ansible.playbook = "ansible/playbooks/generic/bootstrap.yml"
         #ansible.inventory_path = "ansible/ansible.vmhosts"
         ansible.verbose = true
         ansible.host_key_checking = false
      end
      
      #box.vm.provision "dev_generic", type: "ansible" do |ansible|
      #   ansible.playbook = "ansible/playbooks/dev_generic/bootstrap.yml"
      #   #ansible.inventory_path = "ansible/ansible.vmhosts"
      #   ansible.verbose = true
      #   ansible.host_key_checking = false
      #end

      box.vm.provision "shell", inline: <<-SHELL
         /home/vagrant/tmp_provisioning/zookeeper_start.sh #{machine_id}
      SHELL
      
      #box.vm.provision "dev_scala", type: "ansible" do |ansible|
      #   ansible.playbook = "ansible/playbooks/dev_scala/bootstrap.yml"
      #   #ansible.inventory_path = "ansible/ansible.vmhosts"
      #   ansible.verbose = true
      #   ansible.host_key_checking = false
      #end

      # we do not have to have it on this vm.
      # box.vm.provision "shell", path: "scripts/kafka_install.sh", args:"#{machine_id}", privileged: false
    end
  end

  (1..N_KAFKA_BROKER).each do |machine_id|
    config.vm.define "kafka_broker#{machine_id}", autostart: false do |box|

      config.ssh.shell = "bash -c 'BASH_ENV=/etc/profile exec bash'"

      box.vm.box = "#{WORKSPACE_VM_BOX_NO_GUI}"
      #box.vm.box = "#{WORKSPACE_VM_BOX_WITH_GUI}"
      #box.vm.box_url = "#{WORKSPACE_VM_BOX_WITH_GUI_URL}"
      
      # box.vm.network :forwarded_port, guest: 22, host: "21#{WS_IP_SPACE_KAFKA_BROKER_START+machine_id}"
      box.vm.host_name = "kafka-broker#{machine_id}.vm"
      box.vm.network :private_network, ip: "#{WS_IP_FIRST_24BITS}#{WS_IP_SPACE_KAFKA_BROKER_START+machine_id}"
      box.vm.synced_folder  "projects", "/projects"
#      box.vm.synced_folder  "projects_sbsc#{machine_id}", "/projects_sbsc#{machine_id}"

      box.vm.provider "virtualbox" do |vb|
        vb.memory = "2048"
        vb.cpus = 2
      end

      box.vm.provision "shell", inline: <<-SHELL
             export DEBIAN_FRONTEND=noninteractive
            #  apt-get install -y dos2unix 
             mkdir -p /home/vagrant/tmp_provisioning
             cp /vagrant/scripts/bootstrap.sh /home/vagrant/tmp_provisioning/bootstrap.sh
            #  dos2unix -q /home/vagrant/tmp_provisioning/bootstrap.sh
             /home/vagrant/tmp_provisioning/bootstrap.sh
            #  source /home/vagrant/tmp_provisioning/git_install.sh
             /home/vagrant/tmp_provisioning/jdk_install.sh
             /home/vagrant/tmp_provisioning/kafka_install.sh
       SHELL
            
      box.vm.provision "generic", type: "ansible" do |ansible|
           ansible.playbook = "ansible/playbooks/generic/bootstrap.yml"
           #ansible.inventory_path = "ansible/ansible.vmhosts"
           ansible.verbose = true
           ansible.host_key_checking = false
      end
            
      #box.vm.provision "dev_generic", type: "ansible" do |ansible|
      #   ansible.playbook = "ansible/playbooks/dev_generic/bootstrap.yml"
      #   #ansible.inventory_path = "ansible/ansible.vmhosts"
      #   ansible.verbose = true
      #   ansible.host_key_checking = false
      #end

      #box.vm.provision "dev_scala", type: "ansible" do |ansible|
      #   ansible.playbook = "ansible/playbooks/dev_scala/bootstrap.yml"
      #   #ansible.inventory_path = "ansible/ansible.vmhosts"
      #   ansible.verbose = true
      #   ansible.host_key_checking = false
      #end

      box.vm.provision "shell", inline: <<-SHELL
         /home/vagrant/tmp_provisioning/kafka_start.sh "#{machine_id}"
      SHELL
      
    end
  end

  (1..N_CONFLUENT_KAFKA_BROKER).each do |machine_id|
    config.vm.define "conf_kafka_broker#{machine_id}", autostart: false do |box|

      config.ssh.shell = "bash -c 'BASH_ENV=/etc/profile exec bash'"

      box.vm.box = "#{WORKSPACE_VM_BOX_NO_GUI}"
      #box.vm.box = "#{WORKSPACE_VM_BOX_WITH_GUI}"
      #box.vm.box_url = "#{WORKSPACE_VM_BOX_WITH_GUI_URL}"
      
      # box.vm.network :forwarded_port, guest: 22, host: "21#{WS_IP_SPACE_CONFLUENT_KAFKA_BROKER_START+machine_id}"
      box.vm.host_name = "conf-kafka-broker#{machine_id}.vm"
      box.vm.network :private_network, ip: "#{WS_IP_FIRST_24BITS}#{WS_IP_SPACE_CONFLUENT_KAFKA_BROKER_START+machine_id}"
      box.vm.synced_folder  "projects", "/projects"
#      box.vm.synced_folder  "projects_sbsc#{machine_id}", "/projects_sbsc#{machine_id}"

      box.vm.provider "virtualbox" do |vb|
        vb.memory = "2048"
        vb.cpus = 2
      end

      box.vm.provision "shell", inline: <<-SHELL
             export DEBIAN_FRONTEND=noninteractive
            #  apt-get install -y dos2unix 
             mkdir -p /home/vagrant/tmp_provisioning
             cp /vagrant/scripts/bootstrap.sh /home/vagrant/tmp_provisioning/bootstrap.sh
            #  dos2unix -q /home/vagrant/tmp_provisioning/bootstrap.sh
             /home/vagrant/tmp_provisioning/bootstrap.sh
            #  source /home/vagrant/tmp_provisioning/git_install.sh
             /home/vagrant/tmp_provisioning/jdk_install.sh
             /home/vagrant/tmp_provisioning/conf_kafka_install.sh
       SHELL
            
      box.vm.provision "generic", type: "ansible" do |ansible|
           ansible.playbook = "ansible/playbooks/generic/bootstrap.yml"
           #ansible.inventory_path = "ansible/ansible.vmhosts"
           ansible.verbose = true
           ansible.host_key_checking = false
      end
            
      #box.vm.provision "dev_generic", type: "ansible" do |ansible|
      #   ansible.playbook = "ansible/playbooks/dev_generic/bootstrap.yml"
      #   #ansible.inventory_path = "ansible/ansible.vmhosts"
      #   ansible.verbose = true
      #   ansible.host_key_checking = false
      #end

      #box.vm.provision "dev_scala", type: "ansible" do |ansible|
      #   ansible.playbook = "ansible/playbooks/dev_scala/bootstrap.yml"
      #   #ansible.inventory_path = "ansible/ansible.vmhosts"
      #   ansible.verbose = true
      #   ansible.host_key_checking = false
      #end

      box.vm.provision "shell", inline: <<-SHELL
         /home/vagrant/tmp_provisioning/conf_kafka_start.sh "#{machine_id}"
      SHELL
      
    end
  end

  (1..N_GOLANG).each do |machine_id|
    config.vm.define "golang#{machine_id}", autostart: false do |box|

      box.vm.box = "#{WORKSPACE_VM_BOX_NO_GUI}"
      # box.vm.box = "#{WORKSPACE_VM_BOX_WITH_GUI}"
      # box.vm.box_url = "#{WORKSPACE_VM_BOX_WITH_GUI_URL}"

      # box.vm.network :forwarded_port, guest: 22, host: "21#{WS_IP_SPACE_GOLANG_START+machine_id}"
      # box.ssh.forward_agent = true
      # box.ssh.insert_key = false
      box.vm.boot_timeout = WORKSPACE_VM_BOOT_TIMEOUT
      
      box.vm.host_name = "golang#{machine_id}.vm"
      box.vm.network :private_network, ip: "#{WS_IP_FIRST_24BITS}#{WS_IP_SPACE_GOLANG_START+machine_id}"
      box.vm.synced_folder  "projects", "/projects"

      box.vm.provider "virtualbox" do |vb|
        # TODO: The desktop version of the vm is screwed up. :-( It would be nice to repair for using IntelliJ
        #vb.gui = true
        vb.memory = "4096"
        # vb.memory = "2048"
        vb.customize ["modifyvm", :id, "--vram", "16"]
        vb.cpus = 2
        vb.customize ["modifyvm", :id, "--audio", 'coreaudio']
      end

      box.vm.provision "shell", inline: <<-SHELL
        export DEBIAN_FRONTEND=noninteractive
       #apt-get install -y dos2unix 
        mkdir -p /home/vagrant/tmp_provisioning
        cp /vagrant/scripts/bootstrap.sh /home/vagrant/tmp_provisioning/bootstrap.sh
       #dos2unix -q -n /vagrant/scripts/bootstrap.sh /home/vagrant/tmp_provisioning/bootstrap.sh
        /home/vagrant/tmp_provisioning/bootstrap.sh
        /home/vagrant/tmp_provisioning/git_install.sh
        /home/vagrant/tmp_provisioning/golang.sh
      SHELL

      box.vm.provision "dev_generic", type: "ansible" do |ansible|
         ansible.playbook = "ansible/playbooks/dev_generic/bootstrap.yml"
         #ansible.inventory_path = "ansible/ansible.vmhosts"
         ansible.verbose = true
         ansible.host_key_checking = false
      end
   
    end
  end

  (1..N_DOCKER).each do |machine_id|
    config.vm.define "docker#{machine_id}", autostart: false do |box|

      box.vm.box = "#{WORKSPACE_VM_BOX_NO_GUI}"
      # box.vm.box = "#{WORKSPACE_VM_BOX_WITH_GUI}"
      # box.vm.box_url = "#{WORKSPACE_VM_BOX_WITH_GUI_URL}"

      # box.vm.network :forwarded_port, guest: 22, host: "21#{WS_IP_SPACE_DOCKER_START+machine_id}"
      # box.ssh.forward_agent = true
      # box.ssh.insert_key = false
      box.vm.boot_timeout = WORKSPACE_VM_BOOT_TIMEOUT
      
      box.vm.host_name = "docker#{machine_id}.vm"
      box.vm.network :private_network, ip: "#{WS_IP_FIRST_24BITS}#{WS_IP_SPACE_DOCKER_START+machine_id}"
      box.vm.synced_folder  "projects", "/projects"

      box.vm.provider "virtualbox" do |vb|
        # TODO: The desktop version of the vm is screwed up. :-( It would be nice to repair for using IntelliJ
        #vb.gui = true
        vb.memory = "4096"
        # vb.memory = "2048"
        vb.customize ["modifyvm", :id, "--vram", "16"]
        vb.cpus = 2
        vb.customize ["modifyvm", :id, "--audio", 'coreaudio']
      end

      box.vm.provision "shell", inline: <<-SHELL
        export DEBIAN_FRONTEND=noninteractive
       #apt-get install -y dos2unix 
        mkdir -p /home/vagrant/tmp_provisioning
        cp /vagrant/scripts/bootstrap.sh /home/vagrant/tmp_provisioning/bootstrap.sh
       #dos2unix -q -n /vagrant/scripts/bootstrap.sh /home/vagrant/tmp_provisioning/bootstrap.sh
        /home/vagrant/tmp_provisioning/bootstrap.sh
        /home/vagrant/tmp_provisioning/git_install.sh
        /home/vagrant/tmp_provisioning/docker_install.sh
      SHELL

      box.vm.provision "dev_generic", type: "ansible" do |ansible|
         ansible.playbook = "ansible/playbooks/dev_generic/bootstrap.yml"
         #ansible.inventory_path = "ansible/ansible.vmhosts"
         ansible.verbose = true
         ansible.host_key_checking = false
      end
   
    end
  end

  (1..N_APACHE).each do |machine_id|
    config.vm.define "apache#{machine_id}", autostart: false do |box|

      box.vm.box = "#{WORKSPACE_VM_BOX_NO_GUI}"
      # box.vm.box = "#{WORKSPACE_VM_BOX_WITH_GUI}"
      # box.vm.box_url = "#{WORKSPACE_VM_BOX_WITH_GUI_URL}"

      # box.vm.network :forwarded_port, guest: 22, host: "21#{WS_IP_SPACE_APACHE_START+machine_id}"
      # box.ssh.forward_agent = true
      # box.ssh.insert_key = false
      box.vm.boot_timeout = WORKSPACE_VM_BOOT_TIMEOUT
      
      box.vm.host_name = "apache#{machine_id}.vm"
      box.vm.network :private_network, ip: "#{WS_IP_FIRST_24BITS}#{WS_IP_SPACE_APACHE_START+machine_id}"
      box.vm.synced_folder  "projects", "/projects"

      box.vm.provider "virtualbox" do |vb|
        # TODO: The desktop version of the vm is screwed up. :-( It would be nice to repair for using IntelliJ
        #vb.gui = true
        vb.memory = "4096"
        # vb.memory = "2048"
        vb.customize ["modifyvm", :id, "--vram", "16"]
        vb.cpus = 2
        vb.customize ["modifyvm", :id, "--audio", 'coreaudio']
      end

      box.vm.provision "shell", inline: <<-SHELL
        export DEBIAN_FRONTEND=noninteractive
       #apt-get install -y dos2unix 
        mkdir -p /home/vagrant/tmp_provisioning
        cp /vagrant/scripts/bootstrap.sh /home/vagrant/tmp_provisioning/bootstrap.sh
       #dos2unix -q -n /vagrant/scripts/bootstrap.sh /home/vagrant/tmp_provisioning/bootstrap.sh
        /home/vagrant/tmp_provisioning/bootstrap.sh
        
        # Maybe do it with Ansible instead
        /home/vagrant/tmp_provisioning/apache_install.sh "#{machine_id}"
        /home/vagrant/tmp_provisioning/apache_start.sh
      SHELL

      box.vm.provision "dev_generic", type: "ansible" do |ansible|
         ansible.playbook = "ansible/playbooks/dev_generic/bootstrap.yml"
         #ansible.inventory_path = "ansible/ansible.vmhosts"
         ansible.verbose = true
         ansible.host_key_checking = false
      end
   
    end
  end

  (1..N_GIT).each do |machine_id|
    config.vm.define "git#{machine_id}", autostart: false do |box|

      box.vm.box = "#{WORKSPACE_VM_BOX_NO_GUI}"
      # box.vm.box = "#{WORKSPACE_VM_BOX_WITH_GUI}"
      # box.vm.box_url = "#{WORKSPACE_VM_BOX_WITH_GUI_URL}"

      # box.vm.network :forwarded_port, guest: 22, host: "21#{WS_IP_SPACE_GIT_START+machine_id}"
      # box.ssh.forward_agent = true
      # box.ssh.insert_key = false
      box.vm.boot_timeout = WORKSPACE_VM_BOOT_TIMEOUT
      
      box.vm.host_name = "git#{machine_id}.vm"
      box.vm.network :private_network, ip: "#{WS_IP_FIRST_24BITS}#{WS_IP_SPACE_GIT_START+machine_id}"
      box.vm.synced_folder  "projects", "/projects"

      box.vm.provider "virtualbox" do |vb|
        # TODO: The desktop version of the vm is screwed up. :-( It would be nice to repair for using IntelliJ
        #vb.gui = true
        vb.memory = "4096"
        # vb.memory = "2048"
        vb.customize ["modifyvm", :id, "--vram", "16"]
        vb.cpus = 2
        vb.customize ["modifyvm", :id, "--audio", 'coreaudio']
      end

      box.vm.provision "shell", inline: <<-SHELL
        export DEBIAN_FRONTEND=noninteractive
       #apt-get install -y dos2unix 
        mkdir -p /home/vagrant/tmp_provisioning
        cp /vagrant/scripts/bootstrap.sh /home/vagrant/tmp_provisioning/bootstrap.sh
       #dos2unix -q -n /vagrant/scripts/bootstrap.sh /home/vagrant/tmp_provisioning/bootstrap.sh
        /home/vagrant/tmp_provisioning/bootstrap.sh
        /home/vagrant/tmp_provisioning/git_install.sh
      SHELL

      box.vm.provision "dev_generic", type: "ansible" do |ansible|
         ansible.playbook = "ansible/playbooks/dev_generic/bootstrap.yml"
         #ansible.inventory_path = "ansible/ansible.vmhosts"
         ansible.verbose = true
         ansible.host_key_checking = false
      end
   
    end
  end

  (1..N_JENKINS).each do |machine_id|
    config.vm.define "jenkins#{machine_id}", autostart: false do |box|

      box.vm.box = "#{WORKSPACE_VM_BOX_NO_GUI}"
      # box.vm.box = "#{WORKSPACE_VM_BOX_WITH_GUI}"
      # box.vm.box_url = "#{WORKSPACE_VM_BOX_WITH_GUI_URL}"

      # box.vm.network :forwarded_port, guest: 22, host: "21#{WS_IP_SPACE_JENKINS_START+machine_id}"
      # box.ssh.forward_agent = true
      # box.ssh.insert_key = false
      box.vm.boot_timeout = WORKSPACE_VM_BOOT_TIMEOUT
      
      box.vm.host_name = "jenkins#{machine_id}.vm"
      box.vm.network :private_network, ip: "#{WS_IP_FIRST_24BITS}#{WS_IP_SPACE_JENKINS_START+machine_id}"
      box.vm.synced_folder  "projects", "/projects"

      box.vm.provider "virtualbox" do |vb|
        # TODO: The desktop version of the vm is screwed up. :-( It would be nice to repair for using IntelliJ
        #vb.gui = true
        vb.memory = "4096"
        # vb.memory = "2048"
        vb.customize ["modifyvm", :id, "--vram", "16"]
        vb.cpus = 2
        vb.customize ["modifyvm", :id, "--audio", 'coreaudio']
      end

      box.vm.provision "shell", inline: <<-SHELL
        export DEBIAN_FRONTEND=noninteractive
       #apt-get install -y dos2unix 
        mkdir -p /home/vagrant/tmp_provisioning
        cp /vagrant/scripts/bootstrap.sh /home/vagrant/tmp_provisioning/bootstrap.sh
       #dos2unix -q -n /vagrant/scripts/bootstrap.sh /home/vagrant/tmp_provisioning/bootstrap.sh
        /home/vagrant/tmp_provisioning/bootstrap.sh
        
        # At some point wanted java, might be a pre-req
        #/home/vagrant/tmp_provisioning/jdk_install.sh
        
        /home/vagrant/tmp_provisioning/jenkins_install.sh
        
      SHELL

      box.vm.provision "dev_generic", type: "ansible" do |ansible|
         ansible.playbook = "ansible/playbooks/dev_generic/bootstrap.yml"
         #ansible.inventory_path = "ansible/ansible.vmhosts"
         ansible.verbose = true
         ansible.host_key_checking = false
      end
   
    end
  end

  (1..N_SSH).each do |machine_id|
    config.vm.define "ssh#{machine_id}", autostart: false do |box|

      box.vm.box = "#{WORKSPACE_VM_BOX_NO_GUI}"
      # box.vm.box = "#{WORKSPACE_VM_BOX_WITH_GUI}"
      # box.vm.box_url = "#{WORKSPACE_VM_BOX_WITH_GUI_URL}"

      # box.vm.network :forwarded_port, guest: 22, host: "21#{WS_IP_SPACE_SSH_START+machine_id}"
      # box.ssh.forward_agent = true
      # box.ssh.insert_key = false
      box.vm.boot_timeout = WORKSPACE_VM_BOOT_TIMEOUT
      
      box.vm.host_name = "ssh#{machine_id}.vm"
      box.vm.network :private_network, ip: "#{WS_IP_FIRST_24BITS}#{WS_IP_SPACE_SSH_START+machine_id}"
      box.vm.synced_folder  "projects", "/projects"

      box.vm.provider "virtualbox" do |vb|
        # TODO: The desktop version of the vm is screwed up. :-( It would be nice to repair for using IntelliJ
        #vb.gui = true
        vb.memory = "4096"
        # vb.memory = "2048"
        vb.customize ["modifyvm", :id, "--vram", "16"]
        vb.cpus = 2
        vb.customize ["modifyvm", :id, "--audio", 'coreaudio']
      end

      box.vm.provision "shell", inline: <<-SHELL
        export DEBIAN_FRONTEND=noninteractive
       #apt-get install -y dos2unix 
        mkdir -p /home/vagrant/tmp_provisioning
        cp /vagrant/scripts/bootstrap.sh /home/vagrant/tmp_provisioning/bootstrap.sh
       #dos2unix -q -n /vagrant/scripts/bootstrap.sh /home/vagrant/tmp_provisioning/bootstrap.sh
        /home/vagrant/tmp_provisioning/bootstrap.sh
      SHELL

      box.vm.provision "dev_generic", type: "ansible" do |ansible|
         ansible.playbook = "ansible/playbooks/generic/bootstrap.yml"
         #ansible.inventory_path = "ansible/ansible.vmhosts"
         ansible.verbose = true
         ansible.host_key_checking = false
      end
   
    end
  end

  (1..N_NGINX).each do |machine_id|
    config.vm.define "nginx#{machine_id}", autostart: false do |box|

      box.vm.box = "#{WORKSPACE_VM_BOX_NO_GUI}"
      # box.vm.box = "#{WORKSPACE_VM_BOX_WITH_GUI}"
      # box.vm.box_url = "#{WORKSPACE_VM_BOX_WITH_GUI_URL}"

      # box.vm.network :forwarded_port, guest: 22, host: "21#{WS_IP_SPACE_NGINX_START+machine_id}"
      # box.ssh.forward_agent = true
      # box.ssh.insert_key = false
      box.vm.boot_timeout = WORKSPACE_VM_BOOT_TIMEOUT
      
      box.vm.host_name = "nginx#{machine_id}.vm"
      box.vm.network :private_network, ip: "#{WS_IP_FIRST_24BITS}#{WS_IP_SPACE_NGINX_START+machine_id}"
      box.vm.synced_folder  "projects", "/projects"

      box.vm.provider "virtualbox" do |vb|
        # TODO: The desktop version of the vm is screwed up. :-( It would be nice to repair for using IntelliJ
        #vb.gui = true
        #vb.memory = "4096"
        vb.memory = "2048"
        #vb.customize ["modifyvm", :id, "--vram", "16"]
        vb.cpus = 2
        #vb.customize ["modifyvm", :id, "--audio", 'coreaudio']
      end

      box.vm.provision "shell", inline: <<-SHELL
        export DEBIAN_FRONTEND=noninteractive
       #apt-get install -y dos2unix 
        mkdir -p /home/vagrant/tmp_provisioning
        cp /vagrant/scripts/bootstrap.sh /home/vagrant/tmp_provisioning/bootstrap.sh
       #dos2unix -q -n /vagrant/scripts/bootstrap.sh /home/vagrant/tmp_provisioning/bootstrap.sh
        /home/vagrant/tmp_provisioning/bootstrap.sh
        /home/vagrant/tmp_provisioning/nginx_install.sh
      SHELL

      box.vm.provision "dev_generic", type: "ansible" do |ansible|
         ansible.playbook = "ansible/playbooks/generic/bootstrap.yml"
         #ansible.inventory_path = "ansible/ansible.vmhosts"
         ansible.verbose = true
         ansible.host_key_checking = false
      end

      box.vm.provision "shell", inline: <<-SHELL
         /home/vagrant/tmp_provisioning/nginx_start.sh "#{machine_id}"
      SHELL
    end
  end

  (1..N_WP).each do |machine_id|
    config.vm.define "wp#{machine_id}", autostart: false do |box|

      box.vm.box = "#{WORKSPACE_VM_BOX_NO_GUI}"
      # box.vm.box = "#{WORKSPACE_VM_BOX_WITH_GUI}"
      # box.vm.box_url = "#{WORKSPACE_VM_BOX_WITH_GUI_URL}"

      # box.vm.network :forwarded_port, guest: 22, host: "21#{WS_IP_SPACE_WP_START+machine_id}"
      # box.ssh.forward_agent = true
      # box.ssh.insert_key = false
      box.vm.boot_timeout = WORKSPACE_VM_BOOT_TIMEOUT
      
      box.vm.host_name = "wp#{machine_id}.vm"
      box.vm.network :private_network, ip: "#{WS_IP_FIRST_24BITS}#{WS_IP_SPACE_WP_START+machine_id}"
      box.vm.synced_folder  "projects", "/projects"

      box.vm.provider "virtualbox" do |vb|
        # TODO: The desktop version of the vm is screwed up. :-( It would be nice to repair for using IntelliJ
        #vb.gui = true
        #vb.memory = "4096"
        vb.memory = "2048"
        #vb.customize ["modifyvm", :id, "--vram", "16"]
        vb.cpus = 2
        #vb.customize ["modifyvm", :id, "--audio", 'coreaudio']
      end

      box.vm.provision "shell", inline: <<-SHELL
        export DEBIAN_FRONTEND=noninteractive
       #apt-get install -y dos2unix 
        mkdir -p /home/vagrant/tmp_provisioning
        cp /vagrant/scripts/bootstrap.sh /home/vagrant/tmp_provisioning/bootstrap.sh
       #dos2unix -q -n /vagrant/scripts/bootstrap.sh /home/vagrant/tmp_provisioning/bootstrap.sh
        /home/vagrant/tmp_provisioning/bootstrap.sh
        /home/vagrant/tmp_provisioning/wp_install.sh
      SHELL

      box.vm.provision "dev_generic", type: "ansible" do |ansible|
         ansible.playbook = "ansible/playbooks/generic/bootstrap.yml"
         #ansible.inventory_path = "ansible/ansible.vmhosts"
         ansible.verbose = true
         ansible.host_key_checking = false
      end

      box.vm.provision "shell", inline: <<-SHELL
         /home/vagrant/tmp_provisioning/wp_start.sh "#{machine_id}"
      SHELL
    end
  end

  (1..N_SMTP).each do |machine_id|
    config.vm.define "smtp#{machine_id}", autostart: false do |box|

      box.vm.box = "#{WORKSPACE_VM_BOX_NO_GUI}"
      # box.vm.box = "#{WORKSPACE_VM_BOX_WITH_GUI}"
      # box.vm.box_url = "#{WORKSPACE_VM_BOX_WITH_GUI_URL}"

      # box.vm.network :forwarded_port, guest: 22, host: "21#{WS_IP_SPACE_SMTP_START+machine_id}"
      # box.ssh.forward_agent = true
      # box.ssh.insert_key = false
      box.vm.boot_timeout = WORKSPACE_VM_BOOT_TIMEOUT
      
      box.vm.host_name = "smtp#{machine_id}.vm"
      box.vm.network :private_network, ip: "#{WS_IP_FIRST_24BITS}#{WS_IP_SPACE_SMTP_START+machine_id}"
      box.vm.synced_folder  "projects", "/projects"

      box.vm.provider "virtualbox" do |vb|
        # TODO: The desktop version of the vm is screwed up. :-( It would be nice to repair for using IntelliJ
        #vb.gui = true
        #vb.memory = "4096"
        vb.memory = "2048"
        #vb.customize ["modifyvm", :id, "--vram", "16"]
        vb.cpus = 2
        #vb.customize ["modifyvm", :id, "--audio", 'coreaudio']
      end

      box.vm.provision "shell", inline: <<-SHELL
        export DEBIAN_FRONTEND=noninteractive
       #apt-get install -y dos2unix 
        mkdir -p /home/vagrant/tmp_provisioning
        cp /vagrant/scripts/bootstrap.sh /home/vagrant/tmp_provisioning/bootstrap.sh
       #dos2unix -q -n /vagrant/scripts/bootstrap.sh /home/vagrant/tmp_provisioning/bootstrap.sh
        /home/vagrant/tmp_provisioning/bootstrap.sh
        /home/vagrant/tmp_provisioning/postfix_install.sh
      SHELL

      box.vm.provision "dev_generic", type: "ansible" do |ansible|
         ansible.playbook = "ansible/playbooks/generic/bootstrap.yml"
         #ansible.inventory_path = "ansible/ansible.vmhosts"
         ansible.verbose = true
         ansible.host_key_checking = false
      end

      box.vm.provision "shell", inline: <<-SHELL
         /home/vagrant/tmp_provisioning/postfix_start.sh "#{machine_id}"
      SHELL
    end
  end
  
  (1..N_ELIXIR).each do |machine_id|
    config.vm.define "elixir#{machine_id}", autostart: false do |box|

      box.vm.box = "#{WORKSPACE_VM_BOX_NO_GUI}"
      # box.vm.box = "#{WORKSPACE_VM_BOX_WITH_GUI}"
      # box.vm.box_url = "#{WORKSPACE_VM_BOX_WITH_GUI_URL}"

      # box.vm.network :forwarded_port, guest: 22, host: "21#{WS_IP_SPACE_ELIXIR_START+machine_id}"
      # box.ssh.forward_agent = true
      # box.ssh.insert_key = false
      box.vm.boot_timeout = WORKSPACE_VM_BOOT_TIMEOUT
      
      box.vm.host_name = "elixir#{machine_id}.vm"
      box.vm.network :private_network, ip: "#{WS_IP_FIRST_24BITS}#{WS_IP_SPACE_ELIXIR_START+machine_id}"
      box.vm.synced_folder  "projects", "/projects"

      box.vm.provider "virtualbox" do |vb|
        # TODO: The desktop version of the vm is screwed up. :-( It would be nice to repair for using IntelliJ
        #vb.gui = true
        #vb.memory = "4096"
        vb.memory = "2048"
        #vb.customize ["modifyvm", :id, "--vram", "16"]
        vb.cpus = 2
        #vb.customize ["modifyvm", :id, "--audio", 'coreaudio']
      end

      box.vm.provision "shell", inline: <<-SHELL
        export DEBIAN_FRONTEND=noninteractive
       #apt-get install -y dos2unix 
        mkdir -p /home/vagrant/tmp_provisioning
        cp /vagrant/scripts/bootstrap.sh /home/vagrant/tmp_provisioning/bootstrap.sh
       #dos2unix -q -n /vagrant/scripts/bootstrap.sh /home/vagrant/tmp_provisioning/bootstrap.sh
        /home/vagrant/tmp_provisioning/bootstrap.sh
        /home/vagrant/tmp_provisioning/postfix_install.sh
      SHELL

      box.vm.provision "dev_generic", type: "ansible" do |ansible|
         ansible.playbook = "ansible/playbooks/generic/bootstrap.yml"
         #ansible.inventory_path = "ansible/ansible.vmhosts"
         ansible.verbose = true
         ansible.host_key_checking = false
      end

      box.vm.provision "shell", inline: <<-SHELL
         /home/vagrant/tmp_provisioning/elixir_install.sh "#{machine_id}"
      SHELL
    end
  end

  (1..N_POSTGRES).each do |machine_id|
    config.vm.define "postgres#{machine_id}", autostart: false do |box|

      box.vm.box = "#{WORKSPACE_VM_BOX_NO_GUI}"
      # box.vm.box = "#{WORKSPACE_VM_BOX_WITH_GUI}"
      # box.vm.box_url = "#{WORKSPACE_VM_BOX_WITH_GUI_URL}"

      # box.vm.network :forwarded_port, guest: 22, host: "21#{WS_IP_SPACE_POSTGRES_START+machine_id}"
      # box.ssh.forward_agent = true
      # box.ssh.insert_key = false
      box.vm.boot_timeout = WORKSPACE_VM_BOOT_TIMEOUT
      
      box.vm.host_name = "postgres#{machine_id}.vm"
      box.vm.network :private_network, ip: "#{WS_IP_FIRST_24BITS}#{WS_IP_SPACE_POSTGRES_START+machine_id}"
      box.vm.synced_folder  "projects", "/projects"

      box.vm.provider "virtualbox" do |vb|
        # TODO: The desktop version of the vm is screwed up. :-( It would be nice to repair for using IntelliJ
        #vb.gui = true
        #vb.memory = "4096"
        vb.memory = "2048"
        #vb.customize ["modifyvm", :id, "--vram", "16"]
        vb.cpus = 2
        #vb.customize ["modifyvm", :id, "--audio", 'coreaudio']
      end

      box.vm.provision "shell", inline: <<-SHELL
        export DEBIAN_FRONTEND=noninteractive
       #apt-get install -y dos2unix 
        mkdir -p /home/vagrant/tmp_provisioning
        cp /vagrant/scripts/bootstrap.sh /home/vagrant/tmp_provisioning/bootstrap.sh
       #dos2unix -q -n /vagrant/scripts/bootstrap.sh /home/vagrant/tmp_provisioning/bootstrap.sh
        /home/vagrant/tmp_provisioning/bootstrap.sh
       # /home/vagrant/tmp_provisioning/postfix_install.sh
        /home/vagrant/tmp_provisioning/python_install.sh
      SHELL

      box.vm.provision "dev_generic", type: "ansible" do |ansible|
         ansible.playbook = "ansible/playbooks/generic/bootstrap.yml"
         #ansible.inventory_path = "ansible/ansible.vmhosts"
         ansible.verbose = true
         ansible.host_key_checking = false
      end

      box.vm.provision "shell", inline: <<-SHELL
         /home/vagrant/tmp_provisioning/postgres_install.sh "#{machine_id}"
      SHELL
    end
  end
  
end

