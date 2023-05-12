# watch (Linux utility)

Repeatedly runs a command.

See Also:

  - [Linux](Linux.md)
  - [Cron](Cron.md)
  - [Curl](Curl.md)
  - [Ipvsadm](Ipvsadm.md)
  - [tcpdump](Tcpdump.md)
  - [nohup](Nohup.md)
  - [syslog](Syslog.md)
  - [Postman](Postman.md)
  - [Wireshark](Wireshark.md)

---

**Contents**

- [Miscellaneous](Watch.md#miscellaneous)

---

## Miscellaneous

To watch, for example, Cuda status:

    $ watch -n0.1 "nvidia-settings -q GPUUtilization -q useddedicatedgpumemory"

---
