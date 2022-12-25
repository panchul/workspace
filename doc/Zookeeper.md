# Zookeeper

https://zookeeper.apache.org/](https://zookeeper.apache.org/)

My own fork: [https://github.com/panchul/zookeeper](https://github.com/panchul/zookeeper)

See Also:

 - [Redis](Redis.md)
 - memcache

At some point this was useful:
[http://zookeeper.apache.org/doc/r3.1.1/zookeeperAdmin.html#sc_zkMulitServerSetup](http://zookeeper.apache.org/doc/r3.1.1/zookeeperAdmin.html#sc_zkMulitServerSetup)

---

About ports, with the default configuration Zookeeper ports are:

- 2888 - peer ports
- 3888 - leader port
- 2181 - client port

For Kafka: 9092 - clients and brokers

---

Simple command line assessment of Zookeeper cluster.

    $ for i in 56 57; do \
      mynode=192.168.10.$i  \
      echo "$mynode is a "$(echo status | nc $mynode 2181 | grep ^Mode | awk '{print $2}') \
     done
     
    192.168.10.56 is a follower
    192.168.10.57 is a leader

Or longer version(I wrapped it up, the output is one long line per node):

    $ for i in 56 57; do mynode=192.168.10.$i ; echo "$mynode: "$(echo status | nc $mynode 2181 ); done
    192.168.10.56 is a Zookeeper version: 3.4.10-39d3a4f269333c922ed3db283be479f9deacaa0f,
     built on 03/23/2017 10:13 GMT Clients: /192.168.10.61:37074[1](queued=0,recved=193,sent=198)
     /192.168.10.62:46019[1](queued=0,recved=108,sent=108) /192.168.10.4:53112[0](queued=0,recved=1,sent=0)
     Latency min/avg/max: 0/0/3 Received: 305 Sent: 309 Connections: 3 Outstanding: 0 Zxid: 0x400000017
     Mode: follower Node count: 42
    192.168.10.57 is a Zookeeper version: 3.4.10-39d3a4f269333c922ed3db283be479f9deacaa0f,
     built on 03/23/2017 10:13 GMT Clients: /192.168.10.4:37074[0](queued=0,recved=1,sent=0)
     Latency min/avg/max: 0/0/0 Received: 6 Sent: 5 Connections: 1 Outstanding: 0 Zxid: 0x400000017
     Mode: leader Node count: 42

---

Getting Zookeeper status:

    $ echo ruok | nc localhost 2181
    imok

Or, more informative:

    $ echo stat | nc localhost 2181
    Zookeeper version: 3.4.10-39d3a4f269333c922ed3db283be479f9deacaa0f, built on 03/23/2017 10:13 GMT
    Clients:
     /127.0.0.1:35558[0](queued=0,recved=1,sent=0)
    
    Latency min/avg/max: 0/0/0
    Received: 2
    Sent: 1
    Connections: 1
    Outstanding: 0
    Zxid: 0xc9
    Mode: standalone
    Node count: 146

---
