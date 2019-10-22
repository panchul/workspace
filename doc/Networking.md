
# Networking

See Also:

  - [Wireshark](Wireshark.md)
  - [Postman](Postman.md)

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
