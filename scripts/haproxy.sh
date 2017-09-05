#!/usr/bin/env bash

# TODO: maybe fetch and compile from the sources
sudo apt-get -y install haproxy

sudo sh -c "cat >> /etc/haproxy/haproxy.cfg " << EOF

frontend http-in
        bind *:80
        default_backend servers

backend servers
        server apache1.vm 192.168.10.73:80 maxconn 32
        server apache2.vm 192.168.10.74:80 maxconn 32
        server apache3.vm 192.168.10.75:80 maxconn 32

EOF


# change in /etc/default/haproxy to start it at boot:
# ...
# ENABLED=1
# ...
sudo mv /etc/default/haproxy /etc/default/haproxy.orig
sed "s|ENABLED=0|ENABLED=1|g" /etc/default/haproxy.orig > /etc/default/haproxy

# This one is for haproxy logs to show up
sudo service rsyslog restart

# start haproxy
sudo service haproxy start
