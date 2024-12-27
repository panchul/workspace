[Home](Readme.md)
# Certbot

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

[Letsencrypt.org](http://letsencrypt.org) stuff.

A nonprofit Certificate Authority providing TLS certificates to 500 million websites.

---

**Contents**

- [Miscellaneous](Certbot.md#miscellaneous)

---

## Miscellaneous

---

To run certbot on [Ubuntu](Ubuntu.md) to use with [Nginx](Nginx.md):

```bash
    $ sudo certbot --nginx -d nameofapp
```

---

To check status:

```bash
    $ sudo systemctl status certbot.timer
```

---

Dry run for renewal, simulating:

```bash
    $ sudo certbot renew --dry-run
```

---
