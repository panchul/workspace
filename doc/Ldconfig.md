
## UNDER CONSTRUCTION

# ldconfig

---

For the OpenCV I need to do:

    $ export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/local/lib/pkgconfig/
    $ echo '/usr/local/lib/' >> /etc/ld.so.conf.d/opencv.conf
    $ ldconfig
    
---