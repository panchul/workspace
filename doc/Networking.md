[Home](Readme.md)
# Networking

See Also:

  - [Certbot](Certbot.md)
  - [Email Clients](EmailClients.md)
  - [DHCP](DHCP.md)
  - [DNS](DNS.md)
  - [NetworkSecurity](NetworkSecurity.md)
  - [OAuth](OAuth.md)
  - [Postman](Postman.md)
  - [SDN](SDN.md)
  - [Wireshark](Wireshark.md)
  - [Zero-Knowledge-Proof](ZNP.md)

---

# Content

- [Miscellaneous](Networking.md#miscellaneous)

---

## Miscellaneous

---

For webservers and Nginx, you may also want to enable the firewall port, check the existing config and enable, e.g. like so:

    $ sudo ufw status

    $ sudo ufw enable

or, maybe

    $ sudo ufw allow 'Nginx Full'

Also allow https:

    $ sudo ufw allow 443

---

A simple proxy for local web projects. using `ngrok`
https://dev.to/kitarp/share-your-web-projects-easily-4i60

---

Neat collection of server implementations in C++. Forked and threaded, etc.
http://www.martinbroadhurst.com/tag/servers  

---

Neat collection of the most important networking tools/commands
https://www.tecmint.com/linux-networking-commands/

---

How to find my own public ip via cli
https://www.cyberciti.biz/faq/how-to-find-my-public-ip-address-from-command-line-on-a-linux/

---

SDN overview from VMware:
https://www.vmware.com/topics/glossary/content/software-defined-networking

NSX Data centers

- Open SDN: admins use protocol like OpenFlow to control virtual and physical switches at data panel level
- SDN by APIs: defining interfaces to control the flow
- Overlay Model: virtual on top of existing physical, dynamic tunnels
- Hybrid SDN: combination of sdn and traditional networking.
  
---

Neat refresh of `ip` and `ifconfig`
https://www.tecmint.com/ip-command-examples/
TODO: summarize



---

How to find Public IP address(including on AWS EC2, etc.)

    $ curl icanhazip.com
    $ curl ifconfig.me
    $ curl http://checkip.amazonaws.com
 
    $ dig +short myip.opendns.com @resolver1.opendns.com
    $ dig TXT +short o-o.myaddr.l.google.com @ns1.google.com
    $ dig +short myip.opendns.com @resolver1.opendns.com
    $ dig TXT +short o-o.myaddr.l.google.com @ns1.google.com

Amazon-specific, to get private IPv4:

    $ curl http://169.254.169.254/latest/meta-data/local-ipv4

And, to get public IPv4, run:

    $ curl http://169.254.169.254/latest/meta-data/public-ipv4
    $ curl http://checkip.amazonaws.com
     
---

Installing Squid http proxy
https://www.tecmint.com/install-squid-http-proxy-on-centos-7/

TODO: do the summary

---

Useful commands summary, from
https://www.tecmint.com/linux-network-configuration-and-troubleshooting-commands/

`ifconfig` might be deprecated in favor of `ip`

    $ ifconfig -a
      eth0    Link encap:Ethernet  HWaddr 00:0C:29:28:FD:4C
              inet addr:192.168.50.2  Bcast:192.168.50.255  Mask:255.255.255.0
              inet6 addr: fe80::20c:29ff:fe28:fd4c/64 Scope:Link
              UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
              RX packets:6093 errors:0 dropped:0 overruns:0 frame:0
              TX packets:4824 errors:0 dropped:0 overruns:0 carrier:0
              collisions:0 txqueuelen:1000
              RX bytes:6125302 (5.8 MiB)  TX bytes:536966 (524.3 KiB)
              Interrupt:18 Base address:0x2000
      lo      Link encap:Local Loopback
              inet addr:127.0.0.1  Mask:255.0.0.0
              inet6 addr: ::1/128 Scope:Host
              UP LOOPBACK RUNNING  MTU:16436  Metric:1
              RX packets:8 errors:0 dropped:0 overruns:0 frame:0
              TX packets:8 errors:0 dropped:0 overruns:0 carrier:0
              collisions:0 txqueuelen:0
              RX bytes:480 (480.0 b)  TX bytes:480 (480.0 b)

    $ ifconfig eth0
      eth0    Link encap:Ethernet  HWaddr 00:0C:29:28:FD:4C
              inet addr:192.168.50.2  Bcast:192.168.50.255  Mask:255.255.255.0
              inet6 addr: fe80::20c:29ff:fe28:fd4c/64 Scope:Link
              UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
              RX packets:6119 errors:0 dropped:0 overruns:0 frame:0
              TX packets:4841 errors:0 dropped:0 overruns:0 carrier:0
              collisions:0 txqueuelen:1000
              RX bytes:6127464 (5.8 MiB)  TX bytes:539648 (527.0 KiB)
              Interrupt:18 Base address:0x2000

Assigning an IP Address and Gateway to interface on the fly.
The setting will be removed in case of system reboot.

    $ ifconfig eth0 192.168.50.5 netmask 255.255.255.0

Enable or Disable Specific Interface:

    $ ifup eth0
    $ ifdown eth0
    
By default MTU size is 1500. We can set required MTU size with below command. Replace XXXX with size.

    $ ifconfig eth0 mtu XXXX

Network interface only received packets belongs to that particular NIC.
If you put interface in promiscuous mode it will received all the packets.
This is very useful to capture packets and analyze later. For this you may require superuser access.

    $ ifconfig eth0 - promisc

Ping use `ICMP` (Internet Control Message Protocol) to communicate to other devices. You can
ping host name of ip address. Ping for 5 attempts:

    $ ping -c 5 www.tecmint.com
    PING tecmint.com (50.116.66.136) 56(84) bytes of data.
    64 bytes from 50.116.66.136: icmp_seq=1 ttl=47 time=285 ms
    64 bytes from 50.116.66.136: icmp_seq=2 ttl=47 time=285 ms
    64 bytes from 50.116.66.136: icmp_seq=3 ttl=47 time=285 ms
    64 bytes from 50.116.66.136: icmp_seq=4 ttl=47 time=285 ms
    64 bytes from 50.116.66.136: icmp_seq=5 ttl=47 time=285 ms
    --- tecmint.com ping statistics ---
    5 packets transmitted, 5 received, 0% packet loss, time 4295ms
    rtt min/avg/max/mdev = 285.062/285.324/285.406/0.599 ms

`traceroute` shows hops to the destination.

    $ traceroute 4.2.2.2
   
    traceroute to 4.2.2.2 (4.2.2.2), 30 hops max, 60 byte packets
     1  192.168.50.1 (192.168.50.1)  0.217 ms  0.624 ms  0.133 ms
     2  227.18.106.27.mysipl.com (27.106.18.227)  2.343 ms  1.910 ms  1.799 ms
     3  221-231-119-111.mysipl.com (111.119.231.221)  4.334 ms  4.001 ms  5.619 ms
     4  10.0.0.5 (10.0.0.5)  5.386 ms  6.490 ms  6.224 ms
     5  gi0-0-0.dgw1.bom2.pacific.net.in (203.123.129.25)  7.798 ms  7.614 ms  7.378 ms
     6  115.113.165.49.static-mumbai.vsnl.net.in (115.113.165.49)  10.852 ms  5.389 ms  4.322 ms
     7  ix-0-100.tcore1.MLV-Mumbai.as6453.net (180.87.38.5)  5.836 ms  5.590 ms  5.503 ms
     8  if-9-5.tcore1.WYN-Marseille.as6453.net (80.231.217.17)  216.909 ms  198.864 ms  201.737 ms
     9  if-2-2.tcore2.WYN-Marseille.as6453.net (80.231.217.2)  203.305 ms  203.141 ms  202.888 ms
    10  if-5-2.tcore1.WV6-Madrid.as6453.net (80.231.200.6)  200.552 ms  202.463 ms  202.222 ms
    11  if-8-2.tcore2.SV8-Highbridge.as6453.net (80.231.91.26)  205.446 ms  215.885 ms  202.867 ms
    12  if-2-2.tcore1.SV8-Highbridge.as6453.net (80.231.139.2)  202.675 ms  201.540 ms  203.972 ms
    13  if-6-2.tcore1.NJY-Newark.as6453.net (80.231.138.18)  203.732 ms  203.496 ms  202.951 ms
    14  if-2-2.tcore2.NJY-Newark.as6453.net (66.198.70.2)  203.858 ms  203.373 ms  203.208 ms
    15  66.198.111.26 (66.198.111.26)  201.093 ms 63.243.128.25 (63.243.128.25)  206.597 ms 66.198.111.26 (66.198.111.26)  204.178 ms
    16  ae9.edge1.NewYork.Level3.net (4.68.62.185)  205.960 ms  205.740 ms  205.487 ms
    17  vlan51.ebr1.NewYork2.Level3.net (4.69.138.222)  203.867 ms vlan52.ebr2.NewYork2.Level3.net (4.69.138.254)  202.850 ms vlan51.ebr1.NewYork2.Level3.net (4.69.138.222)  202.351 ms
    18  ae-6-6.ebr2.NewYork1.Level3.net (4.69.141.21)  201.771 ms  201.185 ms  201.120 ms
    19  ae-81-81.csw3.NewYork1.Level3.net (4.69.134.74)  202.407 ms  201.479 ms ae-92-92.csw4.NewYork1.Level3.net (4.69.148.46)  208.145 ms
    20  ae-2-70.edge2.NewYork1.Level3.net (4.69.155.80)  200.572 ms ae-4-90.edge2.NewYork1.Level3.net (4.69.155.208)  200.402 ms ae-1-60.edge2.NewYork1.Level3.net (4.69.155.16)  203.573 ms
    21  b.resolvers.Level3.net (4.2.2.2)  199.725 ms  199.190 ms 

netstat (Network Statistics)

    $ netstat -r
    
    Kernel IP routing table
    Destination     Gateway         Genmask         Flags   MSS Window  irtt Iface
    192.168.50.0    *               255.255.255.0   U         0 0          0 eth0
    link-local      *               255.255.0.0     U         0 0          0 eth0
    default         192.168.50.1    0.0.0.0         UG        0 0          0 eth0
    
   
`dig` (domain information groper) query DNS related information like A Record, CNAME, MX Record etc.
This command mainly use to troubleshoot DNS related query.
More on it here: https://www.tecmint.com/10-linux-dig-domain-information-groper-commands-to-query-dns/
    
    $ dig www.tecmint.com; <<>> DiG 9.8.2rc1-RedHat-9.8.2-0.10.rc1.el6 <<>> www.tecmint.com
    ;; global options: +cmd
    ;; Got answer:
    ;; ->>HEADER<

`nslookup` command also use to find out DNS related query.
    
    $ nslookup www.tecmint.com
    Server:         4.2.2.2
    Address:        4.2.2.2#53
    
    Non-authoritative answer:
    www.tecmint.com canonical name = tecmint.com.
    Name:   tecmint.com
    Address: 50.116.66.136
    

`route` command also shows and manipulate ip routing table.
    
    $ route
    Kernel IP routing table
    Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
    192.168.50.0    *               255.255.255.0   U     0      0        0 eth0
    link-local      *               255.255.0.0     U     1002   0        0 eth0
    default         192.168.50.1    0.0.0.0         UG    0      0        0 eth0
          
Route Adding

    $ route add -net 10.10.10.0/24 gw 192.168.0.1
    
Route Deleting
    
    $ route del -net 10.10.10.0/24 gw 192.168.0.1
    
Adding default Gateway

    $ route add default gw 192.168.0.1
    
    
`host` command to find name to IP or IP to name in IPv4 or IPv6 and also query DNS records.
    
    $ host www.google.com
    www.google.com has address 173.194.38.180
    www.google.com has address 173.194.38.176
    www.google.com has address 173.194.38.177
    www.google.com has address 173.194.38.178
    www.google.com has address 173.194.38.179
    www.google.com has IPv6 address 2404:6800:4003:802::1014

Using `-t` option we can find out DNS Resource Records like CNAME, NS, MX, SOA etc.
    
    $ host -t CNAME www.redhat.com
    www.redhat.com is an alias for wildcard.redhat.com.edgekey.net.    
   

`ARP` (Address Resolution Protocol) is useful to view / add the contents of the kernel’s ARP tables.
    
    $ arp -e
    Address                  HWtype  HWaddress           Flags Mask            Iface
    192.168.50.1             ether   00:50:56:c0:00:08   C                     eth0

`ethtool` is a replacement of mii-tool. It is to view, setting speed and duplex of your
 Network Interface Card (NIC). You can set duplex permanently in
 `/etc/sysconfig/network-scripts/ifcfg-eth0` with `ETHTOOL_OPTS` variable.
    
    $ ethtool eth0
    Settings for eth0:
            Current message level: 0x00000007 (7)
            Link detected: yes
   
`iwconfig` command in Linux is use to configure a wireless network interface.
     
    $ iwconfig [interface]

`hostname` is to identify in a network.
You can set hostname permanently in `/etc/sysconfig/network`.
    
    $ hostname 
    tecmint.com
    
Type `system-config-network` in command prompt to configure network setting with GUI.
    
    $ system-config-network
                            
---

from https://www.tecmint.com/manage-networking-with-networkmanager-in-rhel-centos/

About Network Manager, etc.

    $ nmcli connection show -a
    NAME                UUID                                  TYPE      DEVICE 
    Wired connection 1  faasdgf-asdf-2345-as-asdasgasg        ethernet  enp0s3 

    $ nmcli device status
    DEVICE  TYPE      STATE      CONNECTION         
    enp0s3  ethernet  connected  Wired connection 1 
    lo      loopback  unmanaged  -- 
   
On RHEL, CentOS:

    $ vi /etc/sysconfig/network-scripts/ifcfg-enp0s3
    TYPE=Ethernet
    PROXY_METHOD=none
    BROWSER_ONLY=no
    BOOTPROTO=none
    DEFROUTE=yes
    IPV4_FAILURE_FATAL=no
    IPV6INIT=yes
    IPV6_AUTOCONF=yes
    IPV6_DEFROUTE=yes
    IPV6_FAILURE_FATAL=no
    IPV6_ADDR_GEN_MODE=stable-privacy
    NAME=enp0s3
    UUID=e81c46b7-441a-4a63-b695-75d8fe633511
    DEVICE=enp0s3
    ONBOOT=yes
    IPADDR=192.168.0.110
    PREFIX=24
    GATEWAY=192.168.0.1
    DNS1=8.8.8.8
    PEERDNS=no
         
---
    
Summary for OAuth and OIDC    
https://developer.okta.com/blog/2019/10/21/illustrated-guide-to-oauth-and-oidc

TODO: write a summary    
    
    
    
    
---    

Port forwarding

    $ ssh -L{port on your PC}:localhost:{database's port} root@{server IP}

The command will open port 3308 on your laptop and everything
will be forwarded to 192.168.1.2:3306

    $ ssh -L3308:localhost:3306 root@192.168.1.2

`localhost` means that database is listening on 192.168.1.2.
You can type, for example, 192.168.3.77 and everything will be
forwarded to .3.77 server via .1.2.

Another similar example. Run this on your desktop:

    $ ssh -NfL 6006:localhost:6006 -i id_rsa_my user@123.45.67.89

Then you can access locally(as localhost) the port that is served at 123.45.67.89
even if that is a cluster_port of a pod in Kubernetes cluster.    

---

To see who is using a port(and there is also utility `ss`):

    $ netstat -tulpn | grep 80
    tcp6       0      0 :::80                 :::*                   LISTEN     10177/java

`-l` - prints listening sockets
`-n` - shows port number
`-t` - enables listing of tcp ports
`-u` - enables listing udp ports.

10177 is a pid you are looking for. Now execute

    $ ps aux | grep 10177

---
