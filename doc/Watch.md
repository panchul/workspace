# watch (Linux utility)

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

To watch, for example, Cuda status:

    $ watch -n0.1 "nvidia-settings -q GPUUtilization -q useddedicatedgpumemory"

---
