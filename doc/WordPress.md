# WordPress

[http://www.wordpress.com](http://www.wordpress.com)

See Also:
  - [PHP](Php.md)

https://wp-cli.org/ - CLI

---

Installing WordPress with nginx in ubuntu 20.04
https://www.tecmint.com/install-wordpress-with-nginx-in-ubuntu-20-04/

---

Neat multi-site setup:
https://hostpresto.com/community/tutorials/how-to-deploy-multiple-wordpress-sites-on-a-single-ubuntu-16-04-host/

---

Some basic tutorials:
https://www.youtube.com/watch?v=wiaT4bR3xGA

---

Compatibility with Php 7.4
https://make.wordpress.org/core/2019/10/11/wordpress-and-php-7-4/

---

A few ways to reset password:
https://wordpress.org/support/article/resetting-your-password/

Create a file called wp.txt, containing nothing but the new password.
On Linux:
    
Important !!! use the simple quotes '', not the back quotes:
    
    $ tr -d ‘\r\n’ < wp.txt | md5sum | tr -d ‘ -‘
    $ rm wp.txt
    
Or, on Mac OS X:

    $ md5 -q ./wp.txt; rm ./wp.txt (If you want the MD5 hash printed out.)
    $ md5 -q ./wp.txt | pbcopy; rm ./wp.txt (If you want the MD5 hash copied to the clipboard.)
    
    $ mysql -u root -p
    enter your mysql password
    
    > use (name-of-database)
    > show tables;
    > SELECT ID, user_login, user_pass FROM (name-of-table-you-found);
    > UPDATE (name-of-table-you-found) SET user_pass=”(MD5-string-you-made)” WHERE ID = (id#-of-account-you-are-reseting-password-for);
    > SELECT ID, user_login, user_pass FROM (name-of-table-you-found);
    (type Control-D to exit mysql client)
    
---
