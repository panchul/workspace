#

# do all the provisioning in a dedicated place we can remove to save space
mkdir -p tmp 

# Occationally \r slips in, let's be ready.
dos2unix -n /vagrant/scripts/init.sh tmp/init.sh 
dos2unix -n /vagrant/scripts/git.sh tmp/git.sh 
dos2unix -n /vagrant/scripts/jdk.sh tmp/jdk.sh 
dos2unix -n /vagrant/scripts/intellij.sh tmp/intellij.sh 
dos2unix -n /vagrant/scripts/scala.sh tmp/scala.sh 
chmod +x tmp/*.sh 


# These are optional, but for now let's throw them all into the defult set
tmp/git.sh 
tmp/jdk.sh 
tmp/scala.sh 
tmp/intellij.sh 


tmp/init.sh 
