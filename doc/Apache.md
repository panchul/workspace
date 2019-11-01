
# Apache

See also
 [Linux.md](Linux.md)

https://httpd.apache.org/

---

Basics of starting/stopping, getting status, etc. For different distros
https://www.cyberciti.biz/faq/how-do-i-stop-apache-from-starting-on-linux/
TODO: summarize

---

Different ways to restart the server(depends on versions):

    $ sudo apache2ctl restart

    $ sudo systemctl restart apcche2.service
    
    $ sudo /etc/init.d/apache2 restart

    $ sudo service apache2 restart
    (or, maybe) 
    $ sudo service apache2 reload
        
    $ sudo restart apache2
    (or, maybe)
    $ sudo reload apache2
        
---
