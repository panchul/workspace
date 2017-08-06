#!/usr/bin/env bash

# TODO: normalize the filename everywhere

if [ ! -d /usr/java/jdk1.8.0_101 ]; then
  if [ ! -f /home/vagrant/tmp_provisioning/jdk-8u101-linux-x64.tar.gz ]; then
    if [ ! -f /vagrant/install/jdk-8u101-linux-x64.tar.gz  ]; then
    
      echo "NOTE: To continue, you need to download jdk-8 from internet, create file /vagrant/install/jdk-8u101-linux-x64.tar.gz"
      exit -1
      
      ## This thing requires clicking 'Accept' on the page. Look it up later how to automate it
      ##
      ## wget -O /vagrant/install/jdk-8u101-linux-x64.tar.gz http://download.oracle.com/otn-pub/java/jdk/8u101-b13/jdk-8u101-linux-x64.tar.gz
      
      ## The following worked in the past, don't have time to check it:
      ##
      ##wget  --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie"  http://download.oracle.com/otn-pub/java/jdk/8u144-b01/090f390dda5b47b9b721c7dfaa008135/jdk-8u144-linux-x64.tar.gz

    else
      echo "[INFO] Skipping downloading /vagrant/install/jdk-8u101-linux-x64.tar.gz"
    fi
    cp /vagrant/install/jdk-8u101-linux-x64.tar.gz /home/vagrant/tmp_provisioning/jdk-8u101-linux-x64.tar.gz
  fi

  #sudo alien -i tmp/jdk-8u101-linux-x64.rpm 

  sudo mkdir -p /usr/local/java
  sudo tar xzf /home/vagrant/tmp_provisioning/jdk-8u101-linux-x64.tar.gz -C /usr/local/java 

# pretty much from here: https://www3.ntu.edu.sg/home/ehchua/programming/howto/Ubuntu_HowTo.html#jdk

# Setup the location of java, javac and javaws
  sudo update-alternatives --install "/usr/bin/java" "java" "/usr/local/java/jdk1.8.0_101/jre/bin/java" 1
      # --install symlink name path priority
  sudo update-alternatives --install "/usr/bin/javac" "javac" "/usr/local/java/jdk1.8.0_101/bin/javac" 1
  sudo update-alternatives --install "/usr/bin/javaws" "javaws" "/usr/local/java/jdk1.8.0_101/jre/bin/javaws" 1
 
# Use this Oracle JDK/JRE as the default
  sudo update-alternatives --set java /usr/local/java/jdk1.8.0_101/jre/bin/java
      #  --set name path
  sudo update-alternatives --set javac /usr/local/java/jdk1.8.0_101/bin/javac
  sudo update-alternatives --set javaws /usr/local/java/jdk1.8.0_101/jre/bin/javaws

  echo "JAVA_HOME=/usr/java/jdk1.8.0_101" >> /home/vagrant/.bashrc
  echo "PATH=\$PATH:\$JAVA_HOME/bin" >> /home/vagrant/.bashrc
  
  echo "[INFO] Installed jdk: /usr/java/jdk1.8.0_101"
else
  echo "[INFO] Skipping installing jdk - it seems to exist already: /usr/java/jdk1.8.0_101"
fi
