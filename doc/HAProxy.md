
# HAProxy
See Also:
 - [Linux](Linux.md)
 - [HAProxy](HAProxy.md)

Free open-source TCP/HTTP load balancer.
http://www.haproxy.org/


To have the HAProxy playground, run this from the workspace directory:
In one terminal:

    $ make haproxy_up
    ...
    $ vagrant ssh haproxy1
    $ tail -f /var/log/haproxy.log

In another terminal(a client):

    $ vagrant up gen1
    $ vagrant ssh gen1
    $ while true; do curl haproxy1.vm ; sleep 1; done
    ...

Or, better yet this:
    
    $ while true; do curl -s haproxy1.vm | grep server ; sleep 1; done
    ...
    This is web server number "3" 
    This is web server number "1" 
    This is web server number "2" 
    This is web server number "3" 
    ... 

You will see in the first window something like this (content of /var/log/haproxy.log):

    ...
    Sep  5 00:22:29 haproxy1 haproxy[2795]: 192.168.10.3:56728 [05/Sep/2017:00:22:29.260] http-in servers/apache3.vm 0/0/0/1/2 200 644 - - ---- 0/0/0/0/0 0/0 "GET / HTTP/1.1"
    Sep  5 00:22:30 haproxy1 haproxy[2795]: 192.168.10.3:56729 [05/Sep/2017:00:22:30.275] http-in servers/apache1.vm 0/0/0/0/1 200 644 - - ---- 0/0/0/0/0 0/0 "GET / HTTP/1.1"
    Sep  5 00:22:31 haproxy1 haproxy[2795]: 192.168.10.3:56730 [05/Sep/2017:00:22:31.289] http-in servers/apache2.vm 0/0/0/1/1 200 644 - - ---- 0/0/0/0/0 0/0 "GET / HTTP/1.1"
    Sep  5 00:22:32 haproxy1 haproxy[2795]: 192.168.10.3:56731 [05/Sep/2017:00:22:32.303] http-in servers/apache3.vm 0/0/0/1/2 200 644 - - ---- 0/0/0/0/0 0/0 "GET / HTTP/1.1"
    Sep  5 00:22:33 haproxy1 haproxy[2795]: 192.168.10.3:56732 [05/Sep/2017:00:22:33.318] http-in servers/apache1.vm 0/0/0/0/1 200 644 - - ---- 0/0/0/0/0 0/0 "GET / HTTP/1.1"
    ...

At the moment of writing these notes, /etc/haproxy/haproxy.cfg, besides the default global setup has:
 
    frontend http-in
            bind *:80
            default_backend servers
    
    backend servers
            server apache1.vm 192.168.10.73:80 maxconn 32
            server apache2.vm 192.168.10.74:80 maxconn 32
            server apache3.vm 192.168.10.75:80 maxconn 32

And file /etc/default/haproxy has this to start HAProxy service at boot:

    ...
    ENABLED=1
    ...

---

Decent doc on configuring:
http://www.techrepublic.com/article/how-to-install-and-setup-haproxy-on-ubuntu-16-04/

To test a config file:

    $ sudo haproxy -f myhaproxy.cfg  -c

---

This was helpful for logging:
https://serverfault.com/questions/645924/haproxy-logging-to-syslog

---


