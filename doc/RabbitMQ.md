[Home](Readme.md)
# RabbitMQ

See Also:

  - [Kafka](Kafka.md)

---

**Contents**

- [Installing](RabbitMQ.md#installing)
- [Miscellaneous](RabbitMQ.md#miscellaneous)

---

## Installing

---

## Miscellaneous

---

Nice RabbitMQ utility.

https://github.com/RabbitMQSimulator/RabbitMQSimulator

---

Demos and presentations:

https://www.youtube.com/watch?v=GRPLRONVDWY

https://www.youtube.com/watch?v=kA8rPIDa388

---

Quick-and-dirty example how to spin off a RabbitMQ nodes, with node index MyInd

```bash
    $ docker run -d --hostname sandbox_rabbit${MyInd} --net=host -p 5672:5672 \
        -p 15672:15672 -p 4369:4369 --name cluster1_sandbox_rabbit${MyInd} \
        -v /opt/rabbitmq/sandbox_rabbitmq${MyInd}/lib:/var/lib/rabbitmq \
        -v /opt/rabbitmq/sandbox_rabbitmq${MyInd}/logs:/var/log/rabbitmq \
        -e RABBITMQ_ERLANG_COOKIE='xxxxxx' \
        -e RABBITMQ_DEFAULT_USER=admin \
        -e RABBITMQ_DEFAULT_PASS=xxxxx \
        -e RABBITMQ_NODE_TYPE=queue-disc \
        -e RABBITMQ_LOG_BASE=/var/log/rabbitmq \
        -e RABBITMQ_CLUSTER_NODES="rabbit@sandbox_rabbit1 rabbit@sandbox_rabbit2 rabbit@sandbox_rabbit3" \
        rabbitmqbase:latest
```

It is a three node cluster with a basic dockerized container.

---
