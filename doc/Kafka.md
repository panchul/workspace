

## Under Construction

# Kafka

[http://kafka.apache.org/](http://kafka.apache.org/) - Official Link

The overview is at https://kafka.apache.org/documentation/

List of clients for many languages:
https://cwiki.apache.org/confluence/display/KAFKA/Clients

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