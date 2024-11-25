[Home](Readme.md)
# hostname

See Also
- [Linux](Linux.md)

`hostname` - show or set the system's host name
`domainname` - show or set the system's NIS/YP domain name
`ypdomainname` - show or set the system's NIS/YP domain name
`nisdomainname` - show or set the system's NIS/YP domain name
`dnsdomainname` - show the system's DNS domain name

---

To see your host with the domain name, use Fully Qualified Domain Name option:

```bash
    $ hostname
    myhost
    
    $ hostname --fqdn
    myhost.com

    $ hostname -A
    myhost myhost.com
```

---
