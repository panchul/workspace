
## Under Construction

# Kafka
See Also:
 [Zookeeper](Zookeeper.md)

---

[http://kafka.apache.org/](http://kafka.apache.org/) - Official Link

The overview is at https://kafka.apache.org/documentation/

List of clients for many languages:
https://cwiki.apache.org/confluence/display/KAFKA/Clients

---

Commonly assigned ports:

- Zookeeper: 2181 (client-facing)
- Kafka: 9092, (9091, 9093 for SSL, SASL, etc.)
-        2888, 3888 - internal Kafka, leader selection, etc.

---

Nice overview
http://cloudurable.com/blog/kafka-architecture/index.html

---

one of the C/C++ clients:
https://github.com/edenhill/librdkafka

and a wrapper:
https://github.com/mfontanini/cppkafka

---

https://github.com/confluentinc/examples - Kafka examples

---

https://github.com/Eneco/kafka-connect-ftp - Kafka ftp connect

---

https://www.youtube.com/watch?v=QkDYkB6Q16Q - More Kafka Streams demos.

---

[https://github.com/sclasen/akka-kafka](https://github.com/sclasen/akka-kafka) - Kafka using back pressure mechanisms example

---

[https://github.com/akka/reactive-kafka](https://github.com/akka/reactive-kafka) - Kafka Reactive Streams

---

https://github.com/wurstmeister/kafka-docker - Dockerizing Kafka

And with Vagrant using Sbt:
https://allthingshadoop.com/2013/12/07/using-vagrant-to-get-up-and-running-with-apache-kafka/


---

[https://github.com/elodina/scala-kafka](https://github.com/elodina/scala-kafka) - Another nice repo, similar to my approach.

---

[https://github.com/Interrupt/akka-camel-kafka-example](https://github.com/Interrupt/akka-camel-kafka-example) - Camel demo

---

[https://github.com/Interrupt/scala-play-kafka-example](https://github.com/Interrupt/scala-play-kafka-example) - Nice Play framework example


---

[Deep dive on Kafka from Confluent](https://vimeo.com/185844593/77f7d239a3)

[Slides from the deep dive on Kafka](http://www.slideshare.net/ConfluentInc/deep-dive-into-apache-kafka-66821186)

[Slides from Introduction To Streaming Data and Stream Processing with Apache Kafka](https://www.slideshare.net/ConfluentInc/introduction-to-streaming-data-and-stream-processing-with-apache-kafka)

---

Misc about Kafka Streams:

https://kafka.apache.org/0110/documentation/streams/developer-guide#streams_dsl_joins

---

Nice long overview about operationalizing Kafka:
https://www.youtube.com/watch?v=GRPLRONVDWY

---

Another nice presentation:
https://www.youtube.com/watch?v=l8V6PkVV1Ec

---

Mesos is known to be a great orchestration tool for Kafka (and whole bunch of other things too)


---

Demo code for Apache Kafka and Koober sample:
https://www.github.com/jamesward/koober
Here's the presentation about it:
https://www.youtube.com/watch?v=UEg40Te8pnE


---

Kafka web console. Useful utils.

https://www.youtube.com/watch?v=kby1aZBxU2I

---

Kafka-manager, a neat web-based Kafka command panel.
https://github.com/yahoo/kafka-manager

Kafka-topic
https://github.com/Landoop/kafka-topics-ui

---

Quick flash of a bunch of useful stuff:
(Kafka, Storm, Vertica, Zookeeper, with Docker-compose )
https://www.youtube.com/watch?v=U-Kn7-7m6Z8

---

Kafka-rest, a REST-ful library for Kafka.

https://github.com/confluentinc/kafka-rest

Some issues:
https://github.com/confluentinc/kafka-rest/issues/83

---

Confluent Kafka (Apache/kafka fork)
https://github.com/confluentinc/kafka.git

---

Example of docker-compose file for a cluster
https://github.com/confluentinc/cp-docker-images/blob/3.3.x/examples/kafka-cluster/docker-compose.yml

---

Ansible'ized setup for Kafka on AWS EC2 from Galaxy:

https://galaxy.ansible.com/giladju/setup-kafka-cluster-ec2/

---

Akka Stream Kafka stuff

http://doc.akka.io/docs/akka-stream-kafka/current/home.html

---

Some CLI Kafka stuff
https://www.cloudera.com/documentation/kafka/latest/topics/kafka_command_line.html

    $ ./kafka-consumer-groups.sh --zookeeper kafka.broker.com:2181 --list
    $ ./kafka-consumer-groups --zookeeper zk01.example.com:2181 --describe --group flume

---

To get the topic info from a cluster:

    $ ./kafka-topics.sh --zookeeper mynode1.om:2181,mynode2:2181 --list > topic_namesonly.txt 

    $ for topic in `cat topic_names_only.txt` ; do \
     ./kafka-topics.sh --zookeeper mynode1.om:2181,mynode2:2181 --describe --topic $topic ; \
     done | grep -v Partition: > topic_describe.txt 

Produces something like:

    ...
    Topic:mytopic	PartitionCount:12	ReplicationFactor:3	Configs:delete.retention.ms=34560000
    Topic:mytopic2	PartitionCount:12	ReplicationFactor:3	Configs:max.message.bytes=2000    
    ...

---

Apparently, to get the cluster going, I had to add explicit listeners to brokers .properties files, like so: 

    listeners=PLAINTEXT://0.0.0.0:9092
    advertised.listeners=PLAINTEXT://kafka-broker1.vm:9092

---

Simple sandbox scenario to play with:

On one machine run the console producer:

    $ ./kafka-console-producer.sh --broker-list kafka-broker1.vm:9092,kafka-broker2.vm:9092,kafka-broker3.vm:9092 --topic mytopic

On other three run three console consumers(same command line comand):

    $ ./kafka-console-consumer.sh --topic mytopic --bootstrap-server kafka-broker1.vm:9092,kafka-broker2.vm:9092,kafka-broker3.vm:9092 --consumer-property group.id=mygroup

To find out the group used if it was not specified, you can use zookeeper shell:

    $./bin/zookeeper-shell.sh kafka-zookeeper1.vm:2181
    ls /consumers


From another terminal, observe how the data is loadbalanced, and how the partitions are populated:

    $ ./kafka-consumer-groups.sh --describe --group mygroup --bootstrap-server kafka-broker1.vm:9092,kafka-broker2.vm:9092,kafka-broker3.vm:9092
    Note: This will only show information about consumers that use the Java consumer API (non-ZooKeeper-based consumers).

    TOPIC                          PARTITION  CURRENT-OFFSET  LOG-END-OFFSET  LAG        CONSUMER-ID                                       HOST                           CLIENT-ID
    mytopic                        8          1               1               0          consumer-1-a453d73f-415b-48d6-a654-9b57c7796319   /192.168.10.3                  consumer-1
    mytopic                        9          2               2               0          consumer-1-a453d73f-415b-48d6-a654-9b57c7796319   /192.168.10.3                  consumer-1
    mytopic                        10         2               2               0          consumer-1-a453d73f-415b-48d6-a654-9b57c7796319   /192.168.10.3                  consumer-1
    mytopic                        11         1               1               0          consumer-1-a453d73f-415b-48d6-a654-9b57c7796319   /192.168.10.3                  consumer-1
    mytopic                        0          2               2               0          consumer-1-05054af4-c8bf-4800-8034-a134b40f1d47   /192.168.10.56                 consumer-1
    mytopic                        1          2               2               0          consumer-1-05054af4-c8bf-4800-8034-a134b40f1d47   /192.168.10.56                 consumer-1
    mytopic                        2          1               1               0          consumer-1-05054af4-c8bf-4800-8034-a134b40f1d47   /192.168.10.56                 consumer-1
    mytopic                        3          2               2               0          consumer-1-05054af4-c8bf-4800-8034-a134b40f1d47   /192.168.10.56                 consumer-1
    mytopic                        4          1               1               0          consumer-1-18c24e86-db0b-42ed-8ee3-13b0dca5db11   /192.168.10.3                  consumer-1
    mytopic                        5          1               1               0          consumer-1-18c24e86-db0b-42ed-8ee3-13b0dca5db11   /192.168.10.3                  consumer-1
    mytopic                        6          2               2               0          consumer-1-18c24e86-db0b-42ed-8ee3-13b0dca5db11   /192.168.10.3                  consumer-1
    mytopic                        7          2               2               0          consumer-1-18c24e86-db0b-42ed-8ee3-13b0dca5db11   /192.168.10.3                  consumer-1

---

Simple way to see the statistics of the sytem on a vm. The fact that it prints it
one by line, could be a good feed for the kafka console producer/consumer:

    $ vmstat -a 1 -n 100
    procs -----------memory---------- ---swap-- -----io---- -system-- ------cpu-----
    r  b   swpd   free  inact active   si   so    bi    bo   in   cs us sy id wa st
    1  0      0 1569096 326080 993940    0    0    35    15   87  290  1  0 98  0  0
    0  0      0 1568900 326080 993952    0    0     0     0  250  658  1  0 99  0  0
    0  0      0 1568924 326080 993952    0    0     0     0  170  666  2  1 98  0  0
    0  0      0 1568924 326080 993952    0    0     0     0  192  564  1  1 99  0  0
    0  0      0 1568900 326080 993952    0    0     0     0  136  516  1  0 99  0  0
    1  0      0 1568900 326080 993952    0    0     0     0  134  520  1  1 99  0  0
    ^C

Now where the Kafka is:

    $ ./kafka-topics.sh --zookeeper 192.168.10.56:2181,192.168.10.57:2181 --replication-factor 2 --partitions 5 --topic myvmstat --create
    Created topic "myvmstat".

On consumer side:

    $ ./kafka-console-consumer.sh --zookeeper 192.168.10.56:2181,192.168.10.57:2181 --topic myvmstat

On producer side:

    $ vmstat -a 1 -n 100 | ./kafka-console-producer.sh --broker-list 192.168.10.61:9092,192.168.10.62 --topic myvmstat 

See the data stream in.

You can observe the offsets using a command like this:

    $ kafka-run-class.sh kafka.tools.GetOffsetShell --broker-list kafka-broker1.vm:9092,kafka-broker2.vm:9092,kafka-broker3.vm:9092 --topic mytopic --time -1
    mytopic:0:109

where -1 means the latest offset. And then '0' is the first partition, '109' is the latest offset (if we fed 102 messages)

---    

```kill -15 ``` on the Kafka process works if you put these into .properties file:

    controlled.shutdown.enable=true
    controlled.shutdown.max.retries=3
    controlled.shutdown.retry.backoff.ms=5000

---

"Yikes" error discussion
https://github.com/yahoo/kafka-manager/issues/148

---

Kafkacat utility overview (b.t.w there's kafkacat and kafka-cat. :-) ):

https://engineering.randrr.com/debugging-with-kafkacat-b4da80079f56


---

Nice summary about Kafka clients. Kafka Clients (At-Most-Once, At-Least-Once, Exactly-Once, and Avro Client) 

https://dzone.com/articles/kafka-clients-at-most-once-at-least-once-exactly-o

---


Kafka Security

http://kafka.apache.org/documentation/#security


---

Another Getting Started document, for CentOS 7
https://www.vultr.com/docs/how-to-install-apache-kafka-on-centos-7

---

Deleting a topic in Kafka:

1. Stop Kafka server.
2. Delete the topic directory (with ```rm -rf``` command).
3. Connect to Zookeeper instance: ```zookeeper-shell.sh host:port```,
   observe that the topic is there: ```ls /brokers/topics```
4. Remove the topic folder from ZooKeeper using ```rmr /brokers/topics/topic2die```
5. Restart Kafka server
6. Confirm if it was deleted or not by using this command ```kafka-topics.sh --list --zookeeper host:port```

If the cluster was setup with 'auto-create topics' flag, you need to make sure
the producers and consumers are not connected, or the topic will be auto-created.

---

Rebalancing topics (partition leaders, etc) in Kafka cluster:

https://blog.imaginea.com/how-to-rebalance-topics-in-kafka-cluster/

---