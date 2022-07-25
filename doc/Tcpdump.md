# tcpdump

Might be deprecated now, `ip` utility is doing a lot now.

---

To see all incoming traffic for a port, e.g. 9092:

    $ sudo tcpdump -n "dst port 9092" 
    18:31:36.424249 IP 10.12.0.20.58428 > 10.12.0.20.XmlIpcRegSvc: Flags [.], ack 3152, win 32044, options [nop,nop,TS val 1356843721 ecr 219691798], length 0
    18:31:36.424292 IP 10.12.0.24.4584 > 10.12.0.20.XmlIpcRegSvc: Flags [.], ack 6097, win 32044, options [nop,nop,TS val 1348381755 ecr 219691798], length 0
    18:31:36.424457 IP 10.12.0.27.55408 > 10.12.0.20.XmlIpcRegSvc: Flags [.], ack 6193, win 32044, options [nop,nop,TS val 1353693678 ecr 219691798], length 0
    ...

---
