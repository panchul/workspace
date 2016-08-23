#!/usr/bin/env bash

if [ ! -d jdk ]; then
  if [ ! -f /home/vagrant/tmp_provisioning/jdk-8u101-linux-x64.tar.gz ]; then
    if [ ! -f /vagrant/install/jdk-8u101-linux-x64.tar.gz  ]; then
      wget -O /vagrant/install/jdk-8u101-linux-x64.tar.gz http://download.oracle.com/otn-pub/java/jdk/8u101-b13/jdk-8u101-linux-x64.tar.gz
    fi
    cp /vagrant/install/jdk-8u101-linux-x64.tar.gz /home/vagrant/tmp_provisioning/jdk-8u101-linux-x64.tar.gz
  fi

  #sudo alien -i tmp/jdk-8u101-linux-x64.rpm 

  sudo mkdir /usr/local/java
  cd /usr/local/java
  sudo tar xzf /home/vagrant/tmp_provisioning/jdk-8u101-linux-x64.tar.gz

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
fi

