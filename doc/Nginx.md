# nginx

https://nginx.org/en/

See also:

  - [Apache](Apache.md)
  - [Certbot](Certbot.md)
  - [Envoy](Envoy.md)
  - [HAProxy](HAProxy.md)
  - [Linux](Linux.md)

---

Installing nginx with virtual hosts and ssl certificate (on Ubuntu and CentOX)
https://www.tecmint.com/install-nginx-with-virtual-hosts-and-ssl-certificate/

---

Redirecting HTTP traffic to HTTPS
https://www.cyberciti.biz/faq/linux-unix-nginx-redirect-all-http-to-https/
 
---

Nginx SSL termination
https://www.nginx.com/resources/admin-guide/nginx-ssl-termination/

---

Seting up NGINX on CentOS:
https://www.cyberciti.biz/faq/how-to-install-and-use-nginx-on-centos-8/

---

To see where the config files are:

    $ sudo nginx -t
    nginx: the configuration file /etc/nginx/nginx.conf syntax is ok
    nginx: configuration file /etc/nginx/nginx.conf test is successful

---

You may also want to enable the firewall port, check the existing config and enable, e.g. like so:

    $ sudo ufw status

    $ sudo ufw enable

or, maybe

    $ sudo ufw allow 'Nginx Full'

Also allow https:

    $ sudo ufw allow 443

---
