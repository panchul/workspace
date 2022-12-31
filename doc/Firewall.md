# Firewall

See Also:

  - [Linux](Linux.md)
  - [Networking](Networking.md)
  - [OpenSSL](OpenSSL.md)
  - [OpenVPN](OpenVPN.md)
  - [SSH](SSH.md)

---

How to set up `firewalld` on CentOS 8 
https://www.cyberciti.biz/faq/how-to-set-up-a-firewall-using-firewalld-on-centos-8/

---

For webservers and [Nginx](Nginx.md), you may also want to enable the firewall port,
check the existing config and enable, e.g. like so:

    $ sudo ufw status

    $ sudo ufw enable

or, maybe

    $ sudo ufw allow 'Nginx Full'

Also allow https:

    $ sudo ufw allow 443

---