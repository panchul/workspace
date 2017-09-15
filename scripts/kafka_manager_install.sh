#!/bin/bash

sudo ~/tmp_provisioning/jdk_install.sh
cd
git clone git://github.com/panchul/kafka-manager.git
cd kafka-manager
sudo ./sbt run

