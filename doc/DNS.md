## UNDER CONSTRUCTION

# DNS

---

THe dns servers are in `/etc/resolv.conf`, something like

    search somedomain.internal subdomain.somedomain.com somedomain.com
    nameserver 10.11.234.21

Some information is also in `${HOME}/.digrc`

---

dig - DNS lookup utility

    $ dig panchul.us
     
---
