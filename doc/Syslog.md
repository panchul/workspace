# Syslog

---

**Contents**

- [Miscellaneous](Syslog.md#miscellaneous)

---

## Miscellaneous

To write to syslog, `/var/log/syslog`:

```
    #include <syslog.h>
    int main(int argc, char *argv[])
    {
        openlog("mytestlog", LOG_PERROR, LOG_USER);
        syslog(LOG_INFO, "something %d", 123);
       	closelog();
    }
```

---
