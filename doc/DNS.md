[Home](Readme.md)
# DNS

See Also:

- [Networking](Networking.md)

---

**Contents**

- [Miscellaneous](DNS.md#miscellaneous)

---

## Miscellaneous

---

THe dns servers are in `/etc/resolv.conf`, something like

    search somedomain.internal subdomain.somedomain.com somedomain.com
    nameserver 10.11.234.21

Some information is also in `${HOME}/.digrc`

---

dig - DNS lookup utility

    $ dig panchul.us
     
---

Setting up DNS DHCP server using dnsmasq on CentOS/Rhel
https://www.tecmint.com/setup-a-dns-dhcp-server-using-dnsmasq-on-centos-rhel

TODO: do a walk-through.

---