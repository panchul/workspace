[Home](Readme.md)
# Certbot

Letsencrypt.org stuff.

See Also:

  - [Certbot](Certbot.md)
  - [DHCP](DHCP.md)
  - [DNS](DNS.md)
  - [NetworkSecurity](NetworkSecurity.md)
  - [OAuth](OAuth.md)
  - [Postman](Postman.md)
  - [SDN](SDN.md)
  - [Wireshark](Wireshark.md)
  - [Zero-Knowledge-Proof](ZNP.md)

---

**Contents**

- [Miscellaneous](Certbot.md#miscellaneous)

---

## Miscellaneous

---

To run certbot on [Ubuntu](Ubuntu.md) to use with [Nginx](Nginx.md):

    $ sudo certbot --nginx -d nameofapp

---

To check status:

    $ sudo systemctl status certbot.timer

---

Dry run for renewal, simulating:

    $ sudo certbot renew --dry-run

---