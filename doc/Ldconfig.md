[Home](Readme.md)
# ldconfig

See also:

- [OpenCV](OpenCV.md)

---

**Contents**

- [Miscellaneous](Ldconfig.md#miscellaneous)

---

## Miscellaneous

---

For the OpenCV I need to do:

```bash
    $ export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/local/lib/pkgconfig/
    $ echo '/usr/local/lib/' >> /etc/ld.so.conf.d/opencv.conf
    $ ldconfig
```

---