[Home](Readme.md)
# Firewall

See Also:

  - [Linux](Linux.md)
  - [Networking](Networking.md)
  - [OpenSSL](OpenSSL.md)
  - [OpenVPN](OpenVPN.md)
  - [SSH](SSH.md)

---

**Contents**

- [Installing](Firewall.md#installing)
- [Miscellaneous](Firewall.md#miscellaneous)

---

## Installing

How to set up `firewalld` on CentOS 8 
https://www.cyberciti.biz/faq/how-to-set-up-a-firewall-using-firewalld-on-centos-8/

---

For webservers and [Nginx](Nginx.md), you may also want to enable the firewall port,
check the existing config and enable, e.g. like so:

```bash
    $ sudo ufw status

    $ sudo ufw enable
```

or, maybe

```bash
    $ sudo ufw allow 'Nginx Full'
```

Also allow https:

```bash
    $ sudo ufw allow 443
```

---

## Miscellaneous

